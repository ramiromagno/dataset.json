
<!-- README.md is generated from README.Rmd. Please edit that file -->

# dataset.json <img src="man/figures/logo.svg" align="right" height="139" alt="" />

<!-- badges: start -->

[![R-CMD-check](https://github.com/ramiromagno/dataset.json/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/ramiromagno/dataset.json/actions/workflows/R-CMD-check.yaml)
[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
<!-- badges: end -->

Read and write [Dataset-JSON](https://www.cdisc.org/dataset-json) files.

## Installation

``` r
# install.packages("remotes")
remotes::install_github("ramiromagno/dataset.json")
```

## Example files

Examples [Dataset-JSON](https://www.cdisc.org/dataset-json) files are
borrowed from
[DataExchange-DatasetJson/examples](https://github.com/cdisc-org/DataExchange-DatasetJson/tree/master/examples).

For the bundled example files, run:

``` r
library(dataset.json)

print(ds_json_example_path(), n = Inf)
#> # A tibble: 33 × 4
#>    name    file         rel_path          abs_path                              
#>    <chr>   <chr>        <chr>             <chr>                                 
#>  1 adae    adae.json    adam/adae.json    /home/rmagno/R/x86_64-pc-linux-gnu-li…
#>  2 adcibc  adcibc.json  adam/adcibc.json  /home/rmagno/R/x86_64-pc-linux-gnu-li…
#>  3 adsl    adsl.json    adam/adsl.json    /home/rmagno/R/x86_64-pc-linux-gnu-li…
#>  4 adtte   adtte.json   adam/adtte.json   /home/rmagno/R/x86_64-pc-linux-gnu-li…
#>  5 ae_i18n ae_i18n.json sdtm/ae_i18n.json /home/rmagno/R/x86_64-pc-linux-gnu-li…
#>  6 ae      ae.json      sdtm/ae.json      /home/rmagno/R/x86_64-pc-linux-gnu-li…
#>  7 cm      cm.json      sdtm/cm.json      /home/rmagno/R/x86_64-pc-linux-gnu-li…
#>  8 dd      dd.json      sdtm/dd.json      /home/rmagno/R/x86_64-pc-linux-gnu-li…
#>  9 di      di.json      sdtm/di.json      /home/rmagno/R/x86_64-pc-linux-gnu-li…
#> 10 dm      dm.json      sdtm/dm.json      /home/rmagno/R/x86_64-pc-linux-gnu-li…
#> 11 ds      ds.json      sdtm/ds.json      /home/rmagno/R/x86_64-pc-linux-gnu-li…
#> 12 ec      ec.json      sdtm/ec.json      /home/rmagno/R/x86_64-pc-linux-gnu-li…
#> 13 ex      ex.json      sdtm/ex.json      /home/rmagno/R/x86_64-pc-linux-gnu-li…
#> 14 fa      fa.json      sdtm/fa.json      /home/rmagno/R/x86_64-pc-linux-gnu-li…
#> 15 ft      ft.json      sdtm/ft.json      /home/rmagno/R/x86_64-pc-linux-gnu-li…
#> 16 ie      ie.json      sdtm/ie.json      /home/rmagno/R/x86_64-pc-linux-gnu-li…
#> 17 lb      lb.json      sdtm/lb.json      /home/rmagno/R/x86_64-pc-linux-gnu-li…
#> 18 mh      mh.json      sdtm/mh.json      /home/rmagno/R/x86_64-pc-linux-gnu-li…
#> 19 oe      oe.json      sdtm/oe.json      /home/rmagno/R/x86_64-pc-linux-gnu-li…
#> 20 qsph    qsph.json    sdtm/qsph.json    /home/rmagno/R/x86_64-pc-linux-gnu-li…
#> 21 qssl    qssl.json    sdtm/qssl.json    /home/rmagno/R/x86_64-pc-linux-gnu-li…
#> 22 relrec  relrec.json  sdtm/relrec.json  /home/rmagno/R/x86_64-pc-linux-gnu-li…
#> 23 rs      rs.json      sdtm/rs.json      /home/rmagno/R/x86_64-pc-linux-gnu-li…
#> 24 se      se.json      sdtm/se.json      /home/rmagno/R/x86_64-pc-linux-gnu-li…
#> 25 suppdm  suppdm.json  sdtm/suppdm.json  /home/rmagno/R/x86_64-pc-linux-gnu-li…
#> 26 suppec  suppec.json  sdtm/suppec.json  /home/rmagno/R/x86_64-pc-linux-gnu-li…
#> 27 sv      sv.json      sdtm/sv.json      /home/rmagno/R/x86_64-pc-linux-gnu-li…
#> 28 ta      ta.json      sdtm/ta.json      /home/rmagno/R/x86_64-pc-linux-gnu-li…
#> 29 te      te.json      sdtm/te.json      /home/rmagno/R/x86_64-pc-linux-gnu-li…
#> 30 ti      ti.json      sdtm/ti.json      /home/rmagno/R/x86_64-pc-linux-gnu-li…
#> 31 ts      ts.json      sdtm/ts.json      /home/rmagno/R/x86_64-pc-linux-gnu-li…
#> 32 tv      tv.json      sdtm/tv.json      /home/rmagno/R/x86_64-pc-linux-gnu-li…
#> 33 vs      vs.json      sdtm/vs.json      /home/rmagno/R/x86_64-pc-linux-gnu-li…
```

## Read Dataset-JSON

Here is an example where you read a *Adverse Events* domain dataset:

``` r
# Example file: ae.json
ae <- read_ds_json(ds_json_example_path("ae"))

# Domain
ae@clinicalData@itemGroupData@name
#> [1] "AE"
ae@clinicalData@itemGroupData@label
#> [1] "Adverse Events"

# Dataset
ae@clinicalData@itemGroupData@itemData
#> # A tibble: 74 × 38
#>    ITEMGROUPDATASEQ STUDYID    DOMAIN USUBJID AESEQ AELNKID AETERM AELLT AELLTCD
#>               <dbl> <chr>      <chr>  <chr>   <dbl> <chr>   <chr>  <chr> <chr>  
#>  1                1 CDISCPILO… AE     CDISC0…     1 1       INJEC… <NA>  <NA>   
#>  2                2 CDISCPILO… AE     CDISC0…     2 2       FATIG… <NA>  <NA>   
#>  3                3 CDISCPILO… AE     CDISC0…     1 1       INJEC… <NA>  <NA>   
#>  4                4 CDISCPILO… AE     CDISC0…     2 2       SHOUL… <NA>  <NA>   
#>  5                5 CDISCPILO… AE     CDISC0…     3 3       JOINT… <NA>  <NA>   
#>  6                6 CDISCPILO… AE     CDISC0…     4 4       INCON… <NA>  <NA>   
#>  7                7 CDISCPILO… AE     CDISC0…     5 5       INJEC… <NA>  <NA>   
#>  8                8 CDISCPILO… AE     CDISC0…     6 6       SKIN … <NA>  <NA>   
#>  9                9 CDISCPILO… AE     CDISC0…     7 7       CONFU… <NA>  <NA>   
#> 10               10 CDISCPILO… AE     CDISC0…     8 8       DYSPN… <NA>  <NA>   
#> # ℹ 64 more rows
#> # ℹ 29 more variables: AEDECOD <chr>, AEPTCD <chr>, AEHLT <chr>, AEHLTCD <chr>,
#> #   AEHLGT <chr>, AEHLGTCD <chr>, AEBODSYS <chr>, AEBDSYCD <chr>, AESOC <chr>,
#> #   AESOCCD <chr>, AESEV <chr>, AESER <chr>, AEACN <chr>, AEREL <chr>,
#> #   AEOUT <chr>, AESCAN <chr>, AESCONG <chr>, AESDISAB <chr>, AESDTH <chr>,
#> #   AESHOSP <chr>, AESLIFE <chr>, AESOD <chr>, EPOCH <chr>, AESTDTC <chr>,
#> #   AEENDTC <chr>, AESTDY <dbl>, AEENDY <dbl>, AEENRTPT <chr>, AEENTPT <chr>
```

And here an example of an ADaM dataset: Subject-Level Analysis.

``` r
# Example file: adsl.json
adsl <- read_ds_json(ds_json_example_path("adsl"))

# Domain
adsl@clinicalData@itemGroupData@name
#> [1] "ADSL"
adsl@clinicalData@itemGroupData@label
#> [1] "Subject-Level Analysis"

# Dataset
adsl@clinicalData@itemGroupData@itemData
#> # A tibble: 254 × 50
#>    ITEMGROUPDATASEQ STUDYID   USUBJID SUBJID SITEID SITEGR1 ARM   TRT01P TRT01PN
#>               <dbl> <chr>     <chr>   <chr>  <chr>  <chr>   <chr> <chr>    <dbl>
#>  1                1 CDISCPIL… 01-701… 1015   701    701     Plac… Place…       0
#>  2                2 CDISCPIL… 01-701… 1023   701    701     Plac… Place…       0
#>  3                3 CDISCPIL… 01-701… 1028   701    701     Xano… Xanom…      81
#>  4                4 CDISCPIL… 01-701… 1033   701    701     Xano… Xanom…      54
#>  5                5 CDISCPIL… 01-701… 1034   701    701     Xano… Xanom…      81
#>  6                6 CDISCPIL… 01-701… 1047   701    701     Plac… Place…       0
#>  7                7 CDISCPIL… 01-701… 1097   701    701     Xano… Xanom…      54
#>  8                8 CDISCPIL… 01-701… 1111   701    701     Xano… Xanom…      54
#>  9                9 CDISCPIL… 01-701… 1115   701    701     Xano… Xanom…      54
#> 10               10 CDISCPIL… 01-701… 1118   701    701     Plac… Place…       0
#> # ℹ 244 more rows
#> # ℹ 41 more variables: TRT01A <chr>, TRT01AN <dbl>, TRTSDT <dbl>, TRTEDT <dbl>,
#> #   TRTDURD <dbl>, AVGDD <dbl>, CUMDOSE <dbl>, AGE <dbl>, AGEGR1 <chr>,
#> #   AGEGR1N <dbl>, AGEU <chr>, RACE <chr>, RACEN <dbl>, SEX <chr>,
#> #   ETHNIC <chr>, SAFFL <chr>, ITTFL <chr>, EFFFL <chr>, COMP8FL <chr>,
#> #   COMP16FL <chr>, COMP24FL <chr>, DISCONFL <chr>, DSRAEFL <chr>, DTHFL <chr>,
#> #   BMIBL <dbl>, BMIBLGR1 <chr>, HEIGHTBL <dbl>, WEIGHTBL <dbl>, …
```

## Write Dataset-JSON

TODO.

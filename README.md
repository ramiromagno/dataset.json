
<!-- README.md is generated from README.Rmd. Please edit that file -->

# dataset.json <img src="man/figures/logo.svg" align="right" height="139" alt="" />

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
<!-- badges: end -->

Read and write [Dataset-JSON](https://www.cdisc.org/dataset-json) files.

## Installation

``` r
# install.packages("remotes")
remotes::install_github("ramiromagno/dataset.json")
```

## Read Dataset-JSON

### Adverse Events domain

``` r
library(dataset.json)

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

### Subject-Level Analysis dataset

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

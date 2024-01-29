odm_type_to_tib_spec <- function(odm_types, json_attributes) {

  type_to_spec <-
    c(
      string = "tib_chr",
      integer = "tib_dbl", # no mistake here
      decimal = "tib_dbl",
      float = "tib_dbl",
      double = "tib_dbl",
      boolean = "tib_lgl"
    )

  tib_spec_funs <- unname(type_to_spec[odm_types])

  purrr::map2(tib_spec_funs, json_attributes, ~ eval(call(.x, .y)))

}

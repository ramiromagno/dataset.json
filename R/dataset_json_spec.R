toplevel_spec <- function() {

  tibblify::tspec_object(
    tib_chr("creationDateTime", required = TRUE),
    tib_chr("datasetJSONVersion", required = TRUE),
    tib_chr("fileOID", required = FALSE),
    tib_chr("asOfDateTime", required = FALSE),
    tib_chr("originator", required = FALSE),
    tib_chr("sourceSystem", required = FALSE),
    tib_chr("sourceSystemVersion", required = FALSE)
  )
}

pluck_top_level_data <- function(lst) {

  # Toplevel (scalar) elements
  tibblify::tibblify(lst, spec = toplevel_spec())
}

pluck_item_data <- function(lst, name, type, label) {

  if (is.null(lst))
    return(tibble::tibble())

  spec <- odm_type_to_tib_spec(type, name)
  named_item_data <- purrr::map(lst, ~ setNames(.x, name))
  item_data <- tibblify::tibblify(named_item_data, tibblify::tspec_df(!!!spec))

  # Convert empty strings to NA.
  item_data[item_data == ""] <- NA

  # Add labels to columns.
  item_data_lbl <-
    purrr::map2(item_data, label, ~ `attr<-`(.x, "label", .y)) |>
    tibble::as_tibble()

}

pluck_group_data <- function(lst) {

  if (is.null(lst))
    return(ds_json_group_data())

  # As per the documentation, the Dataset-JSON standard must contain only one
  # dataset per file, i.e. the `itemGroupData` should be an object with a
  # single attribute corresponding to an individual dataset.
  lst_item_group_data <- lst[[1]]

  item_group_data <-
    tibblify::tibblify(lst_item_group_data,
                       tibblify::tspec_object(
               tib_int("records", required = TRUE),
               tib_chr("name", required = TRUE),
               tib_chr("label", required = FALSE),
               tib_df(
                 "items",
                 tib_chr("OID"),
                 tib_chr("name"),
                 tib_chr("label"),
                 tib_chr("type"),
                 tib_int("length", required = FALSE),
                 tib_chr("displayFormat", required = FALSE),
                 tib_int("keySequence", required = FALSE)
               )
             ))

  ds_json_group_data(
    itemGroupOID = names(lst),
    records = item_group_data$records,
    name = item_group_data$name,
    label = item_group_data$label,
    items = item_group_data$items,
    itemData = pluck_item_data(
      lst = lst_item_group_data$itemData,
      name = item_group_data$items$name,
      type = item_group_data$items$type,
      label = item_group_data$items$label
    )
  )

}

pluck_data <- function(lst) {

  if (is.null(lst))
    return(ds_json_data())

  data <-
    tibblify::tibblify(lst,
                       tibblify::tspec_object(
               tib_chr("studyOID", required = FALSE),
               tib_chr("metaDataVersionOID", required = TRUE),
               tib_chr("metaDataRef", required = FALSE)
             ))

  ds_json_data(
    studyOID = data$studyOID,
    metaDataVersionOID = data$metaDataVersionOID,
    metaDataRef = data$metaDataRef,
    itemGroupData = pluck_group_data(lst$itemGroupData)
  )

}

pluck_cln_data <- function(lst) {
  pluck_data(lst$clinicalData)
}

pluck_ref_data <- function(lst) {
  pluck_data(lst$referenceData)
}


# clinical_data_spec <- function() {
#
#   tspec_object(
#     tib_row(
#       "clinicalData",
#       tib_chr("studyOID", required = FALSE),
#       tib_chr("metaDataVersionOID", required = FALSE),
#       tib_chr("metaDataRef", required = FALSE),
#     )
#   )
# }
#
# item_group_data_spec <- function() {
#   tspec_object(
#     tib_row(
#       "clinicalData",
#       tib_vector("itemGroupData", required = TRUE)
#     )
#   )
# }

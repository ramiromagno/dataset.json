#' Import a Dataset-JSON file as a list
#'
#' [import_ds_json()] is a simple wrapper around
#' [read_json_file()][yyjsonr::read_json_file] with sensible defaults.
#'
#' @param file A path to a Dataset-JSON file.
#'
#' @keywords internal
import_ds_json <- function(file) {
  opts <-
    yyjsonr::opts_read_json(obj_of_arrs_to_df = FALSE,
                            arr_of_objs_to_df = FALSE)

    yyjsonr::read_json_file(file, opts = opts)

}

#' Read a Dataset-JSON file
#'
#' [read_ds_json()] reads a Dataset-JSON into R.
#'
#' @param file A path to a Dataset-JSON file.
#'
#' @returns A [ds_json][dataset.json::ds_json] object.
#'
#' @export
#'
#' @examples
#' read_ds_json(ds_json_example_path("ae"))
#'
#' read_ds_json(ds_json_example_path("adsl"))
#'
read_ds_json <- function(file) {
  # Import Dataset-JSON data as an R list.
  lst <- import_ds_json(file)

  tl_data <- pluck_top_level_data(lst)
  cln_data <- pluck_cln_data(lst)
  ref_data <- pluck_ref_data(lst)

  ds_json(
    creationDateTime = tl_data$creationDateTime,
    datasetJSONVersion = tl_data$datasetJSONVersion,
    fileOID = tl_data$fileOID,
    asOfDateTime = tl_data$asOfDateTime,
    originator = tl_data$originator,
    sourceSystem = tl_data$sourceSystem,
    sourceSystemVersion = tl_data$sourceSystemVersion,
    clinicalData = cln_data,
    referenceData = ref_data
  )

}

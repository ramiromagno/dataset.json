#' An S7 class to represent the ItemGroupData element
#'
#' A `ds_json_group_data` classed object is used to represent ItemGroupData
#' element from the Dataset-JSON standard.
#'
#' @param itemGroupOID See ODM definition for study OID (ODM/Study/@@OID).
#' @param records The total number of records in a dataset.
#' @param name Dataset name.
#' @param label Dataset description.
#' @param items Basic information about variables (data frame).
#' @param itemData Dataset data (data frame).
#'
#' @export
ds_json_group_data <- S7::new_class(
  "ds_json_group_data",
  properties = list(
    itemGroupOID = S7::class_character,
    records = S7::class_integer,
    name = S7::class_character,
    label = S7::class_character,
    items = S7::class_data.frame,
    itemData = S7::class_data.frame
  )
)

#' An S7 class to represent ClinicalData and ReferenceData elements
#'
#' A `ds_json_data` classed object is used to represent either ClinicalData and
#' ReferenceData elements from the Dataset-JSON standard.
#'
#' @param studyOID See ODM definition for study OID (ODM/Study/@@OID).
#' @param metaDataVersionOID See ODM definition for metadata version OID (ODM/Study/MetaDataVersion/@@OID).
#' @param metaDataRef URL for a metadata file the describing the data.
#' @param itemGroupData Object containing dataset information.
#'
#' @export
ds_json_data <- S7::new_class(
  "ds_json_data",
  properties = list(
    studyOID = S7::class_character,
    metaDataVersionOID = S7::class_character,
    metaDataRef = S7::class_character,
    itemGroupData = S7::as_class(ds_json_group_data)
  )
)

#' An S7 class to represent Dataset-JSON data
#'
#' A `ds_json` classed object is the R counterpart of a Dataset-JSON file.
#'
#' @param creationDateTime Time of creation of the file containing the document.
#' @param datasetJSONVersion Version of Dataset-JSON standard.
#' @param fileOID A unique identifier for this file.
#' @param asOfDateTime The date/time at which the source database was queried in order to create this document.
#' @param originator The organization that generated the Dataset-JSON file.
#' @param sourceSystem The computer system or database management system that is the source of the information in this file.
#' @param sourceSystemVersion The version of the "SourceSystem" above.
#' @param clinicalData Contains clinical data across multiple subjects.
#' @param referenceData Contains non-subject data domains.
#'
#' @export
ds_json <- S7::new_class(
  "ds_json",
  properties = list(
    creationDateTime = S7::class_character,
    datasetJSONVersion = S7::class_character,
    fileOID = S7::class_character,
    asOfDateTime = S7::class_character,
    originator = S7::class_character,
    sourceSystem = S7::class_character,
    sourceSystemVersion = S7::class_character,
    clinicalData = S7::as_class(ds_json_data),
    referenceData = S7::as_class(ds_json_data)
  )
)

# S7::method(print, ds_json) <- function(x) {
#   print(tibble::as_tibble(x@clinicalData@itemGroupData@itemData))
#   print(tibble::as_tibble(x@referenceData@itemGroupData@itemData))
# }

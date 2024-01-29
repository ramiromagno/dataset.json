#' Dataset-JSON example file path
#'
#' [ds_json_example_path()] retrieves the local path to a bundled Dataset-JSON
#' example file.
#'
#' @param name The name of Dataset-JSON example. Run [ds_json_example_path()] to
#'   check available options, e.g. `ds_json_example_path("ae")`.
#'
#' @returns A character vector of absolute paths to Dataset-JSON example files.
#'
#' @examples
#' ds_json_example_path("ae")
#'
#' ds_json_example_path("adsl")
#'
#' @export
ds_json_example_path <- function(name = NULL) {

  pkg_name <- "dataset.json"
  examples_path <- system.file("examples", package = pkg_name, mustWork = TRUE)
  rel_path <- list.files(examples_path, recursive = TRUE)
  abs_path <- list.files(examples_path, recursive = TRUE, full.names = TRUE)
  file <- basename(rel_path)
  ds_name <- tools::file_path_sans_ext(tools::file_path_sans_ext(file))

  examples <-
    tibble::tibble(
      name = ds_name,
      file = file,
      rel_path = rel_path,
      abs_path = abs_path
    )

  if (is.null(name)) {
    return(examples)
  }

  does_name_exist <- name %in% examples$name
  if (!all(does_name_exist)) {
    stop("These example datasets are not available: ", name[does_name_exist])
  }

  examples$abs_path[match(name, examples$name)]
}

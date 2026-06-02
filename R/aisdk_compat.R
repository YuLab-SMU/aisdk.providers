#' Internal Compatibility Helpers
#'
#' Thin local wrappers over aisdk's exported "extension API". Keeping them as
#' local bindings means the provider implementations can call the helpers by
#' bare name, and tests can intercept the underlying HTTP/image calls with
#' `testthat::with_mocked_bindings(..., .package = "aisdk")` (which rebinds the
#' aisdk namespace at run time). They delegate to the exported aisdk functions
#' only -- no access to unexported internals.
#'
#' @keywords internal
#' @noRd
api_endpoint_urls <- function(config, path) {
  aisdk::api_endpoint_urls(config, path)
}

#' @keywords internal
#' @noRd
post_to_api <- function(url, headers, body, ...) {
  aisdk::post_to_api(url, headers, body, ...)
}

#' @keywords internal
#' @noRd
post_multipart_to_api <- function(url, headers, body, ...) {
  aisdk::post_multipart_to_api(url, headers, body, ...)
}

#' @keywords internal
#' @noRd
finalize_image_artifacts <- function(images, output_dir = tempdir(), prefix = "image") {
  aisdk::finalize_image_artifacts(images, output_dir = output_dir, prefix = prefix)
}

#' @keywords internal
#' @noRd
materialize_image_upload <- function(image, output_dir = tempdir(), prefix = "image") {
  aisdk::materialize_image_upload(image, output_dir = output_dir, prefix = prefix)
}

#' @keywords internal
#' @noRd
normalize_image_input_for_json <- function(image) {
  aisdk::normalize_image_input_for_json(image)
}

#' @keywords internal
#' @noRd
normalize_image_input_to_url_like <- function(image) {
  aisdk::normalize_image_input_to_url_like(image)
}

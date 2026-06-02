#' @keywords internal
#' @importFrom R6 R6Class
#' @importFrom rlang abort
#' @importFrom base64enc base64encode
#' @importFrom jsonlite toJSON
#' @importFrom curl curl_fetch_memory
#' @importFrom utils modifyList packageVersion
#' @importFrom aisdk OpenAILanguageModel OpenAIProvider AnthropicProvider GeminiProvider ImageModelV1
#' @importFrom aisdk OpenAIImageModel GenerateImageResult generate_model_docs
#' @importFrom aisdk list_get_exact create_anthropic create_gemini
#' @importFrom aisdk api_endpoint_urls post_to_api post_multipart_to_api
#' @importFrom aisdk finalize_image_artifacts materialize_image_upload
#' @importFrom aisdk normalize_image_input_for_json normalize_image_input_to_url_like
"_PACKAGE"

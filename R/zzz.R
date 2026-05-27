# Register this package's providers with the core aisdk provider registry so
# they are resolvable through the `provider:model` syntax. Registration is
# load-order independent (see aisdk::register_provider).
.onLoad <- function(libname, pkgname) {
  if (!requireNamespace("aisdk", quietly = TRUE)) {
    return(invisible())
  }
  rp <- aisdk::register_provider
  rp("deepseek", function() suppressWarnings(create_deepseek()))
  rp("xai", function() suppressWarnings(create_xai()))
  rp("volcengine", function() suppressWarnings(create_volcengine()))
  rp("nvidia", function() suppressWarnings(create_nvidia()))
  rp("stepfun", function() suppressWarnings(create_stepfun()))
  rp("bailian", function() suppressWarnings(create_bailian()))
  rp("openrouter", function() suppressWarnings(create_openrouter()))
  rp("aihubmix", function() suppressWarnings(create_aihubmix()))
  rp("moonshot", function() suppressWarnings(create_moonshot(platform = "platform")))
  rp("kimi", function() suppressWarnings(create_kimi_code(api_format = "anthropic")))
  invisible()
}

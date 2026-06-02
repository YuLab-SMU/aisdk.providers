# aisdk.providers

Additional AI model provider adapters for the
[aisdk](https://github.com/YuLab-SMU/aisdk) toolkit.

Covers OpenAI-compatible and Anthropic-compatible services: **DeepSeek**,
**Moonshot/Kimi**, **Stepfun**, **Volcengine**, **AiHubMix**, **xAI**,
**OpenRouter**, **Bailian**, and **NVIDIA**.

Providers register themselves with the core `aisdk` provider registry on load,
so they are resolvable through the `provider:model` syntax (e.g.
`get_default_registry()$language_model("deepseek:deepseek-chat")`).

## Installation

```r
install.packages("aisdk.providers")
```

You can install the development version from GitHub with:

```r
# install.packages("pak")
pak::pak("YuLab-SMU/aisdk.providers")
```

## Usage

```r
library(aisdk)
library(aisdk.providers)

model <- create_deepseek()
generate_text(model, "Hello")
```

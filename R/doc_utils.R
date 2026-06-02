# Documentation helpers. Kept internal (no exported Rd).

#' Render aisdk model documentation as ASCII-only Rd lines
#'
#' Thin wrapper around [aisdk::generate_model_docs()] used from `@eval`
#' roxygen tags. A few model descriptions in the core `aisdk` model metadata
#' are written in non-ASCII (e.g. Chinese) text, which a plain LaTeX
#' installation -- as used when CRAN builds the PDF reference manual --
#' cannot typeset. This wrapper replaces the descriptions of known models
#' with English text and, as a safety net, forces any remaining non-ASCII
#' text to ASCII so the manual always builds.
#'
#' @param provider Provider name passed to [aisdk::generate_model_docs()].
#' @return A character vector of ASCII-only Rd lines.
#' @keywords internal
#' @noRd
ascii_model_docs <- function(provider) {
  lines <- aisdk::generate_model_docs(provider)

  # English descriptions for models whose core-metadata description is
  # non-ASCII. Keyed by (ASCII) model id; the description segment of the
  # matching `\item` line is swapped for the English text below.
  english <- c(
    "doubao-pro-4k-functioncall-240615" =
      "Doubao Pro function-calling model (4K); suited to low-latency function-calling."
  )
  for (id in names(english)) {
    hit <- grepl(id, lines, fixed = TRUE)
    if (any(hit)) {
      lines[hit] <- sub(
        "(\\}: ).*( \\()",
        paste0("\\1", english[[id]], "\\2"),
        lines[hit]
      )
    }
  }

  # Safety net: force any remaining non-ASCII text to ASCII.
  non_ascii <- grepl("[^\x01-\x7f]", lines, useBytes = TRUE)
  if (any(non_ascii)) {
    lines[non_ascii] <- vapply(lines[non_ascii], function(x) {
      y <- iconv(x, to = "ASCII//TRANSLIT")
      if (is.na(y) || grepl("[^\x01-\x7f]", y, useBytes = TRUE)) {
        y <- iconv(x, to = "ASCII", sub = "")
      }
      if (is.na(y)) "" else y
    }, character(1), USE.NAMES = FALSE)
  }

  lines
}

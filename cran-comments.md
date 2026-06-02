## Test environments

* local macOS, R release

## R CMD check results

0 errors | 0 warnings | 1 note

* The note is the standard "New submission" note: this is the first CRAN
  submission of `aisdk.providers`.

(Local checks may additionally emit environmental notes, e.g. "unable to
verify current time" or an HTML Tidy version note; these are specific to the
local machine and not package issues.)

## Downstream dependencies

There are currently no downstream dependencies for this package.

## Comments

This is the first CRAN submission of `aisdk.providers`. It is a companion
package for `aisdk` (now on CRAN) and builds on that package's exported
extension API. All heavier dependencies are declared under Suggests and used
conditionally.

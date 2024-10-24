# Checks for publishing
# rhub::rhub_setup()

# rhub::rhub_doctor()

rhub::rhub_check(platforms = c(
  "linux",
  "macos",
  "macos-arm64",
  "windows"))

# devtools::spell_check()
# spelling::update_wordlist()


# Release on CRAN - confirm e-mail
devtools::release()
# devtools::submit_cran()


# Use the following to publish latest release to GitHub
usethis::use_github_release()

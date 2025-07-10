# `scoreto`

<!-- markdownlint-disable MD013 -->

Branch   |[![GitHub Actions logo](man/figures/GitHubActions.png)](https://github.com/richelbilderbeek/scoreto/actions)|[![Codecov logo](man/figures/Codecov.png)](https://about.codecov.io/)
---------|---------|---------
`main`   |[![R-CMD-check](https://github.com/richelbilderbeek/scoreto/actions/workflows/R-CMD-check.yaml/badge.svg?branch=main)](https://github.com/richelbilderbeek/scoreto/actions/workflows/R-CMD-check.yaml)    |[![codecov.io](https://codecov.io/github/richelbilderbeek/scorito/coverage.svg?branch=main)](https://app.codecov.io/github/richelbilderbeek/scorito/branch/main)
`develop`|[![R-CMD-check](https://github.com/richelbilderbeek/scoreto/actions/workflows/R-CMD-check.yaml/badge.svg?branch=develop)](https://github.com/richelbilderbeek/scoreto/actions/workflows/R-CMD-check.yaml) |[![codecov.io](https://codecov.io/github/richelbilderbeek/scorito/coverage.svg?branch=develop)](https://app.codecov.io/github/richelbilderbeek/scorito/branch/develop)

`scoreto` (rhymes on 'mosquito', not on 'didgeridoo') is an R package
to get an overview of all training activities relevant for SCoRe.

`scoreto` is used in [the SCoRe user documentation](https://nbisweden.github.io/SCoRe_user_doc/).

## Installation

```r
remotes::install_github("richelbilderbeek/scorito")
```

## I want to [contribute](CONTRIBUTING.md)

Awesome! See [`CONTRIBUTING.md`](CONTRIBUTING.md).

## Files used by continuous integration scripts

Filename                              |Descriptions
--------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------
[mlc_config.json](mlc_config.json)    |Configuration of the link checker, use `markdown-link-check --config mlc_config.json --quiet docs/**/*.md` to do link checking locally
[.spellcheck.yml](.spellcheck.yml)    |Configuration of the spell checker, use `pyspelling -c .spellcheck.yml` to do spellcheck locally
[.wordlist.txt](.wordlist.txt)        |Whitelisted words for the spell checker, use `pyspelling -c .spellcheck.yml` to do spellcheck locally
[.markdownlint.jsonc](.markdownlint.jsonc)|Configuration of the markdown linter, use `markdownlint "**/*.md"` to do markdown linting locally. The name of this file is a default name.
[.markdownlintignore](.markdownlintignore)|Files ignored by the markdown linter, use `markdownlint "**/*.md"` to do markdown linting locally. The name of this file is a default name.

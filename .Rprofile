# CRAN mirror
options(repos=structure(c(CRAN="https://stat.ethz.ch/CRAN")))

## Save the history in the home directory: note that it is not
## (by default) read from there but from the current directory
.Last <- function()
    if(interactive()) try(savehistory("~/.Rhistory"))

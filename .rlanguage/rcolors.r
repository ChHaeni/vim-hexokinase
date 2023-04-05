
# R color name to hex
col2hex <- function(name) {
    m <- col2rgb(name) / 255
    rgb(m[1, ], m[2, ], m[3, ])
}

# get hex colors of built-in color names
rcolors <- col2hex(colors())

# create file text
txt <- paste0("
\" R Color dictionnary function.

\" Creation     : 2023-04-05
\" Modification : ", format(Sys.time(), "%Y-%m-%d"), "
\" Maintainer   : Christoph Häni <christoph.haeni@bfh.ch>

fun! hexokinase#patterns#rcolors#RBuiltinColName()
	\" Return a dictionnary of the ", length(rcolors), " built-in color names in R
	\" see Rhelp: ?colors

\treturn {
", paste(
    sprintf("\t\t\t\t\\ '%s': '%s'", colors(), rcolors), 
    collapse = ",\n"), "
\t\t\t\\ }
endfun
")

# write to file
path_root <- system('git rev-parse --show-toplevel', intern = TRUE)
writeLines(txt, file.path(path_root, 'autoload/hexokinase/patterns/rcolors.vim'))

# tests:
# 'dodgerblue3'
# 'wheat4'

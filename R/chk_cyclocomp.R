
#' @include lists.R

cyclocomp_limit <- 50

CHECKS$cyclocomp <- make_check(

  description = "Functions are simple",
  tags = c("info", "code complexity"),
  preps = "cyclocomp",

  gp = function(state) {
    cyc <- state$cyclocomp
    long <- which(cyc$cyclocomp > cyclocomp_limit)
    funcs <- paste0(
      cyc$name[long],
      " (", cyc$cyclocomp[long], ")",
      collapse = ", "
    )
    paste0(
      "write short and simple functions. These functions have high
       cyclomatic complexity:", funcs, "."
    )
  },

  check = function(state) {
    if(inherits(state$cyclocomp, "try-error")) return(NA)
    all(state$cyclocomp$cyclocomp <= cyclocomp_limit)
  }
)

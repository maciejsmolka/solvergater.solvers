#' Gateway for 'L-shape' heat transfer problem
#'
#' Problem is 3-dimensional, currently not adaptive.
#'
#' @param wd character, working directory, the one containing
#' `run_heat.m` and `heat_with_gradient.m`.
#' @param engine character, computational engine, if missing or `NULL` a kind
#' of guessing is performed.
#' @param ... additional parameters passed to [solvergater::shell_solver()].
#'
#' @export
heat_solver <- function(wd = getwd(), engine = c("matlab", "octave"), ...) {
  if (missing(engine) || is.null(engine)) {
    engine <- guess_engine()
  }
  solver_cmd <- switch(engine,
                       matlab = "matlab -nojvm -batch",
                       octave = "octave -qfW --eval"
                       )
  solvergater::shell_solver(
    cmd = solver_cmd,
    nparams = 3,
    qoi_file = "qoi_value.dat",
    jacobian_file = "qoi_jacobian.dat",
    arg_combine_fn = function(x) {
      sprintf("\"run_heat(%s)\"", paste(x, collapse = ", "))
    },
    wd = wd,
    ...
  )
}

guess_engine <- function() {
  if (Sys.which("matlab") != "") {
    engine <- "matlab"
  } else if (Sys.which("octave") != "") {
    engine <- "octave"
  } else {
    stop("Engine not found", call. = FALSE)
  }
  engine
}

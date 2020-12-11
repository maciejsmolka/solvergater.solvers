#' Gateway for 'L-shape' heat transfer problem
#'
#' Problem is 3-dimensional, currently not adaptive.
#'
#' @param wd character, working directory.
#' @param ... additional parameters passed to [solvergater::shell_solver()].
#'
#' @export
heat_solver <- function(wd = getwd(), ...) {
  solvergater::shell_solver(
    cmd = "matlab -nojvm -batch",
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

#'
#' Gateway for Julen Alvarez-Aramberri's magnetotelluric (MT) problem solver
#'
#' Beware that the problem is 4-dimensional (x in [solvergater::run()]
#' must be numeric vector of length 4). Working directory (`wd` parameter value
#' or the current working directory) must contain `EXEC/MT` and `FILES/*`.
#'
#' @param ... additional params passed to [solvergater::shell_solver()]
#'
#' @export
#'
#' @examples
#' \dontrun{
#' library(solvergater.solvers)
#' mts <- mt_solver()
#' run(mts, c(1, 2, 3, 10), 70)
#' }
mt_solver <- function(...) {
  solver_path <- file.path("EXEC", "MT")
  solution_file <- file.path("FILES", "ip_output", "both_solution.dat")
  jacobian_file <- file.path("FILES", "ip_output", "both_jacobian.dat")
  solvergater::shell_solver(
    solver_path,
    nparams = 4,
    value_file = solution_file,
    gradient_file = jacobian_file,
    value_read_fn = solvergater::read_matrix(ncol = 3),
    gradient_read_fn = solvergater::read_matrix(ncol = 2),
    arg_combine_fn = function(x, precision) {
      paste(precision, "8 5 1.d16", paste(x, collapse = " "))
    },
    ...
  )
}

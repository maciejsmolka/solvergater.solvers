#' Gateway for Julen Alvarez-Aramberri's magnetotelluric (MT) problem solver
#'
#' Beware that the problem is 4-dimensional (x in [solvergater::compute_objective()]
#' must be numeric vector of length 4). `R` code must be run in a directory
#' containing `EXEC/MT` and `FILES/*`.
#'
#' @export
#'
#' @examples
#' \dontrun{
#' library(solvergater.solvers)
#' mts <- mt_solver()
#' compute_objective(mts, c(1, 2, 3, 10), 70)
#' }
mt_solver <- function() {
  solver_path <- file.path("EXEC", "MT")
  solution_file <- file.path("FILES", "ip_output", "both_solution.dat")
  jacobian_file <- file.path("FILES", "ip_output", "both_jacobian.dat")
  solvergater::extsolver_simple(
    solver_path,
    value_file = solution_file,
    gradient_file = jacobian_file,
    value_read_fn = solvergater::read_matrix(ncol = 3),
    gradient_read_fn = solvergater::read_matrix(ncol = 2),
    arg_combine_fn = function(x, precision) {
      paste(precision, "8 5 1.d16", paste(x, collapse = " "))
    }
  )
}

#'
#' Gateway for Julen Alvarez-Aramberri's magnetotelluric (MT) problem solver
#'
#' Beware that the problem is 4-dimensional (x in [solvergater::run()]
#' must be numeric vector of length 4).
#'
#' @param wd character, working directory: the one that contains `EXEC/MT`
#' and `FILES/*`.
#' @param ... additional params passed to [solvergater::shell_solver()].
#'
#' @export
#'
#' @examples
#' \dontrun{
#' library(solvergater.solvers)
#' mts <- mt_solver()
#' nparams(mts)
#' run(mts, c(1, 2, 3, 10), 70)
#' }
mt_solver <- function(wd = getwd(), ...) {
  solver_exec <- file.path("EXEC", "MT")
  output_dir <- file.path("FILES", "ip_output")
  solution_file <- file.path(output_dir, "both_solution.dat")
  jacobian_file <- file.path(output_dir, "both_jacobian.dat")
  max_iterations <- 8
  nparams <- 4
  air_resistivity_fortran <- "1.d16"
  const_prefix <- paste(max_iterations, nparams + 1,
                        air_resistivity_fortran)
  solvergater::shell_solver(
    solver_exec,
    nparams = nparams,
    qoi_file = solution_file,
    jacobian_file = jacobian_file,
    qoi_read_fn = solvergater::read_matrix(ncol = 3),
    jacobian_read_fn = solvergater::read_matrix(ncol = 2),
    arg_combine_fn = function(x, precision) {
      paste(precision, const_prefix, paste(x, collapse = " "))
    },
    wd = wd,
    ...
  )
}

mt_read_qoi <- function(file) {
  read_data <- solvergater::read_matrix(ncol = 3)
  raw_data <- read_data(file)
  complex(real = raw_data[, 2], imaginary = raw_data[, 3])
}

mt_read_jacobian <- function(file) {
  read_data <- solvergater::read_matrix(ncol = 2)
  raw_data <- read_data(file)
  v_jac <- complex(real = raw_data[, 1], imaginary = raw_data[, 2])
  nqoi <- 7
  matrix(v_jac, nrow = nqoi)
}

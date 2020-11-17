#' Data for MT problem
#'
#' @format A list with the following components:
#' \describe{
#'   \item{precision_levels}{available precision levels sorted from the most
#'   inaccurate; each next level increases significantly the time of
#'   computations.}
#'   \item{exact_qoi}{complex, QOI at 'exact' solution, i.e.
#'   `c(1, 2, 10, 3)`, computed with precision `1.2`.}
#' }
"mt_data"

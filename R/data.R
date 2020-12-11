#' Data for MT problem
#'
#' @format A list with the following components:
#' \describe{
#'   \item{nparams}{number of parameters;}
#'   \item{nqoi}{number of quantities of interest;}
#'   \item{max_iter}{maximum (sensible) number of iterations;}
#'   \item{precision_levels}{available precision levels sorted from the most
#'   inaccurate; each next level increases significantly the time of
#'   computations;}
#'   \item{exact_qoi}{complex, QOI at 'exact' solution, i.e.
#'   `c(1, 2, 10, 3)`, computed with precision `1.2`.}
#' }
"mt_data"

#' Data for L-shape heat transfer problem
#'
#' @format A list with the following components:
#' \describe{
#'   \item{exact_qoi}{numeric, QOI at 'exact' solution, i.e.
#'   `c(0.1, 1.5, 2.9)`.}
#' }
"heat_data"

## code to prepare `mt_data` dataset goes here
## mt_data$exact_qoi can be obtained through the following call:
## mt <- mt_solver()
## mt_data$exact_qoi <- run(mt, c(1, 2, 10, 3), precision = 1.2)$qoi
mt_data <- list(
  nparams = 4,
  nqoi = 7,
  max_iter = 8,
  precision_levels = c(60, 25, 14, 3.5, 1.7, 1.3, 1.2),
  exact_qoi = mt_read_qoi(file.path("data-raw", "mt_both_solution_1.2.dat"))
  )

usethis::use_data(mt_data, overwrite = TRUE)

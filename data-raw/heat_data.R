## code to prepare `heat_data` dataset goes here
## heat_data$exact_qoi can be obtained with the following call
## hs <- heat_solver()
## heat_data$exact_qoi <- run(hs, c(0.1, 1.5, 2.9))$qoi
heat_data <- list(
  exact_qoi = scan(file.path("data-raw", "heat_qoi_value_exact_ipse2011.dat"))
)
usethis::use_data(heat_data, overwrite = TRUE)

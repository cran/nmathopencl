## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

## ----eval = FALSE-------------------------------------------------------------
# nmath_dir <- system.file("cl", "nmath",           package = "nmathopencl")
# src_dir   <- system.file("cl", "ex_glmbayes_src", package = "nmathopencl")
# 
# # Load the pre-built dependency index (read once, reuse across calls)
# idx <- readRDS(file.path(nmath_dir, "kernel_dependency_index.rds"))
# 
# result <- extract_library_subset(
#     kernel_paths = list.files(src_dir, pattern = "\\.cl$", full.names = TRUE),
#     library_dir  = nmath_dir,
#     dest_dir     = "inst/cl/ex_glmbayes_nmath",
#     depends_tag  = "depends_nmath",
#     index        = idx
# )

## ----eval = FALSE-------------------------------------------------------------
# f2_f3_opencl_R <- function(family, link, b, y, x, mu, P, alpha, wt,
#                              use_opencl = TRUE) {
#   if (use_opencl && nmathopencl_has_opencl()) {
#     f2_f3_opencl(family, link, b, y, x, mu, P, alpha, wt, progbar = 0L)
#   } else {
#     f2_f3_non_opencl(family, link, b, y, x, mu, P, alpha, wt)
#   }
# }

## ----eval = FALSE-------------------------------------------------------------
# nmath_dir <- system.file("cl", "nmath", package = "nmathopencl")
# idx <- readRDS(file.path(nmath_dir, "kernel_dependency_index.rds"))
# 
# extract_library_subset(
#     kernel_paths = list.files("inst/cl/mypkg_src", "\\.cl$", full.names = TRUE),
#     library_dir  = nmath_dir,
#     dest_dir     = "inst/cl/mypkg_nmath",  # must exist
#     depends_tag  = "depends_nmath",
#     index        = idx
# )

## ----eval = FALSE-------------------------------------------------------------
# use_opencl_configure()


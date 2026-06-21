## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

## ----eval = FALSE-------------------------------------------------------------
# opencltools::load_kernel_source(relative_path, package = "nmathopencl")

## ----eval = FALSE-------------------------------------------------------------
# # Load the dnorm kernel entry-point file
# kernel_src <- opencltools::load_kernel_source("src/dnorm_kernel.cl",
#                                               package = "nmathopencl")
# 
# # Load a custom kernel from another package's inst/cl/
# my_kernel   <- opencltools::load_kernel_source("ex_glmbayes_src/f2_f3_binomial_logit.cl",
#                                    package = "nmathopencl")

## ----eval = FALSE-------------------------------------------------------------
# opencltools::load_kernel_library(subdir, package = "nmathopencl", verbose = FALSE)

## ----eval = FALSE-------------------------------------------------------------
# # Load the complete nmath library (all ~180 files)
# nmath_src <- opencltools::load_kernel_library("nmath", package = "nmathopencl")
# 
# # Load a smaller subset pre-curated for glmbayes kernels
# nmath_glm <- opencltools::load_kernel_library("ex_glmbayes_nmath",
#                                               package = "nmathopencl")
# 
# # Load with diagnostic output to trace the sort order
# nmath_src <- opencltools::load_kernel_library("nmath",
#                                               package = "nmathopencl",
#                                               verbose = TRUE)

## ----eval = FALSE-------------------------------------------------------------
# library(nmathopencl)
# 
# # 1. Load the nmath library (sorted automatically)
# nmath_src  <- opencltools::load_kernel_library("nmath", package = "nmathopencl")
# 
# # 2. Load the kernel entry-point
# kernel_src <- opencltools::load_kernel_source("src/dnorm_kernel.cl",
#                                               package = "nmathopencl")
# 
# # 3. Concatenate into a single program string
# program    <- paste(nmath_src, kernel_src, sep = "\n")

## ----eval = FALSE-------------------------------------------------------------
# # Load the curated nmath subset shipped inside nmathopencl
# # for use by a downstream package's kernels
# nmath_sub <- opencltools::load_kernel_library("ex_glmbayes_nmath",
#                                   package = "nmathopencl")
# 
# # Load a custom kernel from the same downstream package
# my_kernel <- opencltools::load_kernel_source("ex_glmbayes_src/f2_f3_binomial_logit.cl",
#                                  package = "nmathopencl")
# 
# program <- paste(nmath_sub, my_kernel, sep = "\n")

## ----eval = FALSE-------------------------------------------------------------
# write_kernel_dependency_index(library_dir, verbose = TRUE)

## ----eval = FALSE-------------------------------------------------------------
# # Regenerate after changing the nmath library
# nmath_dir <- system.file("cl", "nmath", package = "nmathopencl")
# write_kernel_dependency_index(nmath_dir, verbose = TRUE)

## ----eval = FALSE-------------------------------------------------------------
# load_library_for_kernel(kernel_path, library_dir,
#                         depends_tag = "all_depends",
#                         index = NULL)

## ----eval = FALSE-------------------------------------------------------------
# nmath_dir <- system.file("cl", "nmath", package = "nmathopencl")
# 
# # Load the index once
# idx <- readRDS(file.path(nmath_dir, "kernel_dependency_index.rds"))
# 
# # Re-use across multiple kernels --- only the subset for each kernel is read
# src_gaussian <- load_library_for_kernel(
#     kernel_path = system.file("cl", "ex_glmbayes_src",
#                               "f2_f3_gaussian.cl", package = "nmathopencl"),
#     library_dir = nmath_dir,
#     depends_tag = "depends_nmath",
#     index       = idx
# )
# src_gamma <- load_library_for_kernel(
#     kernel_path = system.file("cl", "ex_glmbayes_src",
#                               "f2_f3_gamma.cl", package = "nmathopencl"),
#     library_dir = nmath_dir,
#     depends_tag = "depends_nmath",
#     index       = idx
# )

## ----eval = FALSE-------------------------------------------------------------
# extract_library_subset(kernel_paths, library_dir, dest_dir,
#                        depends_tag = "all_depends",
#                        index = NULL,
#                        overwrite = FALSE)

## ----eval = FALSE-------------------------------------------------------------
# nmath_dir    <- system.file("cl", "nmath",           package = "nmathopencl")
# src_dir      <- system.file("cl", "ex_glmbayes_src", package = "nmathopencl")
# dest_dir     <- "inst/cl/mypkg_nmath"   # must exist
# 
# idx <- readRDS(file.path(nmath_dir, "kernel_dependency_index.rds"))
# 
# result <- extract_library_subset(
#     kernel_paths = list.files(src_dir, pattern = "\\.cl$", full.names = TRUE),
#     library_dir  = nmath_dir,
#     dest_dir     = dest_dir,
#     depends_tag  = "depends_nmath",
#     index        = idx
# )
# print(result)  # data frame: stem, source, dest, copied


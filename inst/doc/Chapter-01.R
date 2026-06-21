## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

## ----eval = FALSE-------------------------------------------------------------
# options(nmathopencl.quiet_opencl_startup = TRUE)

## ----eval = FALSE-------------------------------------------------------------
# library(nmathopencl)

## ----eval = FALSE-------------------------------------------------------------
# opencltools::has_opencl()   # opencltools build flag
# nmathopencl_has_opencl()                # nmathopencl build flag
# opencltools::diagnose_glmbayes()   # host/runtime report
# nmathopencl_has_opencl()           # nmathopencl compile-time flag

## ----eval = FALSE-------------------------------------------------------------
# # From CRAN or R-universe:
# install.packages("nmathopencl", type = "source")

## ----eval = FALSE-------------------------------------------------------------
# nmathopencl_has_opencl()
# #> [1] TRUE

## ----eval = FALSE-------------------------------------------------------------
# library(nmathopencl)
# 
# # nmathopencl compile-time flag
# nmathopencl_has_opencl()
# #> [1] TRUE
# 
# # opencltools compile-time flag (imported dependency)
# opencltools::has_opencl()
# #> [1] TRUE
# 
# # Host GPU inventory via opencltools (not the compile flag)
# opencltools::gpu_names()
# #> [1] "NVIDIA GeForce RTX 4090"
# 
# # Host/runtime diagnostic report (opencltools)
# opencltools::diagnose_glmbayes()

## ----eval = FALSE-------------------------------------------------------------
# x <- rnorm(1e7)
# system.time(dnorm_opencl(x, mean = 0, sd = 1))
# system.time(dnorm(x, mean = 0, sd = 1))


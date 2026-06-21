## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

## ----eval = FALSE-------------------------------------------------------------
# library(nmathopencl)
# 
# # TRUE if this nmathopencl build was compiled with USE_OPENCL
# nmathopencl_has_opencl()
# 
# # GPU device names on the host (opencltools --- system inventory)
# opencltools::gpu_names()

## ----eval = FALSE-------------------------------------------------------------
# x  <- rnorm(1e6)
# 
# # Density
# d  <- dnorm_opencl(x, mean = 0, sd = 1, log = FALSE)
# 
# # CDF --- same core arguments as stats::pnorm(q, mean, sd, lower.tail, log.p);
# #          plus opencl_parallel, fallback, verbose. Long outputs use recycling length.
# p <- pnorm_opencl(
#   rep(1.96, 1e6),
#   mean = 0,
#   sd = 1,
#   lower.tail = TRUE,
#   log.p = FALSE
# )
# 
# # Quantile (`qnorm_opencl` retains leading `n` + scalar `p`, unlike `stats::qnorm`-style vectors)
# q  <- qnorm_opencl(n = 1e6, p = 0.975, mean = 0, sd = 1)
# 
# # Random draws
# r  <- rnorm_opencl(n = 1e6, mean = 0, sd = 1)

## ----eval = FALSE-------------------------------------------------------------
# dgamma_opencl(n, x, shape = 2, scale = 1)
# pgamma_opencl(q, shape = 2, rate = 1)
# rgamma_opencl(n, shape = 2, scale = 1)
# # qgamma: use stats::qgamma(); the OpenCL kernel is internal-only
# # (device compile failure, see inst/OPENCL_KERNEL_KNOWN_FAILURES.md)

## ----eval = FALSE-------------------------------------------------------------
# dbinom_opencl(x, size = 10, prob = 0.3)
# pbinom_opencl(q, size = 10, prob = 0.3)
# qbinom_opencl(p, size = 10, prob = 0.3)
# rbinom_opencl(n, size = 10, prob = 0.3)

## ----eval = FALSE-------------------------------------------------------------
# dpois_opencl(x, lambda = 3)
# ppois_opencl(q, lambda = 3)
# qpois_opencl(p, lambda = 3)
# rpois_opencl(n, lambda = 3)

## ----eval = FALSE-------------------------------------------------------------
# dbeta_opencl(x, shape1 = 2, shape2 = 5)
# pbeta_opencl(q, shape1 = 2, shape2 = 5)
# rbeta_opencl(n, shape1 = 2, shape2 = 5)
# # qbeta: use stats::qbeta(); the OpenCL kernel is internal-only
# # (device link failure, see inst/OPENCL_KERNEL_KNOWN_FAILURES.md)

## ----eval = FALSE-------------------------------------------------------------
# # Log-gamma
# lgammafn_opencl(n, x)
# lgammafn_sign_opencl(n, x)
# 
# # Gamma function
# gammafn_opencl(n, x)
# 
# # Log-gamma at x+1
# lgamma1p_opencl(n, x)
# 
# # Digamma / polygamma
# digamma_opencl(n, x)
# trigamma_opencl(n, x)
# psigamma_opencl(n, x, deriv)
# 
# # Beta and log-beta
# beta_special_opencl(n, a, b)
# lbeta_special_opencl(n, a, b)
# 
# # Binomial coefficients
# choose_special_opencl(n_out, n, k)
# lchoose_special_opencl(n_out, n, k)
# 
# # Logspace arithmetic
# logspace_add_opencl(n, logx, logy)
# logspace_sub_opencl(n, logx, logy)
# logspace_sum_opencl(n, logx, logy)
# 
# # Math support
# fmax2_opencl(n, x, y)
# fmin2_opencl(n, x, y)

## ----eval = FALSE-------------------------------------------------------------
# # R-compatible power
# r_pow_opencl(n, x, y)
# r_pow_di_opencl(n, x, i)
# 
# # Miscellaneous math helpers
# log1pmx_opencl(n, x)
# log1pexp_opencl(n, x)
# log1mexp_opencl(n, x)
# pow1p_opencl(n, x, y)

## ----eval = FALSE-------------------------------------------------------------
# # Base RNG draws
# norm_rand_opencl(n)
# unif_rand_opencl(n)
# exp_rand_opencl(n)
# r_unif_index_opencl(n, dt)

## ----eval = FALSE-------------------------------------------------------------
# # Default --- surface GPU/build errors during development / local check with OpenCL enabled:
# dnorm_opencl(x)
# 
# # Permit CPU masking while OpenCL is flaky (not the development default):
# dnorm_opencl(x, fallback = TRUE, verbose = TRUE)


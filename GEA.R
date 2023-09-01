Sys.setenv('R_MAX_VSIZE'=320000000000000)

.libPaths("/global/scratch/users/victorcg/R")
library(vroom)

library(vegan)

# Read in the file in chunks
gen=vroom("/global/scratch/users/victorcg/RDA/raw_23grand_biallelic_varID_pruned0.5_sortFixed.raw", col_select=c(-1,-2,-3,-4,-5))

sum(is.na(gen))# 553,232 NAs in the matrix (~3% missing data)

saveRDS(gen, file="/global/scratch/users/victorcg/RDA/runs/gen.rds")

#similar to hellinger transformation
gen.imp <- apply(gen, 2, function(x) replace(x, is.na(x), as.numeric(names(which.max(table(x))))))
sum(is.na(gen.imp)) # No NAs
saveRDS(gen.imp, file="/global/scratch/users/victorcg/RDA/runs/gen_imp.rds")

env=read.csv("/global/scratch/users/victorcg/RDA/env-330_bioclim_elevation_230411_sorted.csv", header=T)

complete.rda= rda(gen.imp ~ bio1 + bio2 + bio3 + bio4 + bio5 + bio6 + bio7 + bio8 + bio9 + bio10 + bio11 + bio12 + bio13 + bio14 + bio15 + bio16 + bio17 + bio18 + bio19 + Condition(PC1) + Condition(PC2), data=env)

saveRDS(complete.rda, file="/global/scratch/users/victorcg/RDA/runs/complete_RDA.rds")

RsquareAdj(complete.rda)  # Total variance explained by the RDA
# Adj-R2 after removing effect of topography
RsquareAdj(rda(rda_hellinger ~ pH + dur + pho + nit + amm + oxy + dbo + Condition(das + alt + pen + deb), data = env))$adj.r.squared

##Global RDA significance
anova.cca(complete.rda, permutations = 999) #NOT an ANOVA
    #arg permutations gives the min # of permutations to assess if F value of a test is significant (Borcard, Gillet, and Legendre 2011).

##Axis significance
anova.cca(complete.rda, by = "axis")  # Test which axis are significant

##Terms (explanatory variables) significance
anova.cca(complete.rda, by = "terms")  # Test which terms are significant

sqrt(vif.cca(complete.rda))

library(packfor)

# global R2
global_r2 <- RsquareAdj(complete.rda)$adj.r.squared
global_r2

# Forward selection
fs <- forward.sel(gen.imp, # Y matrix
  env, # X matrix
  adjR2thresh = global_r2, # Set the adj.R2 threshold
  alpha = 0.001, # Set alpha level
  nperm = 999  # Number of permutations
)

fs #outputs that data is best modelled by incluseion of NUM explanatory variables

 

load.rda <- scores(complete.rda, choices=c(1:3), display="species")  # Species scores for the first three constrained axes


outliers <- function(x,z){
  lims <- mean(x) + c(-1, 1) * z * sd(x)     # find loadings +/-z sd from mean loading     
  x[x < lims[1] | x > lims[2]]               # locus names in these tails
}

cand1 <- outliers(load.rda[,1],3) # 38
cand2 <- outliers(load.rda[,2],3) # 69
cand3 <- outliers(load.rda[,3],3) # 34

ncand <- length(cand1) + length(cand2) + length(cand3)
ncand
cand1 <- cbind.data.frame(rep(1,times=length(cand1)), names(cand1), unname(cand1))
cand2 <- cbind.data.frame(rep(2,times=length(cand2)), names(cand2), unname(cand2))
cand3 <- cbind.data.frame(rep(3,times=length(cand3)), names(cand3), unname(cand3))

colnames(cand1) <- colnames(cand2) <- colnames(cand3) <- c("axis","snp","loading")

cand <- rbind(cand1, cand2, cand3)
cand$snp <- as.character(cand$snp)

pred=data.frame(elev_clean[,29:47])


foo <- matrix(nrow=(ncand), ncol=19)  # 8 columns for 8 predictors
colnames(foo) <- c("bio1","bio2","bio3","bio4","bio5","bio6","bio7","bio8", "bio9", "bio10", "bio11", "bio12", "bio13", "bio14", "bio15", "bio16", "bio17", "bio18", "bio19")

for (i in 1:length(cand$snp)) {
  nam <- cand[i,2]
  snp.gen <- gen.imp[,nam]
  foo[i,] <- apply(pred,2,function(x) cor(x,snp.gen))
}

cand <- cbind.data.frame(cand,foo)  
head(cand)

length(cand$snp[duplicated(cand$snp)])
foo <- cbind(cand$axis, duplicated(cand$snp)) 
table(foo[foo[,1]==1,2]) 
table(foo[foo[,1]==2,2]) 
table(foo[foo[,1]==3,2]) 
cand <- cand[!duplicated(cand$snp),] # remove duplicate detections

for (i in 1:length(cand$snp)) {
  bar <- cand[i,]
  cand[i,23] <- names(which.max(abs(bar[4:22]))) # gives the variable
  cand[i,24] <- max(abs(bar[4:22]))              # gives the correlation


colnames(cand)[23] <- "predictor"
colnames(cand)[24] <- "correlation"

table(cand$predictor) 

cor=cand[order(cand$correlation),]
```
 

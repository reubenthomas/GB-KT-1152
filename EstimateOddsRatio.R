rm(list = ls())
setwd("~/Dropbox (Gladstone)/GB-KT-1192")
require(dplyr)
Data <- read.csv("GB-KT-1192_Drug_adverse_effects_Edited.csv", header = T)

SingleDrugTrials <- names(table(Data$Drug)[table(Data$Drug) == 1])

##remove rows for single drug trial
sub_Data <- filter(Data, Drug != SingleDrugTrials[1] & Drug != SingleDrugTrials[2] & Drug != SingleDrugTrials[3])
sub_Data$Drug <- droplevels(sub_Data$Drug)

sub_Data <- data.frame(sub_Data, NSideEffects=(sub_Data$Severe + sub_Data$Not_severe))
sub_Data$Drug <- relevel(sub_Data$Drug, ref = "Placebo")

FitData <- NULL
for(i in 1:nrow(sub_Data)) {
  Case <- rep(0, sub_Data$Study[i])
  TempData <- data.frame(Drug=rep(sub_Data$Drug[i], sub_Data$Study))
}
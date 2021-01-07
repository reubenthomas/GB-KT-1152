rm(list = ls())
setwd("~/Dropbox (Gladstone)/GB-KT-1192")
require(dplyr)
require(survival)
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
  if(sub_Data$NSideEffects[i] > 0)
    Case[1:sub_Data$NSideEffects[i]] <- 1
  
  Severe <- rep(0, sub_Data$Study[i])
  if(sub_Data$Severe[i] > 0)
    Severe[1:sub_Data$Severe[i]] <- 1
  
  Not_severe <- rep(0, sub_Data$Study[i])
  if(sub_Data$Not_severe[i] > 0)
    Not_severe[1:sub_Data$Not_severe[i]] <- 1
  
  TempData <- data.frame(StudyID=rep(sub_Data$Study.ID[i], sub_Data$Study[i]),Drug=rep(sub_Data$Drug[i], sub_Data$Study[i]), Case=Case, Severe, Not_severe)
  FitData <- rbind(FitData, TempData)
}
FitData <- data.frame(FitData)
FitData$Drug <- relevel(FitData$Drug, ref = "RAD001")



clogitFit <- clogit(Case ~ Drug + strata(StudyID), data = FitData)
summary(clogitFit)

require(lme4)
glmerFit <- glmer(Case ~ (1|StudyID) + Drug, data = FitData, family = "binomial")
summary(glmerFit)

glmerFit1 <- glmer(Severe ~ (1|StudyID) + Drug, data = FitData, family = "binomial")
summary(glmerFit1)

glmerFit2 <- glmer(Not_severe ~ (1|StudyID) + Drug, data = FitData, family = "binomial")
summary(glmerFit2)


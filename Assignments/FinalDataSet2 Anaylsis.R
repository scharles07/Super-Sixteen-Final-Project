library("rcompanion")
library("car")
library("effects")
library("multcomp")
library("IDPmisc")
library("dplyr")
library("psych")
library("AICcmodavg")

View(FinalDataset2_1_)

#Determine if EFFY Grand Total and C2019_B Grand Total is the same mean.

EFFYGandTotal <- mean(FinalDataset2_1_$`EFFY Grand Total`)
#884.83
C_BGandTotal <- mean(FinalDataset2_1_$`C_B Grand Total`)
#3746.06
EFFYandC_BTotalAverage<-(EFFY + C_B)/2
#2315.445
t.ind <- t.test(4630.89,2315.445,paired=FALSE)
#I found out form the t-test that EFFYGrand Total and C_BGrand Total differ from each other.


library(ggplot2)
library("gmodels")
library("dplyr")
library(tidyverse)
library("tidyr")
library("rcompanion")
library("car")


#Histogram
#Normality - Need to examine both EFfY Grand Total and C_B Grand Total

plotNormalHistogram(FinalDataset2_1_$`EFFY Grand Total`)

plotNormalHistogram(FinalDataset2_1_$`C_B Grand Total`)

#Squareroot

FinalDataset2_1_$EFFYGrandTotalsq <- FinalDataset2_1_$`EFFY Grand Total` * FinalDataset2_1_$`EFFY Grand Total`
plotNormalHistogram(FinalDataset2_1_$EFFYGrandTotalsq)

FinalDataset2_1_$C_BGrandTotalsq <- FinalDataset2_1_$`C_B Grand Total` * FinalDataset2_1_$`C_B Grand Total`
plotNormalHistogram(FinalDataset2_1_$C_BGrandTotalsq)
# That looks better as well.  Use Squared for both of them.

### Homogeneity of Variance
leveneTest(EFFYGrandTotalsq ~ DegreesMajors, data=FinalDataset2_1_)

## Running the Analysis

ANOVA1 <- lm(EFFYGrandTotalLOG ~ Degrees.Majors, data=FinalDataset2_1_)
Anova(ANOVA1, Type="II", white.adjust=TRUE)

#PostHocs
postHocs <- glht(ANCOVA,linfct=mcp(EFFYGandTotal = "Degree")
summary(postHocs)

#Examining the mean
FinalDataset2_1_Means <-FinalDataset2_1_ %>% group_by(Degrees.Majors) %>% summarize(Mean = mean(EFFYGrandTotal))


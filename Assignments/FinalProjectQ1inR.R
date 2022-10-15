#Final Project looking at Educational Program data
FinalDataset2
#Determine if the mean of the women attending all education programs, is the 
#same as the mean of men attending all education programs.

#To see if these genders have the same mean, I will use an independent t-test

#H0: mu1 = mu1 H1: mu1 does not equal mu2

AvgWomen <- mean(FinalDataset2$Grand.Total.Women)
#520.66
#Area probability .70
AvgWomen1 <- mean(FinalDataset2$Grand.Total.Women.1)
#2151.62
#Area probability .70
AvgWomenA <- (AvgWomen + AvgWomen1)/2
#1336.14
#Area of probability .61
#t-tests ran in a calculator at https://davidmlane.com/hyperstat/z_table.html 
#gave area of probability on normal distribution curves.

AvgMen <- mean(FinalDataset2$Grand.Total.Men)
#364.18
AvgMen1 <- mean(FinalDataset2$Grand.Total.Men.1)
#1594.44
AvgMenA <- (AvgMen + AvgMen1)/2
#979.31

t.ind <- t.test(1336.14, 979.31, paired = FALSE)
#Since this code would not run, I ran a t-test in Excel and indeed, the 
#difference between men and women in these educational programs is very 
#significant with pvalues listed with scientific notation.

library(ggplot2)
library("gmodels")
library("dplyr")
library(tidyverse)
library("tidyr")
library("rcompanion")
library("car")

#Let's do an ANOVA to also see the relationship of short program enrollment in 
#relation to majors/degrees
#For example, what is the difference of short program (certificate) enrollment 
#in tech programs?

# Wrangling Data - data has been wrangled previously

# Testing assumptions

# Normality
plotNormalHistogram(FinalDataset2$EFFY.Grand.Total)

#Square root it
FinalDataset2$EFFY.Grand.Total.SQRT <- sqrt(FinalDataset2$EFFY.Grand.Total)
plotNormalHistogram(FinalDataset2$EFFY.Grand.Total.SQRT)
#Still needs more towards normalcy
plotNormalHistogram(log(FinalDataset2$EFFY.Grand.Total.SQRT))

FinalDataset2$EFFY.Grand.TotalLOG <- log(FinalDataset2$EFFY.Grand.Total)
plotNormalHistogram(FinalDataset2$EFFY.Grand.TotalLOG)

# Homogeneity of Variance
bartlett.test(EFFY.Grand.TotalLOG ~ Degrees.Majors, data=FinalDataset2)
# Does not meet the assumption for homogeneity of variance

# Do the Test, with unequal variance
ANOVA1 <- lm(EFFY.Grand.TotalLOG ~ Degrees.Majors, data=FinalDataset2)
Anova(ANOVA1, Type="II", white.adjust=TRUE)

# Looks like there is a significant difference in degrees and majors by short 
#program students. 
# Let's see more about that in post hoc.

# Do the Post Hocs with unequal variance
pairwise.t.test(FinalDataset2$EFFY.Grand.TotalLOG, FinalDataset2$Degrees.Majors, p.adjust="bonferroni", pool.sd = FALSE)

# Find means and draw conclusions
FinalDataset2Means <- FinalDataset2 %>% group_by(Degrees.Majors) %>% summarize(Mean = mean(EFFY.Grand.Total))
View(FinalDataset2Means)
#All of the short programs in EFFY.Grand.Total have an average enrollment per 
#institution of 3,746. Of eight Tech-related degrees and majors, three majors 
#were in the top ten in average total enrollments: Traditional and Votech (8,663), 
#Mixed and Votech (9,912), and Nontraditional and Votech (9,557) all with at 
#least 8,600 enrollments per institution. It looks like a variety of Votech 
#majors are quite popular for study. For contrast, the top three amount of 
#enrollments in the short program schools would be research topics for 
#doctorates, Mixed (of traditional majors and nontraditional majors), and 
#traditional majors. Many of the majors mix a variety of majors into one 
#classification. 


# Let's take a closer look at what types of educational programming attract
#women students regardless of degree or major. 
#How does the type of degrees or certificates offered by an institution 
#(InstCatOfProg) (IV) (has coding of 1-6 and -1 and -2 where 4 as Associate's 
#and certificates and 6 as under Bachelor's without a degree are most relevant) 
#influence the overall enrollment of women enrolled in short programs 
#(Grand.Total.Women.1) (DV), holding the type of major (Degrees.Majors)(CV) 
#constant? Using FinalDataset2 dataset.

library(IDPmisc)
library("psych")
library("effects")
library("multcomp")

#Data Wrangling

str(FinalDataset2$"InstCatOfProg")
FinalDataset2$"InstCatOfProg" <- as.factor(FinalDataset2$"InstCatOfProg")
str(FinalDataset2$"InstaCatOfProg")

str(FinalDataset2$Grand.Total.Women.1)
FinalDataset2$Grand.Total.Women.1 <- as.numeric(FinalDataset2$Grand.Total.Women.1)
str(FinalDataset2$Grand.Total.Women.1)

str(FinalDataset2$Degrees.Majors)
FinalDataset2$Degrees.Majors <- as.factor(FinalDataset2$Degrees.Majors)
str(FinalDataset2$Degrees.Majors)

#Testing Assumptions

FinalDataset2C <- NaRV.omit(FinalDataset2)

plotNormalHistogram(FinalDataset2C$Grand.Total.Women.1)

FinalDataset2C$Grand.Total.Women.1SQRT <- sqrt(FinalDataset2C$Grand.Total.Women.1)
plotNormalHistogram(FinalDataset2$Grand.Total.Women.1SQRT)

#After trying moving the data, I keep getting "inf" so we can't make it normal

# Testing assumptions
install.packages("hms")
install.packages("tidyverse")
install.packages("car")

HVFinalDataset <- leveneTest(FinalDataset2$Grand.Total.Women.1, FinalDataset2$InstCatOfProg)
HVFinalDataset

#There is a significant difference in the variance of these variables since 
#the pvalue was very significant (under .05)

#Test the covariant for homogeneity of variance.
Homogeneity_RegrSlp <- lm(FinalDataset2$Grand.Total.Women.1~FinalDataset2$Degrees.Majors)
anova(Homogeneity_RegrSlp)

#Since this p-value was significant, the type of degree and major is not 
#important/impactful for women in short programs and so it should not be used 
#as a covariant.




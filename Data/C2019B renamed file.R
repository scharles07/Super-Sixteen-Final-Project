
names(C2019_B)
View(C2019_B)
#subset()
summary(C2019_B$CSTOTLT)

#CREATE A SUBSET DATASET BASED ON CSTOTLT>20
subset(C2019_B,CSTOTLT>20)
C2019_B_CSTOTLT20=subset(C2019_B,CSTOTLT>20)

#CREATE A SUBSET DATASET BASED ON CSBKAATT>20
#subset()
summary(C2019_B$CSBKAAT)
subset(C2019_B,CSBKAAT>20)

C2019_B_CSBKAAT20=subset(C2019_B,CSBKAAT>20)
summary(C2019_B_CSBKAAT20$CSBKAAT)

#rename column 
data <- C2019_B
data <-rename(data, Grand Total = CSTOTLT)
library(dplyr)
C2019_B.renamed <-rename(C2019_B,"Grand Total"= "CSTOTLT",
                                 "Grand Total Men "= "CSTOTLM",
                                 "Grand Total Women "= "CSTOTLW",
                                  "American Indians" = "CSAIANT",
                                  "American Indians Native Men" = "CSAIANM",
                                  "American Indians Native Women" = "CSAIANW",
                                  "Asian Total" = "CSASIAT", 
                                  "Asian Total Men" ="CSASIAM",
                                  "Asian Total Women" = "CSASIAW",
                                  "Blacks or African Americans in Total " = "CSBKAAT",
                                 "Blacks or African Americans Men  " = "CSBKAAM",
                                  "Blacks or African Americans Women  " = "CSBKAAW",
                                  "Hispanics and Latino in Total " = "CSHISPT",
                                  "Hispanics and Latino Men " =  "CSHISPM", 
                                 "Hispanics and Latino Women " =   "CSHISPW" , 
                                 "Native Hawaiian or Other Pacific Islanders in Total" =  "CSNHPIT", 
                                  "Native Hawaiian or Other Pacific Islanders Men " = "CSNHPIM", 
                                  "Native Hawaiian or Other Pacific Islanders Women" ="CSNHPIW", 
                                  "White Total" ="CSWHITT",
                                  "White Men" = "CSWHITM", 
                                  "White Women" ="CSWHITW",   
                                  "Two or more races total " ="CS2MORT", 
                                  "Two or more races Men " ="CS2MORM",
                                   "Two or more races Women " ="CS2MORW",
                                   "Race or ethnitcty unknown total " = "CSUNKNT",
                                   "Race or ethnitcty unknown Men" = "CSUNKNM", 
                                   "Race or ethnitcty unknown Women" ="CSUNKNW",
                                     "Non resident alien total" ="CSNRALT",
                                     "Non resident alien Men" ="CSNRALM" ,
                                     "Non resident alien Women"  ="CSNRALW")
                                            
names(C2019_B.renamed)      



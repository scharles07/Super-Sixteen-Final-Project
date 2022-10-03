library("tidyr")
library("dplyr")

#subsetting using for each level of student

AllStudents.EFFY <- filter(EFFY2019AClean, Level.of.Student == 1)

UnderGradStudents.EFFY <- filter(EFFY2019AClean, Level.of.Student == 2)

GradStudents.EFFY <- filter(EFFY2019AClean, Level.of.Student == 4)


#renaming each column in each subset table 

##All Students
names(AllStudents.EFFY)[names(AllStudents.EFFY) == "Grand.Total"] <-"AllStudents.Total-EFFY"
names(AllStudents.EFFY)[names(AllStudents.EFFY) == "Grand.Total.Men"] <-"AllStudents.Men-EFFY"
names(AllStudents.EFFY)[names(AllStudents.EFFY) == "Grand.Total.Women"] <-"AllStudents.Women-EFFY"

##UnderGrad Students
names(UnderGradStudents.EFFY)[names(UnderGradStudents.EFFY) == "Grand.Total"] <-"UnderGrad.Total-EFFY"
names(UnderGradStudents.EFFY)[names(UnderGradStudents.EFFY) == "Grand.Total.Men"] <-"UnderGrad.Men-EFFY"
names(UnderGradStudents.EFFY)[names(UnderGradStudents.EFFY) == "Grand.Total.Women"] <-"UnderGrad.Women-EFFY"

##Graduate Students
names(GradStudents.EFFY)[names(GradStudents.EFFY) == "Grand.Total"] <-"Grad.Total-EFFY"
names(GradStudents.EFFY)[names(GradStudents.EFFY) == "Grand.Total.Men"] <-"Grad.Men-EFFY"
names(GradStudents.EFFY)[names(GradStudents.EFFY) == "Grand.Total.Women"] <-"Grad.Women-EFFY"

#Dropping Level of Student column in each subset table
All.StudentsEFFY <- AllStudents.EFFY %>% select(UNITID, "AllStudents.Total-EFFY", "AllStudents.Men-EFFY", "AllStudents.Women-EFFY")

UndergradStudents.EFFY <- UnderGradStudents.EFFY %>% select(UNITID, "UnderGrad.Total-EFFY", "UnderGrad.Men-EFFY", "UnderGrad.Women-EFFY")

GraduateStudents.EFFY <- GradStudents.EFFY %>% select(UNITID, "Grad.Total-EFFY", "Grad.Men-EFFY", "Grad.Women-EFFY")

#Renaming C2019_B Columns- too ambiguous 
names(C2019_B.clean.data)[names(C2019_B.clean.data) == "Grand.Total"] <- "Awards/Degrees.Total"
names(C2019_B.clean.data)[names(C2019_B.clean.data) == "Grand.Total.Men"] <- "Awards/Degrees.Men"
names(C2019_B.clean.data)[names(C2019_B.clean.data) == "Grand.Total.Women"] <- "Awards/Degrees.Women"

#Dropping number column in C2019_B
C2019_B.clean.data2 <- C2019_B.clean.data %>% select(UNITID, 'Awards/Degrees.Total', 'Awards/Degrees.Men', 'Awards/Degrees.Women')

#Joining 

CompleteDataset <- merge(HD2019_clean,C2019_B.clean.data2, by= c("UNITID"), all= TRUE)

CompleteDataset2 <- merge(CompleteDataset, All.StudentsEFFY, by= c("UNITID"), all = TRUE)

CompleteDataset3 <- merge(CompleteDataset2, UndergradStudents.EFFY, by= c("UNITID"), all = TRUE)

FinalDataset <- merge(CompleteDataset3, GraduateStudents.EFFY, by = c("UNITID"), all= TRUE)

#Exporting final joined dataset as CSV

write.table(FinalDataset, file = "C:/Users/Sabri/OneDrive/Documents/Data Science Program/FinalDataset.csv", sep = ",")



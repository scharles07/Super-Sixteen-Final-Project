# For this second question for the final project looking at higher education
#and certificate programs, we will look at how available these programs are per 
#region and or per degree of urbanization. Using the FinalDataset2.
library(gmodels)
library(dplyr)
#Let's look at region first
CrossTable(FinalDataset2$DegreeGrantingYN, FinalDataset2$Region, chisq = TRUE, expected = TRUE, sresid = TRUE, format = "SPSS")
CrossTable(FinalDataset2$DegreeGrantingYN, FinalDataset2$DegreeOfUrban, chisq = TRUE, expected = TRUE, sresid = TRUE, format = "SPSS")
# The p-value is 2.982168e-16, and 1.041913e-58 so there is a very significant 
#relationship between the degree granting status (Y/N) and the region.
# All expected values are over 5 so the assumptions are met but not for the 
#second chi-square. Most residuals are greater than - or + 2
# There are two types of degree granting status in this data: 1 for yes and 
#2 for no. Degrees range from associates to doctorate and do not include 
#certification. No degrees mean any other type of accomplishment that is not a 
#degree and include certification.
# There are 10 regions coded 0-9: US service schools, New England, Mid East, 
#Great Lakes, Plains, South East, Southwest, Rocky Mountains, Far West, and 
#other US Territories. This chi-square is hard to read because it is so big 
#and the console can only be expanded so far! I think I will run it in Python
#too to see if I can read it well. 
#Ok, looking at the data in Python, we have more schools granting degrees
#and not granting degrees in the Southeast (AL, AR, L, GA, KY, LA, MS, NC, 
#SC, TN, VA, WV), Mid East (DE, DC, MD, NJ, NY, PA), and in the Far West (AK, 
#CA, HI, NV, OR, WA) and in large cities, large suburbs, and small cities.



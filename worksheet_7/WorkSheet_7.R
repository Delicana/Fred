#1. Create a data frame for the table below 

Student <- seq(1:10)
Pre_Test <- c(55,54,47,57,51,61,57,54,63,58)
Post_Test <- c(61,60,56,63,56,63,59,56,62,61)

D_F <- data.frame(Student,Pre_Test,Post_Test)
D_F

#a. Compute the descriptive statistics using different packages (Hmisc and pastecs).

#Write the codes and its result.

library(Hmisc)
library(pastecs)

describe(D_F)

stat.desc(D_F)

#2. The Department of Agriculture was studying the effects of several levels of a
#fertilizer on the growth of a plant. For some analyses, it might be useful to convert
#the fertilizer levels to an ordered factor.

DepartmentOfAgriculture <- c(10,10,10,20,20,50,10,
                             20,10,50,20,50,20,10)



#a. Write the codes and describe the result.
I_O <- sort(DepartmentOfAgriculture, decreasing = FALSE)
I_O

#3. Abdul Hassan, president of Floor Coverings Unlimited, has asked you to study
#the exercise levels undertaken by 10 subjects were “l”, “n”, “n”, “i”, “l” ,
#“l”, “n”, “n”, “i”, “l” ; n=none, l=light, i=intense
Subjects <- c("l","n","n","i","l","l","n","n","i","l")
#a. What is the best way to represent this in R?

#DATAFRAME

Out <- data.frame(Subjects)
Out
#4.Sample of 30 tax accountants from all the states and territories of Australia and
#their individual state of origin is specified by a character vector of state mnemonics
#as:
State <- c("tas", "sa", "qld", "nsw", "nsw", "nt", "wa", "wa", "qld",
           "vic", "nsw", "vic", "qld", "qld", "sa", "tas", "sa", "nt",
           "wa", "vic", "qld", "nsw", "nsw", "wa", "sa", "act", "nsw",
           "vic", "vic", "act")
State  
#a. Apply the factor function and factor level. Describe the results.
Hello <- function(state)
  Hello 

factorial(Hello)
#5. From #4 - continuation:

#• Suppose we have the incomes of the same tax accountants in another vector (in
Incomes <- c(60, 49, 40, 61, 64, 60, 59, 54,
             62, 69, 70, 42, 56, 61, 61, 61, 58, 51, 48,
             65, 49, 49, 41, 48, 52, 46, 59, 46, 58, 43)

#a. Calculate the sample mean income for each state we can now use the special
#function tapply():
tapply(Incomes, )
#b. Copy the results and interpret.

#6.Calculate the standard errors of the state income means (refer again to number 3)

std_Error <- function(x) sqrt(var(x)/length(x))


#a. What is the standard error? Write the codes.

#b. Interpret the result.

#7. Use the titanic dataset.
data("Titanic")

Head <- data.frame(Titanic)

#a. subset the titatic dataset of those who survived and not survived. Show the
#codes and its result.
Head_Subset <- subset(Head, select = "Survived")
Head_Subset
#8. The data sets are about the breast cancer Wisconsin. The samples arrive periodically as Dr. Wolberg reports his clinical cases. The database therefore reflects this
#chronological grouping of the data. You can create this dataset in Microsoft Excel.

#a. describe what is the dataset all about.
#The dataset s all about Breast Cancer.

#b. Import the data from MS Excel. Copy the codes.
get_wd()
Data <- read.table(file = "Breast_Cancer.csv", header = FALSE, sep = ",")
Data
#c. Compute the descriptive statistics using different packages. Find the values of:

#c.1 Standard error of the mean for clump thickness.
Clump <- subset(Data, select = V2)
summary(Clump)
#c.2 Coefficient of variability for Marginal Adhesion.
Margin <- subset(Data, select = V5)
#c.3 Number of null values of Bare Nuclei.

#c.4 Mean and standard deviation for Bland Chromatin
summary(Data)
#c.5 Confidence interval of the mean for Uniformity of Cell Shape


#d. How many attributes?


#e. Find the percentage of respondents who are malignant. Interpret the results.

#9. Export the data abalone to the Microsoft excel file. Copy the codes.

library("AppliedPredictiveModeling")

view(abalone)
head(abalone)
summary(abalone)
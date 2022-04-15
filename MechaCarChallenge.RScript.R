install.packages("magrittr")
install.packages("dplyr")   
library(magrittr) 
library(dplyr)    

#DELIVERABLE 1

#load the dplyr package
library(dplyr)

#Import and read in the MechaCar_mpg.csv file as a df.
library(tidyverse)
mecha_mpg <- read.csv(file='./Downloads/MechaCar_mpg.csv',check.names=F,stringsAsFactors = F) 

#Linear regression with lm() function
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mecha_mpg)

#Determine the p-value and the r-squared value for the linear regression model.
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mecha_mpg)) 


#DELIVERABLE 2

#Import and read in the file as a table
suspension <- read.csv(file='./Downloads/Suspension_Coil.csv',check.names=F,stringsAsFactors = F) 
#Create a total_summary df
summarize_demo <- suspension %>% summarize(Mean=mean(PSI),Median=(PSI),Variance=var(PSI),SD=sd(PSI)) 
#Create a lot_summary df
lot_demo <- suspension %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI),Median=(PSI),Variance=var(PSI),SD=sd(PSI))

#PSI Whole lot
plt1 <- ggplot(mecha_coil,aes(y=PSI)) 
plt1 + geom_boxplot() 

#PSI each individual Lot
plt2 <- ggplot(mecha_coil,aes(x=Manufacturing_Lot,y=PSI)) 
plt2 + geom_boxplot()


#DELIVERABLE 3
t.test(suspension$PSI,mu = 1500)

lot1 <- subset(suspension, Manufacturing_Lot=="Lot1")
lot2 <- subset(suspension, Manufacturing_Lot=="Lot2")
lot3 <- subset(suspension, Manufacturing_Lot=="Lot3")

t.test(lot1$PSI,mu=1500)
t.test(lot2$PSI,mu=1500)
t.test(lot3$PSI,mu=1500)

#Deliverable #1

#load dplyr 
library(dplyr)

#import & read file
MechaCar <- read.csv(file='MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)

#perform linear regression using lm()
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data= MechaCar)

#perform summary
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data= MechaCar))

#Deliverable #2

#import & read to df
Suspension_df <- read.csv(file='Suspension_coil.csv',check.names=F,stringsAsFactors = F)
head(Suspension)

#summary dataframe
total_summary <- Suspension_df %>% summarize(Mean = mean(PSI), Median = median(PSI), Variance = var(PSI), SD = sd(PSI))
head(total_summary)

#create summary of each lot
lot_summary <- Suspension_df %>% group_by(Manufacturing_Lot) %>% summarize(Mean = mean(PSI), Median = median(PSI), Variance = var(PSI), SD = sd(PSI), .groups = 'keep')
head(lot_summary)


#Deliverable #3

# Peform t-test across all Lots
t.test(Suspension_df$PSI,mu = 1500)

# Peform t-test on Lot 1
t.test(subset(Suspension_df,Manufacturing_Lot=="Lot1")$PSI,mu = 1500)
# Peform t-test on Lot 2
t.test(subset(Suspension_df,Manufacturing_Lot=="Lot2")$PSI,mu = 1500)
# Peform t-test on Lot 3
t.test(subset(Suspension_df,Manufacturing_Lot=="Lot3")$PSI,mu = 1500)


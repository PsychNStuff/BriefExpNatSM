##This was made by @PsychNStuff on GitHub with the help of many others!
#If you have not already, download these libraries, and load them.
library(ggplot2)
library(tidyverse)
library(ggpubr)
library(RColorBrewer)

#Import your data. This is specifically meant for my thesis, but this is not a real directory.
data <- read.csv("Directory\\ThesisData.csv")

#calculate mean
mPA<-mean(data$Positive_Affect, na.rm = T)
mNA<-mean(data$Negative_Affect, na.rm = T)
mAwe<-mean(data$Awe_Total, na.rm = T)
mLonely<-mean(data$Loneliness_Total, na.rm = T)
mDepressed<-mean(data$Depression_Total, na.rm = T)
mFSICertain<-mean(data$FSI_Certainty, na.rm = T)
mFSI_Related<-mean(data$FSI_Relatedness, na.rm = T)
mFSI_Positive<-mean(data$FSI_Positivity, na.rm = T)
mFSI_Vivid<-mean(data$FSI_Vividness, na.rm = T)
mSC<-mean(data$Social_Comparisons_Total, na.rm = T)
mSMUse<-mean(data$SM_Use1, na.rm = T)
mReligion_Recoded<-mean(data$Religion_Recoded, na.rm = T)

#calculate standard deviation
sdPA<-sd(data$Positive_Affect, na.rm = T)
sdNA<-sd(data$Negative_Affect, na.rm = T)
sdAwe<-sd(data$Awe_Total, na.rm = T)
sdLonely<-sd(data$Loneliness_Total, na.rm = T)
sdDepressed<-sd(data$Depression_Total, na.rm = T)
sdFSICertain<-sd(data$FSI_Certainty, na.rm = T)
sdFSI_Related<-sd(data$FSI_Relatedness, na.rm = T)
sdFSI_Positive<-sd(data$FSI_Positivity, na.rm = T)
sdFSI_Vivid<-sd(data$FSI_Vividness, na.rm = T)
sdSMUse<-sd(data$SM_Use1, na.rm = T)

#n function adds number of people in a group via stat_summary median; I found this function online and do not claim rights to it.
n_fun <- function(x){
  return(data.frame(y = median(x), label = paste0("n = ",length(x))))
}

#This is for showing the mean differences for the purposes of a oneway ANOVA
##I chose to copy, paste, and repeat, so that I could control titles more easily, but this can be made into a function!
PA_graph <- ggplot(data, aes(x=Group, y=Positive_Affect,
                     fill=as.factor(Group))) + #main information about plot goes here
  geom_bar(stat = "summary", fun = "mean") +
  scale_fill_brewer(palette="Dark2")+
  geom_errorbar(aes(ymin = mPA - sdPA, ymax = mPA + sdPA),
                position = position_dodge(0.9), width = .2) +
  xlab('Condition') + #Assign a label for your x axis
  ylab('Positive Affect') + #Assign a label for your y axis
  ggtitle('Positive affect across condition') + #Assign a title to your diagram
  theme(axis.text = element_text(size = 0.75)) + #make the text on your axes bigger or smaller
  theme(axis.title = element_text(size = 0.75)) + #make the text for your axis labels bigger or smaller
  theme(legend.text = element_text(size = 0.75)) + #make your legend text bigger or smaller; unnecessary if you don't have a legend
  theme(legend.title = element_text(size = 0.75)) + #make your legend label bigger or smaller
  theme(title = element_text(size = 1.5)) + #make your diagram's title bigger or smaller
  theme_bw(base_size = 16)+ #this will make your diagram's background white
  theme(axis.text.y = element_text(angle = 45, vjust = 0.5, hjust=1)) + #turn your axis text on a 45 degree angle
  theme(axis.title.y = element_text(angle = 45, vjust = 0.75, hjust=1)) + #turn your axis title on a 45 degree angle
  stat_summary(fun = mean, geom = "text", vjust = 5, aes(label = paste("M = ", round(..y.., digits = 1)))) + #adds your mean as a number to your plot
  stat_compare_means(method = "anova", vjust = 0.5, hjust = -0.5) + #adds ANOVA p value to your plot
  stat_summary(fun.data = n_fun, geom = "text", vjust = 7) + #adds the number of people (datapoints) in each group to your plot
  theme(legend.position = "none") #this gets rid of the legend
PA_graph #print plot in R
ggsave('.png', height = , width = ) #save your plot

###Note that the following just repeats this for all of my variables and is not helpful unless you're replicating exactly what I did. You can scroll down if you want to skip it.

-------------

NA_graph <- ggplot(data, aes(x=Group, y=Negative_Affect,
                             fill=as.factor(Group))) + #main information about plot goes here
  geom_bar(stat = "summary", fun = "mean") +
  scale_fill_brewer(palette="Dark2") +
  geom_errorbar(aes(ymin = mNA - sdNA, ymax = mNA + sdNA),
                position = position_dodge(0.9), width = .2) +#This creates small points
  xlab('Condition') + #Assign a label for your x axis
  ylab('Negative Affect') + #Assign a label for your y axis
  ggtitle('Negative affect across condition') + #Assign a title to your diagram
  theme(axis.text = element_text(size = 0.75)) + #make the text on your axes bigger or smaller
  theme(axis.title = element_text(size = 0.75)) + #make the text for your axis labels bigger or smaller
  theme(legend.text = element_text(size = 0.75)) + #make your legend text bigger or smaller; unnecessary if you don't have a legend
  theme(legend.title = element_text(size = 0.75)) + #make your legend label bigger or smaller
  theme(title = element_text(size = 1.5)) + #make your diagram's title bigger or smaller
  theme_bw(base_size = 16)+ #this will make your diagram's background white
  theme(axis.text.y = element_text(angle = 45, vjust = 0.5, hjust=1)) + #turn your axis text on a 45 degree angle
  theme(axis.title.y = element_text(angle = 45, vjust = 0.75, hjust=1)) +
  stat_summary(fun = mean, geom = "text", vjust = -6.5, aes(label = paste("M = ", round(..y.., digits = 1)))) +
  stat_compare_means(method = "anova", vjust = 0.5, hjust = -0.5) +
  stat_summary(fun.data = n_fun, geom = "text", vjust = -6) +
  theme(legend.position = "none") #print plot in R
NA_graph
ggsave('C:\\Users\\hallc\\ThesisData\\boxplot.png') #save your plot

Awe_graph <- ggplot(data, aes(x=Group, y=Awe_Total,
                              fill=as.factor(Group))) + #main information about plot goes here
  geom_bar(stat = "summary", fun = "mean") +
  scale_fill_brewer(palette="Dark2") +
  geom_errorbar(aes(ymin = mAwe - sdAwe, ymax = mAwe + sdAwe),
                position = position_dodge(0.9), width = .2) +#This creates small points
  xlab('Condition') + #Assign a label for your x axis
  ylab('Awe (DPES)') + #Assign a label for your y axis
  ggtitle('Awe across condition') + #Assign a title to your diagram
  theme(axis.text = element_text(size = 0.75)) + #make the text on your axes bigger or smaller
  theme(axis.title = element_text(size = 0.75)) + #make the text for your axis labels bigger or smaller
  theme(legend.text = element_text(size = 0.75)) + #make your legend text bigger or smaller; unnecessary if you don't have a legend
  theme(legend.title = element_text(size = 0.75)) + #make your legend label bigger or smaller
  theme(title = element_text(size = 1.5)) + #make your diagram's title bigger or smaller
  theme_bw(base_size = 16)+ #this will make your diagram's background white
  theme(axis.text.y = element_text(angle = 45, vjust = 0.5, hjust=1)) + #turn your axis text on a 45 degree angle
  theme(axis.title.y = element_text(angle = 45, vjust = 0.75, hjust=1)) +
  stat_summary(fun = mean, geom = "text", vjust = 6, aes(label = paste("M = ", round(..y.., digits = 1)))) +
  stat_compare_means(method = "anova", vjust = 0.5, hjust = -0.5) +
  stat_summary(fun.data = n_fun, geom = "text", vjust = 8) +#turn your axis label on a 45 degree angle
  theme(legend.position = "none") #print plot in R
Awe_graph
ggsave('C:\\Users\\hallc\\ThesisData\\boxplot.png') #save your plot

Loneliness_graph <- ggplot(data, aes(x=Group, y=Loneliness_Total,
                                     fill=as.factor(Group))) + #main information about plot goes here
  geom_bar(stat = "summary", fun = "mean") +
  scale_fill_brewer(palette="Dark2") +
  geom_errorbar(aes(ymin = mLonely - sdLonely, ymax = mLonely + sdLonely),
                position = position_dodge(0.9), width = .2) +#This creates small points
  xlab('Condition') + #Assign a label for your x axis
  ylab('Loneliness') + #Assign a label for your y axis
  ggtitle('Loneliness across condition') + #Assign a title to your diagram
  theme(axis.text = element_text(size = 0.75)) + #make the text on your axes bigger or smaller
  theme(axis.title = element_text(size = 0.75)) + #make the text for your axis labels bigger or smaller
  theme(legend.text = element_text(size = 0.75)) + #make your legend text bigger or smaller; unnecessary if you don't have a legend
  theme(legend.title = element_text(size = 0.75)) + #make your legend label bigger or smaller
  theme(title = element_text(size = 1.5)) + #make your diagram's title bigger or smaller
  theme_bw(base_size = 16)+ #this will make your diagram's background white
  theme(axis.text.y = element_text(angle = 45, vjust = 0.5, hjust=1)) + #turn your axis text on a 45 degree angle
  theme(axis.title.y = element_text(angle = 45, vjust = 0.75, hjust=1)) +
  stat_summary(fun = mean, geom = "text", vjust = 5, aes(label = paste("M = ", round(..y.., digits = 1)))) +
  stat_compare_means(method = "anova", vjust = 0.5, hjust = -0.5) +
  stat_summary(fun.data = n_fun, geom = "text", vjust = 6.5) +#turn your axis label on a 45 degree angle
  theme(legend.position = "none") #print plot in R
Loneliness_graph
ggsave('C:\\Users\\hallc\\ThesisData\\boxplot.png') #save your plot

SocialComp_graph <- ggplot(data, aes(x=Group, y=Social_Comparisons_Total,
                                     fill=as.factor(Group))) + #main information about plot goes here
  geom_bar(stat = "summary", fun = "mean") +
  scale_fill_brewer(palette="Dark2") +
  geom_errorbar(aes(ymin = mSC - sdSC, ymax = mSC + sdSC),
                position = position_dodge(0.9), width = .2) +#This creates small points
  xlab('Condition') + #Assign a label for your x axis
  ylab('INCOM') + #Assign a label for your y axis
  ggtitle('Social comparison across condition') + #Assign a title to your diagram
  theme(axis.text = element_text(size = 0.75)) + #make the text on your axes bigger or smaller
  theme(axis.title = element_text(size = 0.75)) + #make the text for your axis labels bigger or smaller
  theme(legend.text = element_text(size = 0.75)) + #make your legend text bigger or smaller; unnecessary if you don't have a legend
  theme(legend.title = element_text(size = 0.75)) + #make your legend label bigger or smaller
  theme(title = element_text(size = 1.5)) + #make your diagram's title bigger or smaller
  theme_bw(base_size = 16)+ #this will make your diagram's background white
  theme(axis.text.y = element_text(angle = 45, vjust = 0.5, hjust=1)) + #turn your axis text on a 45 degree angle
  theme(axis.title.y = element_text(angle = 45, vjust = 0.75, hjust=1)) +
  stat_summary(fun = mean, geom = "text", vjust = 6, aes(label = paste("M = ", round(..y.., digits = 1)))) +
  stat_compare_means(method = "anova", vjust = 0.5, hjust = -0.5) +
  stat_summary(fun.data = n_fun, geom = "text", vjust = 7.5) +#turn your axis label on a 45 degree angle
  theme(legend.position = "none") #print plot in R
SocialComp_graph
ggsave('C:\\Users\\hallc\\ThesisData\\boxplot.png') #save your plot

FSICertain_graph <- ggplot(data, aes(x=Group, y=FSI_Certainty,
                                     fill=as.factor(Group))) + #main information about plot goes here
  geom_bar(stat = "summary", fun = "mean") +
  scale_fill_brewer(palette="Dark2") +
  geom_errorbar(aes(ymin = mFSICertain - sdFSICertain, ymax = mFSICertain + sdFSICertain),
                position = position_dodge(0.9), width = .2) +#This creates small points
  xlab('Condition') + #Assign a label for your x axis
  ylab('Certainty of the Future') + #Assign a label for your y axis
  ggtitle('Future certainty across condition') + #Assign a title to your diagram
  theme(axis.text = element_text(size = 0.75)) + #make the text on your axes bigger or smaller
  theme(axis.title = element_text(size = 0.75)) + #make the text for your axis labels bigger or smaller
  theme(legend.text = element_text(size = 0.75)) + #make your legend text bigger or smaller; unnecessary if you don't have a legend
  theme(legend.title = element_text(size = 0.75)) + #make your legend label bigger or smaller
  theme(title = element_text(size = 1.5)) + #make your diagram's title bigger or smaller
  theme_bw(base_size = 16)+ #this will make your diagram's background white
  theme(axis.text.y = element_text(angle = 45, vjust = 0.5, hjust=1)) + #turn your axis text on a 45 degree angle
  theme(axis.title.y = element_text(angle = 45, vjust = 0.75, hjust=1)) +
  stat_summary(fun = mean, geom = "text", vjust = 6, aes(label = paste("M = ", round(..y.., digits = 1)))) +
  stat_compare_means(method = "anova", vjust = 0.5, hjust = -0.5) +
  stat_summary(fun.data = n_fun, geom = "text", vjust = 8) +#turn your axis label on a 45 degree angle
  theme(legend.position = "none") #print plot in R
FSICertain_graph
ggsave('C:\\Users\\hallc\\ThesisData\\boxplot.png') #save your plot

FSIRelated_graph <- ggplot(data, aes(x=Group, y=FSI_Relatedness,
                                     fill=as.factor(Group))) + #main information about plot goes here
  geom_bar(stat = "summary", fun = "mean") +
  scale_fill_brewer(palette="Dark2") +
  geom_errorbar(aes(ymin = mFSI_Related - sdFSI_Related, ymax = mFSI_Related + sdFSI_Related),
                position = position_dodge(0.9), width = .2) +#This creates small points
  xlab('Condition') + #Assign a label for your x axis
  ylab('Relatedness to the Future') + #Assign a label for your y axis
  ggtitle('Future self-relatedness across condition') + #Assign a title to your diagram
  theme(axis.text = element_text(size = 0.75)) + #make the text on your axes bigger or smaller
  theme(axis.title = element_text(size = 0.5)) + #make the text for your axis labels bigger or smaller
  theme(legend.text = element_text(size = 0.75)) + #make your legend text bigger or smaller; unnecessary if you don't have a legend
  theme(legend.title = element_text(size = 0.75)) + #make your legend label bigger or smaller
  theme(title = element_text(size = 1)) + #make your diagram's title bigger or smaller
  theme_bw(base_size = 16)+ #this will make your diagram's background white
  theme(axis.text.y = element_text(angle = 45, vjust = 0.25, hjust=1)) + #turn your axis text on a 45 degree angle
  theme(axis.title.y = element_text(angle = 45, vjust = 0.75, hjust=1)) +
  stat_summary(fun = mean, geom = "text", vjust = 5, aes(label = paste("M = ", round(..y.., digits = 1)))) +
  stat_compare_means(method = "anova", vjust = 0.5, hjust = -0.5) +
  stat_summary(fun.data = n_fun, geom = "text", vjust = 7) +
  theme(legend.position = "none") #print plot in R
FSIRelated_graph
ggsave('C:\\Users\\hallc\\ThesisData\\boxplot.png') #save your plot

FSIPositive_graph <- ggplot(data, aes(x=Group, y=FSI_Positivity,
                                      fill=as.factor(Group))) + #main information about plot goes here
  geom_bar(stat = "summary", fun = "mean") +
  scale_fill_brewer(palette="Dark2") +
  geom_errorbar(aes(ymin = mFSI_Positive - sdFSI_Positive, ymax = mFSI_Positive + sdFSI_Positive),
                position = position_dodge(0.9), width = .2) +#This creates small points
  xlab('Condition') + #Assign a label for your x axis
  ylab('Positive view of the Future') + #Assign a label for your y axis
  ggtitle('Future self positivity across condition') + #Assign a title to your diagram
  theme(axis.text = element_text(size = 0.75)) + #make the text on your axes bigger or smaller
  theme(axis.title = element_text(size = 0.75)) + #make the text for your axis labels bigger or smaller
  theme(legend.text = element_text(size = 0.75)) + #make your legend text bigger or smaller; unnecessary if you don't have a legend
  theme(legend.title = element_text(size = 0.75)) + #make your legend label bigger or smaller
  theme(title = element_text(size = 1.5)) + #make your diagram's title bigger or smaller
  theme_bw(base_size = 16)+ #this will make your diagram's background white
  theme(axis.text.y = element_text(angle = 45, vjust = 0.5, hjust=1)) + #turn your axis text on a 45 degree angle
  theme(axis.title.y = element_text(angle = 45, vjust = 0.75, hjust=1)) +
  stat_summary(fun = mean, geom = "text", vjust = 6, aes(label = paste("M = ", round(..y.., digits = 1)))) +
  stat_compare_means(method = "anova", vjust = 0.5, hjust = -0.65) +
  stat_summary(fun.data = n_fun, geom = "text", vjust = 8) +#turn your axis label on a 45 degree angle
  theme(legend.position = "none") #print plot in R
FSIPositive_graph
ggsave('C:\\Users\\hallc\\ThesisData\\boxplot.png') #save your plot

FSIVivid_graph <- ggplot(data, aes(x=Group, y=FSI_Vividness,
                                   fill=as.factor(Group))) + #main information about plot goes here
  geom_bar(stat = "summary", fun = "mean") +
  scale_fill_brewer(palette="Dark2") +
  geom_errorbar(aes(ymin = mFSI_Vivid - sdFSI_Vivid, ymax = mFSI_Vivid + sdFSI_Vivid),
                position = position_dodge(0.9), width = .2) +#This creates small points
  xlab('Condition') + #Assign a label for your x axis
  ylab('Vividness of the Future') + #Assign a label for your y axis
  ggtitle('Future self vividness across condition') + #Assign a title to your diagram
  theme(axis.text = element_text(size = 0.75)) + #make the text on your axes bigger or smaller
  theme(axis.title = element_text(size = 0.75)) + #make the text for your axis labels bigger or smaller
  theme(legend.text = element_text(size = 0.75)) + #make your legend text bigger or smaller; unnecessary if you don't have a legend
  theme(legend.title = element_text(size = 0.75)) + #make your legend label bigger or smaller
  theme(title = element_text(size = 1.5)) + #make your diagram's title bigger or smaller
  theme_bw(base_size = 16)+ #this will make your diagram's background white
  theme(axis.text.y = element_text(angle = 45, vjust = 0.5, hjust=1)) + #turn your axis text on a 45 degree angle
  theme(axis.title.y = element_text(angle = 45, vjust = 0.75, hjust=1)) +
  stat_summary(fun = mean, geom = "text", vjust = 6, aes(label = paste("M = ", round(..y.., digits = 1)))) +
  stat_compare_means(method = "anova", vjust = 0.5, hjust = -0.5) +
  stat_summary(fun.data = n_fun, geom = "text", vjust = 8) +#turn your axis label on a 45 degree angle
  theme(legend.position = "none") #print plot in R
FSIVivid_graph
ggsave('C:\\Users\\hallc\\ThesisData\\boxplot.png') #save your plot

Depress_graph <- ggplot(data, aes(x=Group, y=Depression_Total,
                                   fill=as.factor(Group))) + #main information about plot goes here
  geom_bar(stat = "summary", fun = "mean") +
  scale_fill_brewer(palette="Dark2") +
  geom_errorbar(aes(ymin = mDepressed - sdDepressed, ymax = mDepressed + sdDepressed),
                position = position_dodge(0.9), width = .2) +#This creates small points
  xlab('Condition') + #Assign a label for your x axis
  ylab('Depression (CESD)') + #Assign a label for your y axis
  ggtitle('Depression across condition') + #Assign a title to your diagram
  theme(axis.text = element_text(size = 0.75)) + #make the text on your axes bigger or smaller
  theme(axis.title = element_text(size = 0.75)) + #make the text for your axis labels bigger or smaller
  theme(legend.text = element_text(size = 0.75)) + #make your legend text bigger or smaller; unnecessary if you don't have a legend
  theme(legend.title = element_text(size = 0.75)) + #make your legend label bigger or smaller
  theme(title = element_text(size = 1.5)) + #make your diagram's title bigger or smaller
  theme_bw(base_size = 16)+ #this will make your diagram's background white
  theme(axis.text.y = element_text(angle = 45, vjust = 0.5, hjust=1)) + #turn your axis text on a 45 degree angle
  theme(axis.title.y = element_text(angle = 45, vjust = 0.75, hjust=1)) +
  stat_summary(fun = mean, geom = "text", vjust = 4.5, aes(label = paste("M = ", round(..y.., digits = 1)))) +
  stat_compare_means(method = "anova", vjust = 0.5, hjust = -0.5) +
  stat_summary(fun.data = n_fun, geom = "text", vjust = 6) +#turn your axis label on a 45 degree angle
  theme(legend.position = "none") #print plot in R
Depress_graph
ggsave('C:\\Users\\hallc\\ThesisData\\boxplot.png') #save your plot

---------

###OK that's over

#plot differences in differences (interaction)
###I used SPSS and Excel to plot line graphs. To visualize the differences in means between groups, I also made bar plots in R.

#If you're replicating, you may be able to recode the variables I recoded here.
colnames(data)[colnames(data) == "SM_Use1"] <- "SM_Use"
colnames(data)[colnames(data) == "Religion_Recoded"] <- "Religious_Affiliation"
data2 <- data[!(is.na(data$Religious_Affiliation)), ]

#This will plot your data with facet wrap, so your graphs will be the same, but you will see them side by side
mod_graph1 <- ggplot(data = data, aes(x = Group, y = Negative_Affect, fill = Group)) +
  geom_bar(stat = "summary", fun = "mean") + #put the info for your graph here
  theme_bw(base_size = 14)+ #background is white
  facet_wrap(~ SM_Use, nrow = 2, labeller = label_both) + #everything wraps. nrow = number of rows.
  labs(title = "Effect of SM Use on NA",
       y = "Negative Affect", x = "") + #name your graph, x, and y axes
  theme(axis.title.y = element_text(angle = 45, vjust = 0.75, hjust=1)) + #tilt your title by 45 degrees
  scale_y_continuous(limits = c(0, 50), breaks = c(5, 20)) + #I added breaks so I could see the numbers more easily
  theme(legend.position = "none") #no legend
mod_graph1 #print the plot

###The rest of this is just repeating with different moderators

mod_graph2 <- ggplot(data2, aes(x = Group, y = Negative_Affect, fill = Group)) +
  geom_bar(stat = "summary", fun = "mean", na.rm = T) +
  theme_bw(base_size = 14)+
  facet_wrap(~ Religious_Affiliation, nrow = 1, labeller = label_both) + 
  labs(title = "Effect of Religious Affiliation on NA",
       y = "Negative Affect", x = "") + #turn your axis text on a 45 degree angle
  theme(axis.title.y = element_text(angle = 45, vjust = 0.75, hjust=1)) +
  scale_y_continuous(limits = c(0, 50), breaks = c(5, 10, 20)) +
  theme(legend.position = "none")
mod_graph2

mod_graph3 <- ggplot(data, aes(x = Group, y = Negative_Affect, fill = Group)) +
  geom_bar(stat = "summary", fun = "mean", na.rm = T) +
  theme_bw(base_size = 14)+
  facet_wrap(~ Time_Outside, nrow = 2, labeller = label_both) + 
  labs(title = "Effect of time spent outside on NA",
       y = "Negative Affect", x = "") + #turn your axis text on a 45 degree angle
  theme(axis.title.y = element_text(angle = 45, vjust = 0.75, hjust=1)) +
  scale_y_continuous(limits = c(0, 50), breaks = c(5, 20)) +
  theme(legend.position = "none")
mod_graph3

###Thank you! If you're using this please cite the original thesis.

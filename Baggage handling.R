library(tidyverse)
library(ggplot2)
library(reshape2)
library(cowplot)
library(ggthemes)
report_bag <- read.csv("reportsper1000.csv")
report_bag$AIRLINE <- factor(report_bag$AIRLINE, levels = report_bag$AIRLINE)
report.m <- melt(report_bag, id.vars='AIRLINE') 
report.m

reports_plot <- ggplot(report.m,aes(AIRLINE,value,fill= variable))+ geom_bar(stat="identity", position = "dodge")+labs(x="AIRLINE",y="Reports per 1000 passengers",title="MISHANDLED BAGGAGE REPORTS PER 1000 PASSENGERS")+theme(legend.position="top")+scale_fill_manual(values = c("olivedrab","orange","orchid","skyblue2","darkred"))+hw+ theme(legend.title=element_blank())
reports_plot +coord_flip()

total_reports <- read.csv("totalreports.csv")
total_reports$AIRLINE <- factor(total_reports$AIRLINE, levels = total_reports$AIRLINE)
totalrep.m <- melt(total_reports, id.vars='AIRLINE')
totalrep.m

totalplot <- ggplot(totalrep.m,aes(AIRLINE,value,fill= variable))+ 
                geom_bar(stat="identity", position = "dodge")+labs(x="AIRLINE",y="Total reports (Thousands)",title="TOTAL REPORTS ON MISHANDLED BAGGAGES")+theme(legend.position="top")+scale_fill_manual(values = c("olivedrab","orange","orchid","skyblue2","darkred"))+hw+ theme(legend.title=element_blank()) 
totalplot+coord_flip()

comparison_report <- read.csv("combinedata.csv")
comparison_report$AIRLINE <- factor(comparison_report$AIRLINE, levels = comparison_report$AIRLINE)
compreport.m <- melt(comparison_report, id.vars='AIRLINE')
compreport.m

comparison_plot <- ggplot(compreport.m,aes(AIRLINE,value,fill= variable))+ geom_bar(stat="identity", position = "dodge")+labs(x="AIRLINE",y="Number of Reports (Thousands)",title="TOTAL REPORTS AND REPORTS PER 1000 PASSENGERS \nON MISHANDLED BAGGAGES")+theme(legend.position="top")+scale_fill_manual(values = c("olivedrab","orange","orchid","skyblue2","darkred"))+hw+ theme(legend.title=element_blank())
comparison_plot+coord_flip()

enplane <- read.csv("enplanedata.csv")
enplane$AIRLINE <- factor(enplane$AIRLINE, levels = enplane$AIRLINE) 
enplane.m <- melt(enplane, id.vars='AIRLINE')
enplane.m 

enplane_plot <- ggplot(enplane.m,aes(AIRLINE,value,fill= variable))+ geom_bar(stat="identity", position = "dodge")+labs(y= "No. of passengers 
                   (Millions)",x= "AIRLINE",title="ENPLANED PASSENGERS(2013 - 2017)")+theme(legend.position="top")+scale_fill_manual(values = c("olivedrab","orange","orchid","skyblue2","darkred"))+hw+theme(legend.title=element_blank()) 
enplane_plot +coord_flip()

data1 <- read.csv("trenddata1.csv")
data1.m <- melt(data1, id.vars='YEAR')
data1.m

data1_plot <- ggplot(data1.m,aes(x=YEAR,y=value))+ 
                 geom_line(aes(colour=variable,group=variable))+ geom_point(aes(colour=variable,shape=variable,group=variable),size=3)+ylab(label = "No. of Passengers flying(in millions)")+ 
                   xlab("Year") + labs(title="Trend showing No. of passengers flying US Airlines\nDomestic only")+hw+ theme(legend.title=element_blank())+theme(legend.position = 'bottom') 
data1_plot

data2 <- read.csv("trenddata2.csv")
data2.m <- melt(data2, id.vars='YEAR')
data2.m
data2_plot <- ggplot(data2.m,aes(x=YEAR,y=value))+ 
                  geom_line(aes(colour=variable,group=variable))+ geom_point(aes(colour=variable,shape=variable,group=variable),size=3)+scale_color_manual(values = "blue")+hw+ylab(label = "Mishandled baggage reports(in millions)")+ 
                      xlab("Year") + labs(title="Trend showing mishandled baggage reports US Airlines\nDomestic only")+theme(legend.title=element_blank())+ theme(legend.position = 'bottom')
data2_plot

plot_grid(data1_plot,data2_plot,labels = "AUTO") 

#access data included with R
data(diamonds, package="ggplot2")

install.packages("ggplot2") #install packages
library(ggplot2)#load package

#geom line
ggplot(diamonds,aes(x=carat,y=cut))+geom_line()

#bar graph
ggplot(data=diamonds)+geom_bar(mapping=aes(x=cut)) 
#used for categorical data like red,green or good,bad

#histogram
hist(diamonds$carat, main = "main title of histogram", ylab="y axis name", xlab="x axis label")
# values should be numbers basically

#histogram with ggplot , don't know what it is with ~color
ggplot(data=diamonds, aes(x=carat))+ geom_histogram(col="white",fill="blue")+facet_wrap(~color)  
#values(not categorical but exact values) should be used with histogram

#scatterplot
plot(diamonds$carat,diamonds$cut) #using r base graphics
plot(carat~price, diamonds) #this is better it plots price in y axis and carat in x axis

#scatterplot using ggplot
ggplot(diamonds,aes(x=carat,y=price))+geom_point(aes(color=color))+facet_wrap(~color)+
  labs(title="huh",x="xname",y="yname") #this can be used in any diagram to label x-axis, y-axis and title
#numeric values are also good here and you can give aesthetics inside geom_point

## boxplot
#boxplot used for numeric ranges that represents quartile , the frequent values in center is Interquartile Range(IQR)

#       0------------------------------------|    |    |---------------0

#low occurences of values(min outliers)------Q1|median|Q3-----------again low occurence of values (max outliers)
#and its not that box always is in center it can be anywhere

#min outliers = (q1-1.5*IQR)
#max outliers = (q3+1.5*IQR)
#IQR have difference in 25%(Q1), 50%(Median), 75%(Q3) and called percentile 

#boxplot using R base graphics
boxplot(diamonds$carat)
#using ggplot
ggplot(diamonds, aes(y=carat, x=cut))+geom_boxplot()+ labs(title = "boxplot") #also good for numeric values
#can also use for one dimensional but needs to give value in x like x=1

# dplyr packages functions use
install.packages("dplyr")
library(dplyr)

data(diamonds, package="ggplot2")
View(diamonds)
filter(diamonds,price<500) #shows diamonds which price are 500 or more
arrange(diamonds, desc(price)) #arrange or sort in accordance of price in desc order 
select(diamonds,cut, carat) #only shows specified columns

#lets use mutate function
beforeData <- select(diamonds, carat, price))
afterData <- mutate(beforeData,priceAfterAdding1000 = price+1000)
print(afterData) #this will print table with carat, price and priceAfterAdding1000 column
diamonds%>% summarise(caratMean = mean(carat)) #summarise is used with other summarizing funcs like mean, min, max

group_by(diamonds,color) #just group same types in one section

# Chapter 7
## Data Visualization 
### line graph, bar chart, histogram, scatterplot and box-plot

```R
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
ggplot(diamonds,aes(x=carat,y=price))+geom_point(aes(color=color))+facet_wrap(~color)
#numeric values are also good here and you can give aesthetics inside geom_point

## boxplot
#boxplot used for numeric ranges that represents quartile , the frequent values in center is Interquartile Range(IQR)
```
[View on Eraser![](https://app.eraser.io/workspace/FB45cnndKkJvl4tbIhrP/preview?elements=zeVX0nQN7yuI9gEBn1Bgfw&type=embed)](https://app.eraser.io/workspace/FB45cnndKkJvl4tbIhrP?elements=zeVX0nQN7yuI9gEBn1Bgfw)

or you might understand this ?
```R
#       0------------------------------------|    |    |---------------0

#low occurences of values(min outliers)------Q1|median|Q3-----------again low occurence of values (max outliers)
#and its not that box always is in center it can be anywhere

#min outliers = (q1-1.5*IQR)
#max outliers = (q3+1.5*IQR)
#IQR have difference in 25%(Q1), 50%(Median), 75%(Q3) and called percentile 

#boxplot using R base graphics
boxplot(diamonds$carat)
#using ggplot
ggplot(diamonds, aes(y=carat, x=cut))+geom_boxplot() #also good for numeric values
#can also use for one dimensional but needs to give value in x like x=1
```
# Chapter 8
## Exploration
__Barchart__ is good for categorical data and __Histogram__ is good for continuous variables in most scenarios.

### What ot look for in analyzing histogram
1. __Peaks and spread__: _peaks_ represents interval or range where data occurs most while _spread_ represents width of bars, wider spread represents wider variability
2. __Symmetry of data__: if left and right side of the histogram are almost equal and histogram looks like mirrored that is symmetrical distribution
3. __Outliers__: data that are outside of the group of data

### Covariation : tendency of 2 or more variables to vary in related manner
#### two continuous or two categorical variables can be analyzed using scatterplot whereas mix of categorical and continues values can be analyzed using boxplots

### Analyze Scatterplots
1. Type of Relationship
2. Strength of Relationship
3. Outliers

### Analyze Boxplots
1. Center and spreads : the median line within the box provides info about cener of distribution, the length indicates spreads of the data, longer whiskers (i.e the center handle like structure) suggest higher variability
2. Symmetry of Data
3. Outliers

### Let's deal with Missing values
If there are unusual values in the dataset we are left with only two options:

1. Drop entire row with suspicious values
2. replace unusual values with missing values

There are functions like ``na.rm`` to remove values before computing.
`(na.rm=TRUE)` or `(na.rm=FALSE)`

# Chapter 9
## Data Manipulation 
### Tibbles, pipes, dplyr package and functions like

 
 Data manipulations can be used to _narrow down the observation_, _creating new data_ like calculating net income from gross income, tax and other deduction,_calculating summary_ like counts and means,  _adding, updating, removing data_ and _reordering the observation_.

 1. __Tibbles__: data frame that shows only first 10 rows and columns that fits on screen.

 Usage: `tibble(dataset)`

 2. __Pipes__: Used in a pipeline to chain series of functions calls
 ```R
filtered_cars %>%
  filter(year > 2010) %>%
  summarize(average_price = round(mean(price), 2)) %>%
  print()

 ```
3. __dplyr package__: grammer of data manipulation since it solves many challenges of data manipulation, the functions like `filter,arrange,select,mutate,summarise,group_by` are part of __dplyr__.
```R
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
```



#TEJ BAHADUR GHARTI KSHETRI
#NPI000183

#Installing required packages

#install.packages("ggplot2") 
#install.packages("readr")
#install.packages("dplyr")
#install.packages("na.tools")

library(ggplot2)
library(readr)
library(dplyr)
library(na.tools)

#Importing data
emp_data <- read.csv("/home/tj/r-programming/employee_attrition.csv")

View(emp_data)

#termreason_filter <- function(){
#  filter(!(termreason_desc %in% "Not Applicable"))
#}

#Data Cleaning
#rename every variable name to snake case 
names(emp_data)[names(emp_data) == "EmployeeID"] <- "employee_id" 
names(emp_data)[names(emp_data) == 'STATUS_YEAR'] <-"status_year"
names(emp_data)[names(emp_data) == "STATUS"] <- "status"
names(emp_data)[names(emp_data) == "BUSINESS_UNIT"] <- "business_unit" 


emp_data <- select(emp_data , -c(gender_short)) # removes gender short form ( M, F)
emp_data <- select(emp_data, -c(orighiredate_key)) # remove hiredate
emp_data <- select(emp_data, -c(birthdate_key)) # remove birthdate


#Data Pre-processing
emp_data$employee_id <- as.factor(emp_data$employee_id)
emp_data$age <- as.factor(emp_data$age)
emp_data$length_of_service <- as.factor(emp_data$length_of_service)
emp_data$city_name <- as.factor(emp_data$city_name)
emp_data$department_name <- as.factor(emp_data$department_name)
emp_data$job_title <- as.factor(emp_data$job_title)
emp_data$store_name <- as.factor(emp_data$store_name)
emp_data$gender_full <- as.factor(emp_data$gender_full)
emp_data$termreason_desc <- as.factor(emp_data$termreason_desc)
emp_data$termtype_desc <- as.factor(emp_data$termtype_desc)
emp_data$status_year <- as.factor(emp_data$status_year)
emp_data$status <- as.factor(emp_data$status)
emp_data$business_unit <- as.factor(emp_data$business_unit)
emp_data$recorddate_key <- as.Date(emp_data$recorddate_key, "%d%m%Y")
emp_data$terminationdate_key <- as.Date(emp_data$terminationdate_key,"%d%m%Y")


str(emp_data) # display data of every column in emp_data file in string format
names(emp_data) # show the names of the column names
nrow(emp_data) # display numbers of rows in emp_data
ncol(emp_data) # display numbers of columns in emp_data

summary(emp_data)  #summarize the values present in emp_data

#1.Finding relationship between age and termination
emp_data%>%
  filter(!(termreason_desc %in% "Not Applicable"))%>%
  ggplot()+
  aes(x= age, fill= termreason_desc) +
  geom_bar()+
  labs(
    title = "Age and Attrition Relationship",
    caption = "TEJ BAHADUR GHARTI KSHETRI NPI000183"
  ) +
  theme_bw()

#2.Finding relationship between the length of service with age and termination:
emp_data%>%
  filter(!(termreason_desc %in% "Not Applicable")) %>%
  ggplot() +
  aes(x = length_of_service, y = age, fill = termreason_desc)+
  geom_tile()+
  labs(
    title = "Relationship between the length of service with age and termination",
    caption = "TEJ BAHADUR GHARTI KSHETRI NPI000183"
  )+
  theme_bw()

#3. Finding relationship between department and termination:
 emp_data%>%
   filter(!(termtype_desc %in% "Not Applicable")) %>%
   ggplot()+
   aes(x = department_name, fill= termreason_desc) +
   geom_bar()+
   labs(
     title = "Relationship between department and termination",
     caption="TEJ BAHADUR GHARTI KSHETRI NPI000183"
   )+
   coord_flip()+
   theme_bw()

#4. Finding the relationship between gender and termination:
 emp_data%>%
   filter(!(termreason_desc %in% "Not Applicable")) %>%
   ggplot()+
   aes(x= termreason_desc) +
   geom_bar(fill = "#000080")+
   labs(
     title="Relationship between gender and termination",
     caption=" TEJ BAHADUR GHARTI KSHETRI NPI000183"
   )+
   facet_wrap(vars(gender_full))+
   theme_classic()
 
 #5. Finding relationship between job title and termination:
 emp_data%>%
   filter(!(termreason_desc %in% "Not Applicable")) %>%
   ggplot()+
   aes(x = job_title, fill = termreason_desc)+
   geom_bar()+
   labs(
     title = "Relationship between job title and termination",
     caption = "TEJ BAHADUR GHARTI KSHETRI NPI000183"
   )+
   coord_flip()+
   theme_classic()
 
#6. Finding relationship between gender and termination:
 emp_data%>%
   filter(!(termreason_desc %in% "Not Applicable")) %>%
   ggplot()+
   aes(x = termreason_desc)+
   geom_bar(fill = "blue")+
   theme_bw()+
   labs(
     title = "Relationship between gender and termination",
     caption = "TEJ BAHADUR GHARTI KSHETRI NPI000183"
   )+
   facet_wrap(vars(gender_full))
 
 
#7. Finding the relationship between status year and status::
 emp_data%>%
   filter(!(termreason_desc %in% "Not Applicable")) %>%
   ggplot()+
   aes(x = termreason_desc)+
   geom_bar(fill="pink") +
   theme_grey()+
   labs(
     title = "Relationship between status year and status",
     caption = "TEJ BAHADUR GHARTI KSHETRI NPI000183"
   )+
   facet_wrap(vars(STATUS_YEAR))
 View(emp_data)
 
 #8. Finding the relationship between city name and status
 emp_data %>%
   filter(status %in% "TERMINATED") %>%
   ggplot()+
   aes(x = city_name, fill = status) +
   geom_bar()+
   labs(
     title = "Relationship between city and status",
     caption = "TEJ BAHADUR GHARTI KSHETRI NPI000183"
   )+
   coord_flip()
 
 
 
 #9.Finding relationship between city and store
 emp_data%>%
   ggplot()+
   aes(x = store_name, y = city_name) +
   geom_point()+
   labs(
     title = "Relationship between city and store",
     caption = "TEJ BAHADUR GHARTI KSHETRI NPI000183"
   )
 
 # 10. Finding the relationship between department and city name:
 emp_data%>%
   ggplot()+
   aes(x= department_name, y=city_name)+
   geom_point()+
   labs(
     title = "Relationship between department name and city name",
     caption = "TEJ BAHADUR GHARTI KSHETRI NPI000183"
   )
 
   
 
 # 11. Finding the relationship between status and city name
 emp_data%>%
   ggplot()+
   aes(y= city_name, fill = status)+
   geom_bar()+
   labs(
     title = "Relationship between status and city name",
     caption = "TEJ BAHADUR GHARTI KSHETRI NPI000183"
   )+
   theme_bw()
 
 # 12. Finding the relationship between length of service and type of termination
 emp_data %>%
   filter(!(termreason_desc %in% "Not Applicable")) %>%
   ggplot()+
   aes(x= length_of_service, y= termtype_desc)+
   geom_point(position = "jitter")+
   labs(
     title = "Relationship between length of service and type of termination",
     caption = "TEJ BAHADUR GHARTI KSHETRI NPI000183"
   )+
   theme_minimal()
 
 #13. Finding the relationship between department and type of termination
 emp_data%>%
   filter(!(termtype_desc %in% "Not Applicable")) %>%
   ggplot()+
   aes(x = department_name)+
   geom_bar(fill = "darkred")+
   labs(
     title = "Relationship between department and type of termination",
     caption = "TEJ BAHADUR GHARTI KSHETRI NPI000183"
   )+
   facet_wrap(vars(termtype_desc))+
   coord_flip()
 
# 14. Finding the relationship between age and type of termination
 emp_data%>%
   filter(!(termreason_desc %in% "Not Applicable")) %>%
   ggplot()+
   aes(x = age, fill = termtype_desc)+
   geom_bar()+
   labs(
     title = "Relationship between age and type of termination",
     caption = "TEJ BAHADUR GHARTI KSHETRI NPI000183"
   )
 
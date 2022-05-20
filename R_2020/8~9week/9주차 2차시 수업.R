#1418083 ?????? 

library(foreign) # SPSS ???? ?Îµ?
library(dplyr) # ??Ã³??
library(ggplot2) # ?Ã°?È­
library(readxl) 
dir()

raw_welfare <- read.spss(file = "Koweps_hpc10_2015_beta1.sav",
                         to.data.frame = T)

head(raw_welfare)
dim(raw_welfare)
str(raw_welfare)

welfare = raw_welfare
tail(raw_welfare)
welfare[1:5,1:5]
str(welfare)

##?????? ?Ù²Ù±?
welfare <- rename(welfare,
                  sex = h10_g3, # ????
                  birth = h10_g4, # ?Â¾î³? ????
                  marriage = h10_g10, # È¥?? ????
                  religion = h10_g11, # Á¾??
                  income = p1002_8aq1, # ????
                  code_job = h10_eco9, # ??Á¾ ?Úµ?
                  code_region = h10_reg7) # ???? ?Úµ?
class(welfare$sex)
table(welfare$sex) #?Ì»?Ä¡ ??À½ 

welfare$sex <- ifelse(welfare$sex == 9, NA, welfare$sex) #????Ä¡?? ?Ö´Ù¸? ????Ä¡ Ã³?? 
table(is.na(welfare$sex)) 

welfare$sex <- ifelse(welfare$sex == 1, "male", "female") #?????? ?Ì¸? ?Î¿? 
table(welfare$sex)

qplot(welfare$sex) #??Ç¥ ???? 

class(welfare$income)
summary(welfare$income) #income?? ????Ä¡?? 12030 
qplot(welfare$income)
qplot(welfare$income) + xlim(0,1000) #??À§À» ?Ù¿? ?????? ???? 

welfare$income = ifelse(welfare$income %in% c(0, 9999), NA, welfare$income)#???? spss?????? ????Ä¡?? 0?Ì³? 9999?? ???ÂµÇ±? ???? 
table(is.na(welfare$income))

sex_income = welfare %>%
  filter(!is.na(income)) %>% 
  group_by(sex) %>% 
  summarise(mean_income = mean(income))
sex_income

ggplot(data = sex_income, aes(x = sex, y = mean_income)) + geom_col()

#?? ?? ?? ????À» ???? ???? ??À»??? 
class(welfare$birth)
summary(welfare$birth)
qplot(welfare$birth)

table(is.na(welfare$birth)) #????Ä¡ ??À½ 

welfare$age = 2015 - welfare$birth + 1
summary(welfare$age)

age_income = welfare %>%
  filter(!is.na(income)) %>% 
  group_by(age) %>% 
  summarise(mean_income = mean(income))

head(age_income)

ggplot(data = age_income, aes(x = age, y = mean_income)) + geom_line()

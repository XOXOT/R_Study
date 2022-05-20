dir()

exam = read.csv("csv_exam.csv")
head(exam)
head(exam,10)

tail(exam)
tail(exam,10)

View(exam)

library(ggplot2)
mpg = as.data.frame((ggplot2::mpg))
head(mpg)
tail(mpg)
View(mpg)
dim(mpg)
str(mpg)
summary(mpg)

# install.packages("dplyr")
library(dplyr)

df_raw = data.frame(var1 = c(1,2,1),
                    var2 = c(2,3,2))
df_raw

df_new = df_raw

df_new = rename(df_new,v2 = var2)

df_new
df_raw

df = data.frame(var1 = c(4,3,8),
                var2 = c(2,6,1))
df

df$var_sum = df$var1 + df$var2 #합에 대한 파생변수 생성 
df

df$var_mean = (df$var1 + df$var2)/2
df

mpg$total = (mpg$cty+mpg$hwy)/2

unique(mpg[,1]) #첫번째 칼럼인 자동차 회사 종류를 중첩되지않게 뽑아줌 

mean(mpg$total)
summary(mpg$total)
hist(mpg$total)

mpg$test = ifelse(mpg$total >= 20, "pass", "fail")

table(mpg$test) # 연비 합격 빈도표 생성 
qplot(mpg$test)


mpg$class0 = ifelse(mpg$total >= 30, "A", 
                    ifelse(mpg$total >= 20,"B","C"))

mpg$class0 = ifelse(mpg$total >= 30, "A", 
                    ifelse(mpg$total >= 20 & mpg$total<=29,"B","C"))
                    
mpg$class0 = ifelse(mpg$total>=30,"A",ifelse(mpg$total< 20,"C","B"))
                    
head(mpg)

table(mpg$class0)
qplot(mpg$class0)

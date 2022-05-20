
# 데이터 리스트 
english = c(90,80,60,70)
print(english)

math = c(50,60,100,20)
print(math)

df_midterm = data.frame(english, math)
print(df_midterm)

class = c(1,1,2,2)

df_midterm = data.frame(english, math, class)
print(df_midterm)

#간단하게 이름 바꾸기 
df_midterm = data.frame(en = english, ma = math, cl = class)
df_midterm

#데이터 프레임 한번에 만들기 
df_midterm = data.frame(english = c(90,80,60,70),
                        math = c(50,60,100,20),
                        class = c(1,1,2,2))

#외부 데이터 이용 

#readxl 패키지 설치 
install.packages("readxl")
library(readxl)

# session에서 set working directory -> 
# choose directory를 선택하여 엑셀 파일 폴더 지정 
setwd("C:/Users/14180/OneDrive/바탕 화면/과제/R기반 통계분석/3주차 excel 파일")
dir() #폴더에 들어있는 디렉토리 표시
df_exam = read_excel("excel_exam.xlsx")
df_exam

mean(df_exam$english)
colnames(df_exam) #컬럼이름 
row.names(df_exam) #로우이름 
mean(df_exam$science)

getwd() #현재 디렉토리 위치 

#만약 엑셀 파일의 첫 번째 행이 변수명이 아니라면? 
df_exam_novar = read_excel("excel_exam_novar.xlsx",col_names = F)
#col_names = F을 치면 임의의 이름을 만들어줌 

#만약 엑셀 파일에 시트가 여러개면??? 지정해주는 방법 
df_exam_sheet = read_excel("excel_exam_sheet.xlsx",sheet = 3)

#CSV 파일 불러오기 
df_csv_exam = read.csv("csv_exam.csv")
View(df_csv_exam) #대문자 V주의 

head(df_csv_exam) #앞에 6개만 보여줌 
head(df_csv_exam,10) # 콤마 숫자하면 앞에서 부터 그 숫자만큼 보여줌 
tail(df_csv_exam) #끝에서 6개 

#문자가 들어있는 파일을 불러올 때는 stringsAsFactrors = F

#데이터 프레임을 CSV 파일로 저장 

df_midterm = data.frame(english=c(90,80,70,60),
                        math = c(50,60,100,20),
                        class = c(1,1,2,2))
df_midterm

write.csv(df_midterm,file="df_midterm.csv")

#row name을 쓰기 싫다면?
write.csv(df_midterm,file="df_midterm_ROW X.csv",row.names = F) 

### RData 파일로 저장하기 ### - rda 파일은 자동으로 변수가 지정됨  

save(df_midterm,file="df_midterm.rda")
load("df_midterm.rda")

df_midterm
ls()

### 현재 작업을 전체 저장 RData 

save.image(file=".RData")

### 필요한 변수만 저장 

save(math,english,file = "1.RData")

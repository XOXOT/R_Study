
###2주차 2차시 1418083 최희태###

a = 1 # a <- 1
b = 2
d = c(3,5) # c()함수는 하나 이상의 변수를 잡을 때 씀 

var1 = c(1,2,3,7,8); a = c(1); #1열에 두가지 이상을 실행 시킬려면 새미콜론(;) 필수입력 
var2 = c(1:5)

var3 = seq(1,5) #1~5까지 연속값으로 var3 생성 by = 1이 디폴트 

var4 = seq(1,10,by = 2) #1~10까지 2간격 연속값으로 var4 생성 

#만약 처음보는 함수가 있다면?
?seq #help("seq")와 같다. 

var5 = seq(1,10,by = 3)  #1~10까지 3간격 연속값으로 var5 생성

var1+2 #var1에 있는 원소에 각각 2씩 더하기 

var1+var2 

str1 = "a"
str2 = "text"
str3 = "hello world!"

str4 = c("a","b","c")
str5 = c("Hello!", "world","is","good")

str1+2 #(문자는 연산 안됨)

#숫자를 다루는 함수 

x = c(1,2,3)
mean(x) #평균
max(x) #최대값
min(x) #최솟값 

#문자를 다루는 함수 

paste(str5, collapse = " ") #스페이스를 눌러 공간을 둠 
paste(str5, collapse = ",") #콤마를 눌러 각 원소 구분 

?paste

(x_mean = mean(x)) #변수를 설정할때 전체에 괄호를 치면 콘솔창에서 값을 볼 수있음 
(str5_paste = paste(str5, collapse = " "))

#install.packages("   ") #" "안에 패키지 이름을 쓰고 설치 
#library("    ") # " "안에 패키지 이름을 쓰면 패키지 로드 

library("ggplot2")

v = c("a","a","b","c")
qplot(v) #빈도 그래프 a가 두번 b,c가 한번 

head(mpg) #데이터 셋의 첫 6개를 출력 
qplot(data=mpg,x=hwy) #highway miles per gallon(연비) bins는 30이 디폴트 
?mpg
qplot(data=mpg,x=hwy,bins=20)

qplot(data =mpg, x =cty)
qplot(data=mpg,x=drv,y=hwy)
qplot(data=mpg,x=drv,y=hwy,geom="line") #점을 줄로 바꿈 
qplot(data=mpg,x=drv,y=hwy,geom="boxplot") #상자그림으로 바꿈 

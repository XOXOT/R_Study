
#1418083 최희태

#H0: compact = suv 0.05 이상
#H1: compact != suv 0.05 이하 

library(ggplot2)

#compact 자동차와 suv 자동차의 도시 연비 t 검정
mpg = as.data.frame(ggplot2::mpg)
library(dplyr) 
mpg_diff <- mpg%>%
  select(class, cty) %>%
  filter(class%in% c("compact", "suv"))

head(mpg_diff)

table(mpg_diff$class)

t.test(data = mpg_diff, cty ~ class, var.equal = T) #분산은 똑같다고 가정 
#대립가설 선택 - 같지 않다. 

#위와 같지만 더 복잡함 
t.test(mpg_diff[mpg_diff$class=="compact",2],
       mpg_diff[mpg_diff$class=="suv",2],
       var.equal = T)


#일반 휘발유와 고급휘발유의 도시 연비 T검정 

mpg_diff2 = mpg%>%
  select(fl,cty) %>%
  filter(fl%in% c ("r","p")) # r:regular, p:premium

table(mpg_diff2$fl)

t.test(data = mpg_diff2, cty ~ fl, var.equal = T)
#귀무가설을 채택 - 고급과 일반은 차이가 없다.(같다) 


#실업자 수와 개인 소비 지출의 상관관계

#데이터 준비
economics = as.data.frame(ggplot2::economics)

#상관분석
cor.test(economics$unemploy, economics$pce)
# 실업자 수와 개인 소비 지출 관계가 많다. (귀무가설 채택 X)


#상관행렬 히트맵 만들기
head(mtcars)

car_cor = cor(mtcars) # 상관행렬 생성
round(car_cor, 2) # 소수점 셋째 자리에서 반올림해서출력

#• 히트맵(heat map) : 값의 크기를 색깔로 표현한 그래프
install.packages("corrplot")
library(corrplot)

corrplot(car_cor)

#원 대신 상관계수 표시
corrplot(car_cor, method = "number")

#다양한 파라미터 지정하기
col = colorRampPalette(c("#BB4444", "#EE9988", "#FFFFFF", "#77AADD", "#4477AA"))

corrplot(car_cor,
          method = "color", # 색깔로 표현
          col = col(200), # 색상 200 개선정
          type = "lower", # 왼쪽 아래 행렬만 표시
          order = "hclust", # 유사한 상관계수끼리 군집화
          addCoef.col = "black", # 상관계수 색깔
          tl.col = "black", # 변수명 색깔
          tl.srt = 45, # 변수명 45 도기울임
          diag = F) # 대각 행렬 제외

#행 번호로 행 추출하기
#데이터 준비하기
exam <- read.csv("csv_exam.csv")

exam []

exam[1,] # 1 행추출
exam[2,] # 2 행추출

#조건을 충족하는 행 추출하기
exam[exam$class == 1,] # class가 1인 행 추출
exam[exam$math >= 80,] # 수학점수가 80점 이상인 행 추출

# 1반 이면서 수학점수가 50점 이상
exam[exam$class == 1 & exam$math >= 50,]
# 영어점수가 90점 미만이거나 과학점수가 50점 미만
exam[exam$english < 90 | exam$science < 50,]

#열 번호로 변수 추출하기
#대괄호안 쉼표 오른쪽에 조건을 입력
exam[,1] # 첫 번째 열 추출

exam[,2] # 두 번째 열 추출

exam[,3] # 세 번째 열 추출

#변수명으로 변수 추출하기
exam[, "class"] # class 변수 추출

exam[, "math"] # math 변수 추출

exam[,c("class", "math", "english")] #class, math, english 변수 추출

#행, 변수 동시 추출하기
# 행, 변수 모두 인덱스
exam[1,3]

# 행 인덱스, 열 변수명
exam[5, "english"]

# 행 부등호 조건, 열 변수명
exam[exam$math >= 50, "english"]

# 행 부등호 조건, 열 변수명
exam[exam$math >= 50, c("english", "science")]

#dplyr과 내장 함수의 차이

#문제) 수학 점수 50 이상, 영어 점수 80 이상인 학생들을 대상으로 각 반의 전 과목 총평균을
#구하라. 
#내장 함수 코드

exam$tot = (exam$math + exam$english + exam$science)/3
aggregate(data=exam[exam$math >= 50 & exam$english >= 80,], 
          tot~class, mean) 

#aggregate는 데이터의 특정 컬럼을 기준으로 통계량을 구해주는 함수 입니다.

#dplyr 코드
library(dplyr)
exam %>%
  filter(math >= 50 & english >= 80) %>% 
  mutate(tot = (math + english + science)/3) %>% 
  group_by(class) %>%
  summarise(mean = mean(tot))

mpg <- as.data.frame(ggplot2::mpg) # mpg 데이터 불러오기

mpg %>% 
  mutate(tot = (cty + hwy)/2) %>%　#통합 연비 변수 생성 
  filter(class == "compact" | class == "suv") %>% #compact, suv 추출 
  group_by(class) %>% #class별 분리 
  summarise(mean_tot = mean(tot)) #tot 평균 산출 


#변수 타입 간 차이 알아보기
var1 = c(1,2,3,1,2) # numeric 변수 생성
var2 = factor(c(1,2,3,1,2)) # factor 성 변수 생성

var1 # numeric 변수 출력
var2 # factor 변수 출력

var1+2 # numeric 변수로 연산
var2+2 # factor 변수로 연산

class(var1)
class(var2)

levels(var1)
levels(var2)

#문자로 구성된 factor 변수
var3 = c ("a", "b","b","c") # 문자 변수 생성
var4 =factor(c("a", "b","b", "c")) # 문자로 된 factor 변수 생성

class(var3)
class(var4)

#함수마다 적용 가능한 변수 타입이 다르다
mean(var1)
mean(var2)

#변수 타입 바꾸기
var2 <- as.numeric(var2) # numeric 타입으로 변환
mean(var2) # 함수 재적용

class(var2)

levels(var2)

#혼자서 해보기
#mpg데이터의drv 변수는 자동차의 구동 방식을 나타냅니다. mpg데이터를 이용해 아래 문제를 해결해 보세요.
# 1. drv 변수의 타입을 확인해 보세요.

# 2. drv 변수를 as.factor()를 이용해 factor 타입으로 변환한 후 다시 타입을 확인해 보세요.

#3. drv가 어떤 범주로 구성되는지 확인해 보세요.

class(mpg$drv)                 # 타입 확인
mpg$drv <- as.factor(mpg$drv)  # factor로 변환
class(mpg$drv)                 # 타입 확인
levels(mpg$drv)                # 범주 확인


#1. 벡터(Vactor)
#• 하나 또는 여러 개의 값으로 구성된 데이터 구조
#• 여러 타입을 섞을 수 없고, 한 가지 타입으로만 구성 가능
# 벡터 만들기
a <- 1
a

b <- "hello" 
b

# 데이터 구조 확인
class(a)
class(b)

#2. 데이터 프레임(Data Frame)
#• 행과 열로 구성된 2차원 데이터 구조
#• 다양한 변수 타입으로 구성 가능
# 데이터 프레임 만들기
x1 <- data.frame(var1 =c(1,2,3),
                 var2 = c("a","b","c"))
# 데이터 구조 확인
class(x1)

#3. 매트릭스(Matrix)
#• 행과 열로 구성된 2차원 데이터 구조
#• 한 가지 타입으로만 구성 가능

# 매트릭스 만들기 - 1~12 로 2 열 
x2 <- matrix(c(1:12), ncol = 2)
x2 <- matrix(c(1:12), ncol = 12)
x2

#4. 어레이(Array)
#• 2차원 이상으로 구성된 매트릭스
#• 한 가지 타입으로만 구성 가능
# array 만들기 - 1~20으로 2행 x 5열 x 2차원
x3 <- array(1:20, dim = c(2, 5, 2)) 
x3

#5. 리스트(List)
#• 모든 데이터 구조를 포함하는 데이터 구조
#• 여러 데이터 구조를 합해 하나의 리스트로 구성 가능
# 리스트 생성 - 앞에서 생성한 데이터 구조활용
x4 <- list(f1 = a, # 벡터
           f2 = x1, # 데이터 프레임
           f3 = x2, # 매트릭스
           f4 = x3) # 어레이
x4

# 데이터 구조 확인
class(x4)


#리스트 활용
#• 함수의 결과물이 리스트 형태로 반환되는 경우 많음
#• 리스트를 활용하면 함수의 결과물에서 특정 값을 추출 가능
#boxplot() 출력 결과물에서 값 추출하기
mpg <- ggplot2::mpg
x <- boxplot(mpg$cty)
x

x$stats[,1] # 요약 통계량 추출

x$stats[,1] [3] # 중앙값 추출

x$stats[,1] [2] # 1 분위수추출

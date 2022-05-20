df <- data.frame(sex=c("M","F",NA,"M","F"),
                 score = c(5,4,3,4,NA))
df #NA는 앞 뒤에 겹따옴표 없음 (Not Applicable)

#결측치 확인 (결측치일 경우 true 반환)
is.na(df)

#결측치 빈도 확인
table(is.na(df))

table(is.na(df$sex))
table(is.na(df$score))

#결측치 포함된 상태로  분석
mean(df$sex)
sum(df$score)

#결측치 제거하기 
library(dplyr)
df %>% filter(is.na(score)) #score가 na인 데이터만 출력 
df %>% filter(!is.na(score)) #score가 na가 아닌 데이터만 출력 

df_nomiss = df %>% filter(!is.na(score))
mean(df_nomiss$score) 
sum(df_nomiss$score) 

df_nomiss = df %>% filter(!is.na(score) & !is.na(sex))
df_nomiss

df_nomiss2 = na.omit(df) # 결측치가 하나라도 있으면 제거
df_nomiss2 #하지만 분석에 필요한 데이터까지 손실 될 가능성이 있음 ex) 성별 - 소득 관계 분석을 하는데 지역 결측치까지 제거해버림 

#함수의 결측치 제외 기능 이용 (na.rm=T)
sum(df$score, na.rm=T)
mean(df$score, na.rm=T)

#summarise()에서 na.rm=T 사용
dir()
exam = read.csv("csv_exam.csv")
exam[c(3,8,15), "math"] = NA #3,8,15행의 math에 NA 할당 

# %>% 이 부호는 '내에 있는'으로 봐도 무방  

exam %>% summarise(mean_math = mean(math)) #결측치가 있으니 안됨
exam %>% summarise(mean_math = mean(math,na.rm=T))

exam %>% summarise(mean_math = mean(math,na.rm=T),
                   sum_math = sum(math,na.rm=T),
                   median_math = median(math,na.rm=T)) #평균, 합계, 중앙값 

#2차시

#결측치 대체법(Imputation)
# • 대표값(평균, 최빈값 등)으로 일괄 대체
# • 통계분석 기법 적용, 예측값 추정해서 대체

mean(exam$math,na.rm =T)

exam$math <- ifelse(is.na(exam$math), 55, exam$math) # math가 NA면 55로 대체
table(is.na(exam$math)) # 결측치 빈도표 생성
exam #평균 값인 55로 NA값을 전부 데체
mean(exam$math)

# 이상치(Outlier) - 정상범주에서 크게 벗어난 값
# 이상치 포함시 분석 결과 왜곡
# 결측 처리 후 제외하고 분석

# 존재할 수 없는 값 성별 변수에 3 ->결측 처리
# 극단적인 값 몸무게 변수에 200 정상범위 기준 정해서 - > 결측 처리
 
outlier <- data.frame(sex = c(1, 2, 1, 3, 2, 1 ) ,
                            score = c(5, 4, 3, 4, 2, 6))

outlier

table(outlier$sex)
table(outlier$score) 

outlier$sex <- ifelse(outlier$sex == 3, NA, outlier$sex) 
outlier

outlier$score <- ifelse(outlier$score > 5, NA, outlier$score) 
outlier

outlier %>%
  filter(!is.na (sex) & !is.na(score)) %>% 
  group_by(sex) %>% #성별로 그룹을 나눠라 
  summarise(mean_score = mean(score)) #변수 이름을 저장해라 

#이상치 제거하기 - 2. 극단적인 값
# 정상범위 기준 정해서 벗어나면 결측 처리

#논리적 판단
#성인 몸무게 40kg~150kg 벗어나면 극단치
#통계적 판단
#상하위 0.3% 극단치 또는 상자그림 1.5 IQR 벗어나면 극단치

mpg <- as.data.frame(ggplot2::mpg)
boxplot(mpg$hwy)
boxplot(mpg$hwy)$stats #상자그림 통계치 출력 

dim(mpg) #234개의 관측지수, 11개의 변수

#결측 처리하기
# 12~37 벗어나면 NA 할당
mpg$hwy <- ifelse(mpg$hwy < 12 | mpg$hwy > 37, NA, mpg$hwy) #\의 의미는 또는 
table(is.na(mpg$hwy))

#결측치 제외하고 분석하기
mpg%>%
  group_by(drv) %>%
  summarise(mean_hwy = mean(hwy, na.rm = T))

#percentile ?

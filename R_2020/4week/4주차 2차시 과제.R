
#1418083 최희태#


#1. ggplot2 패키지에는 미국 동북중부 437개 지역의 인구통계 정보를 담은 midwest라는 데이터가 포함되어  있습니다. 
#   midwest 데이터를 사용해 데이터 분석 문제를 해결해보세요.


# a) ggplot2 의 midwest 데이터를 데이터 프레임 형태로 불러와서 데이터의 특성을 파악하세요.

library(ggplot2) #ggplot2 라이브러리 불러옴 

midwest = as.data.frame(ggplot2::midwest) #midwest 데이터를 데이터 프레임 형태로 불러옴 

head(midwest) #raw 데이터 앞부분 6개 출력 
tail(midwest) #raw 데이터 뒷부분 6개 출력 
View(midwest) #raw 데이터 뷰어로 전체 데이터 확인
dim(midwest)  #데이터의 행과 열 개수 출력 
str(midwest)  #데이터 속성 확인 
summary(midwest) #데이터 요약 통계량 출력 

# b) poptotal(전체 인구)을 total 로, popasian(아시아 인구)을 asian 으로 변수명을 수정하세요.

library(dplyr) #dplyr 로드 
midwest_new = midwest # midwest 복사본 생성 
midwest_new = rename(midwest_new,total = poptotal, asian = popasian) #poptotal를 total, popasian을 asian으로 변경
 
# c) total, asian 변수를 이용해 '전체 인구 대비 아시아 인구 백분율' 파생변수를 만들고, 
#    히스토그램을  만들어 도시들이 어떻게 분포하는지 살펴보세요.

midwest_new$per = (midwest_new$asian/midwest_new$total)*100 #파생변수 per

# d) 아시아 인구 백분율 전체 평균을 구하고, 평균을 초과하면 "large", 그 외에는 "small"을 
#    부여하는  파생변수를 만들어 보세요.

mean(midwest_new$per) #아시아 인구 백분율 전체 평균
midwest_new$logic = ifelse(midwest_new$per > mean(midwest_new$per),"large",'small')

# e) "large"와 "small"에 해당하는 지역이 얼마나 되는지, 빈도표와 빈도 막대 그래프를 만들어 
#    확인해  보세요.

table(midwest_new$logic) #빈도표 
qplot(data = midwest_new, logic) #빈도 막대 그래프 

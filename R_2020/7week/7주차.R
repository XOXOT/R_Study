library(ggplot2)

#배경생성 
ggplot(data = mpg, aes(x=displ,y=hwy)) 

#그래프 추가하기 
ggplot(data = mpg, aes(x=displ,y=hwy)) + geom_point() 

# 3. 축 범위를 조정하는 설정 추가하기# 

# x축 범위 3~6으로 지정
ggplot(data = mpg, aes(x=displ,y=hwy)) + geom_point() + xlim(3, 6)

# x축 범위 3~6, y축 범위 10~30으로 지정
ggplot(data = mpg, aes(x=displ,y=hwy)) +
  geom_point() +
  xlim(3, 6) + # +가 항상 위에 붙어야함 
  ylim(10, 30)



library(dplyr)
df_mpg <- mpg %>% group_by(drv) %>%
  summarise(mean_hwy = mean(hwy))
df_mpg

#바 형태로 그래프 생성 
ggplot(data = df_mpg, aes(x = drv, y = mean_hwy)) + geom_col() 

# 3. 크기 순으로 정렬하기
ggplot(data = df_mpg, aes(x = reorder(drv, -mean_hwy), y = mean_hwy)) + geom_col()
#reorder함수는 작은거부터 큰걸로 표시해주는데 -를 붙여 큰거부터 표시되게 해줌 

# • 값의 개수(빈도)로 막대의 길이를 표현한 그래프
# x축 범주 변수, y축 빈도
ggplot(data = mpg, aes(x = drv)) + geom_bar() #geom_col()은 y가 있어야 쓸 수있다. 

ggplot(data = mpg, aes(x = hwy)) + geom_bar() #바 자체가 하나의 구간을 의미함  



#시계열 그래프 만들기
ggplot(data = economics, aes(x = date, y = unemploy)) + geom_line()

#psavert(개인 저축률)가 시간에 따라서 어떻게 변해왔는지 알아보려고 합니다. 시간에 따른 개인
#저축률의 변화를 나타낸 시계열 그래프를 만들어 보세요.
#psavert (개인 저축률)가 시간에 따라서 어떻게 변해왔는지 알아보려고 합니다. 시간에 따른 개
#인 저축률의 변화를 나타낸 시계열 그래프를 만들어 보세요.
ggplot(data = economics, aes(x = date, y = psavert)) + geom_line()



#상자그림 - 집단 간 분포 차이 표현 
# 분포를 알 수 있기 때문에 평균만 볼 때보다 데이터의 특성을 좀 더 자세히 이해할 수있음

ggplot(data = mpg, aes(x = drv, y = hwy)) + geom_boxplot()

class_mpg <- mpg %>%
  filter(class %in% c("compact", "subcompact", "suv"))
ggplot(data = class_mpg, aes(x = class, y = cty)) + geom_boxplot()


#필터링이 잘됐는지 확인하고 싶을 때
unique(class_mpg$class)
table(class_mpg$class)


#시험 끝나고 다음주에 다시 보기 7-2 36분부터 

## 데이터 분석 준비하기 
install.packages("foreign")
library(foreign)
library(dplyr)                                        
library(ggplot2)
library(readxl)
dir()



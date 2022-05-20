#1418083 최희태 

#install.packages (“mapproj")
#install.packages("ggiraphExtra")

library(ggiraphExtra)

str(USArrests)
head(USArrests)

#install.packages("tibble")
library(tibble)

# 행 이름을 state 변수로 바꿔 데이터 프레임생성
crime <- rownames_to_column(USArrests, var = "state")
dim(crime)

# 지도 데이터와 동일하게 맞추기 위해 state의 값을 소문자로 수정
crime$state <- tolower(crime$state)
str(crime)

#미국 주 지도 데이터 준비하기
library(ggplot2)
#install.packages("maps")
library(maps) # 미국 주별 위경도데이터포함
states_map <- map_data("state") 
str(states_map)

#단계 구분도 만들기
ggChoropleth(data = crime, # 지도에 표현할 데이터
             aes (fill = Murder, # 색깔로 표현할 변수
                   map_id = state), # 지역 기준 변수
             map = states_map) # 지도 데이터

#인터랙티브 단계 구분도 만들기 - 지도에 커서를 가져다대면 정보 보여줌 
ggChoropleth(data = crime,  # 지도에 표현할 데이터
             aes (fill = Murder, # 색깔로 표현할 변수
                   map_id =state) , # 지역 기준 변수
             map = states_map, # 지도 데이터
             interactive = T) # 인터랙티브 기본값은 FALSE


#대한민국 시도별 인구 단계 구분도 만들기

#install.packages("stringi")
#install.packages("devtools")
#devtools::install_github("cardiomoon/kormaps2014")

library(kormaps2014)
str(changeCode(korpop1))
library(dplyr)
korpop1 <- rename(korpop1,
                  pop = 총인구_명,
                  name = 행정구역별_읍면동)
str(changeCode(kormap1))

library(ggiraphExtra)
library(ggplot2)


#단계 구분도 만들기
korpop1$name = iconv(korpop1$name, "UTF-8","CP949") #한글 인코딩 

ggChoropleth(data = korpop1, # 지도에 표현할 데이터
             aes(fill = pop, # 색깔로 표현할 변수
                   map_id = code, # 지역 기준 변수
                   tooltip = name), # 지도 위에 표시할 지역명
             map = kormap1, # 지도 데이터
             interactive = T) 


#대한민국 시도별 결핵 환자 수 단계 구분도 만들기
str(changeCode(tbc))

tbc$name = iconv(tbc$name, "UTF-8","CP949") #한글 인코딩 
 ggChoropleth(data =tbc , # 지도에 표현할 데이터
             aes (fill = NewPts, # 색깔로 표현할 변수
                  map_id = code, # 지역 기준 변수
                  tooltip = name), # 지도 위에 표시할 지역 
                  map = kormap1, # 지도 데이터
                  interactive = T) 
 
#plotly 패키지로 인터랙티브 그래프 만들기

#install.packages("plotly")
library(plotly)

#ggplot으로 그래프 만들기 
library(ggplot2)
mpg <- as.data.frame(ggplot2::mpg)
p = ggplot(data=mpg,aes(x=displ,y=hwy,col=drv))+ 
  geom_point()
p

#인터랙티브 그래프 만들기
ggplotly(p)


#인터랙티브 막대 그래프 만들기
p = ggplot(data = diamonds,aes(x=cut,fill=clarity)) +
  geom_bar(position = "dodge")
ggplotly(p)


#인터랙티브 시계열 그래프 만들기
#패키지 준비하기
install.packages("dygraphs")
library(dygraphs)

#데이터 준비하기
economics <- ggplot2::economics
head(economics)

#시간 순서 속성을 지니는 xts 데이터 타입으로 변경
library(xts)
eco <- xts(economics$unemploy, order.by = economics$date)
head(eco)

#인터랙티브 시계열 그래프 만들기
# 그래프 생성
dygraph(eco) #

#날짜 범위 선택 기능
library(dplyr)
dygraph(eco)%>%dyRangeSelector()

#여러 값 표현하기
# 저축률
eco_a = xts(economics$psavert, order.by = economics$date)
# 실업자 수
eco_b = xts(economics$unemploy/1000, order.by = economics$date)

#합치기
eco2 = cbind(eco_a, eco_b) # 데이터 결합합
colnames(eco2) <- c("psavert", "unemploy") # 합변수명 바꾸기
head(eco2)

#그래프 
dygraph(eco2) %>%dyRangeSelector()

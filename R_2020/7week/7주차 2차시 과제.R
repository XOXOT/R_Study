

#1418083 최희태 

# Q1. 어떤 회사에서 생산한 “suv”차종의 도시 연비가 높은지 알아 보려고 합니다. 
#    “suv”차종을 대상으로 평균 cty(도시연비)가 가장 높은 회사 다섯 곳을 막대 그래프로 표현해 보세요. 막대는 연비가 높은 순으로 정렬하세요.

# 필터링 작업 

library(ggplot2)
library(dplyr)

df = mpg %>% 
  filter(class == "suv") %>% 
  group_by(manufacturer) %>% 
  summarise(mean_cty=mean(cty)) %>% 
  arrange(desc(mean_cty)) %>% 
  head(5)

# 그래프 생성

ggplot(data = df, aes(x = reorder(manufacturer, -mean_cty),
                      y = mean_cty)) + geom_col()


#  Q2. 자동차 중에서 어떤 class (자동차 종류)가 가장 많은지 알아보려고 합니다. 
#    자동차 종류별 빈도를 표현한 막대그래프를 만들어 보세요.

ggplot(data = mpg, aes(x = class)) + geom_bar()
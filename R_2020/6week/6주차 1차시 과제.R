

#1418083 최희태

library(ggplot2)
library(dplyr)
mpg <- as.data.frame(ggplot2::mpg)          
mpg[c(65, 124, 131, 153, 212), "hwy"] <- NA  # NA 할당하기

# Q1. drv(구동방식)별로 hwy(고속도로 연비) 평균이 어떻게 다른지 알아보려고 합니다. 
# 분석을 하기 전에  우선 두 변수에 결측치가 있는지 확인해야 합니다. drv 변수와 hwy 변수에 결측치가 몇 개 있는지  알아보세요.

table(is.na(mpg$drv))  # drv 결측치 빈도 FALSE 234
table(is.na(mpg$hwy))  # hwy 결측치 빈도 FALSE 229 TRUE 5

# Q2. filter()를 이용해 hwy 변수의 결측치를 제외하고, 어떤 구동방식의 hwy 평균이 높은지 알아보세요.  하나의 dplyr 구문으로 만들어야 합니다.

mpg %>% filter(!is.na(hwy)) %>% group_by(drv) %>% summarise(mean_hwy = mean(hwy))
#결과를 보면 f(전륜구동) 방식이 평균이 높음 

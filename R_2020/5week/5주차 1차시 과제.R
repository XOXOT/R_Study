
# 1418083 최희태 

library(ggplot2)
mpg <- as.data.frame(ggplot2::mpg)
library(dplyr)

# 1. 자동차 배기량에 따라 고속도로 연비가 다른지 알아보려고 합니다. displ(배기량)이 4 이하인 자동차와 5 이상인 자동차 중 
#    어떤 자동차의 hwy(고속도로 연비)가 평균적으로 더 높은지 알아보세요.

disp4 <- mpg %>%  filter(displ <= 4)
disp5 <- mpg %>%  filter(displ >= 5)
mean(disp4$hwy) #베기량 4 이하인 자동차가 평균적으로 고속도로 연비가 높음 
mean(disp5$hwy)

# 2. 자동차 제조 회사에 따라 도시 연비가 다른지 알아보려고 합니다. "audi"와 "toyota" 중 어느 manufacturer(자동차 제조 회사)의 
# cty(도시 연비)가 평균적으로 더 높은지 알아보세요.

audi <- mpg %>% filter(manufacturer == "audi")
toyota <- mpg %>% filter(manufacturer == "toyota")
mean(audi$cty)
mean(toyota$cty) #도요타가 도시 연비가 평균적으로 더 높음 

# 3. "chevrolet", "ford", "honda" 자동차의 고속도로 연비 평균을 알아보려고 합니다. 
# 이 회사들의  자동차를 추출한 뒤 hwy 전체 평균을 구해보세요.

manufac3 <- mpg %>% filter(manufacturer %in% c("chevrolet", "ford", "honda"))
mean(manufac3$hwy)

d
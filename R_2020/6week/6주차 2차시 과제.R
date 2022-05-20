

#1418083 최희태

library(ggplot2)
library(dplyr)
mpg <- as.data.frame(ggplot2::mpg) 

mpg[c(10, 14, 58, 93), "drv"] <- "k"                # drv 이상치 할당
mpg[c(29, 43, 129, 203), "cty"] <- c(3, 4, 39, 42)  # cty 이상치 할당

# Q1. drv 에 이상치가 있는지 확인하세요. 이상치를 결측 처리한 다음 이상치가 사라졌는지 확인하세요. 
#     결측  처리 할 때는 %in% 기호를 활용하세요.

table(mpg$drv) #이상치 확인 # 이상치인 k가 4개 존재 
mpg$drv <- ifelse(mpg$drv %in% c("4", "f", "r"), mpg$drv, NA)
table(mpg$drv)

# Q2. 상자 그림을 이용해서 cty 에 이상치가 있는지 확인하세요. 
#     상자 그림의 통계치를 이용해 정상 범위를  벗어난 값을 결측 처리한 후 다시 상자 그림을 만들어 이상치가 사라졌는지 확인하세요.

boxplot(mpg$cty)$stats #정상 범위는 9보다 작거나 26보다 큰것 
mpg$cty <- ifelse(mpg$cty < 9 | mpg$cty > 26, NA, mpg$cty)
boxplot(mpg$cty)

# Q3. 두 변수의 이상치를 결측처리 했으니 이제 분석할 차례입니다. 이상치를 제외한 다음 drv 별로 cty
#     평균이 어떻게 다른지 알아보세요. 하나의 dplyr 구문으로 만들어야 합니다.

mpg %>% filter(!is.na(drv) & !is.na(cty)) %>%  # 결측치를 제외
        group_by(drv) %>%                      # drv별로 분리
        summarise(mean_hwy = mean(cty))        # cty 평균
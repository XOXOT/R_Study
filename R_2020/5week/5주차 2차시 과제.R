
### 1418083 최희태 

library(ggplot2)
mpg <- as.data.frame(ggplot2::mpg)
library(dplyr)

# 1. mpg 데이터 복사본을 만들고, cty 와 hwy 를 더한 '합산 연비 변수'를 추가하세요.

total_mpg <- mpg %>% mutate(total = cty + hwy)
head(total_mpg)

# 2. 앞에서 만든 '합산 연비 변수'를 2 로 나눠 '평균 연비 변수'를 추가하세요.

total_mpg <- mpg %>% mutate(total = cty + hwy, mean = total/2)
head(total_mpg)

# 3. '평균 연비 변수'가 가장 높은 자동차 3 종의 데이터를 출력하세요.

total_mpg %>% arrange(desc(mean)) %>% head(3)

































mpg %>% mutate(total = cty + hwy, mean = total/2) %>% 
  arrange(desc(mean)) %>% 
  head(3)
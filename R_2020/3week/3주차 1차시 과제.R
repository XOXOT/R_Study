
### 1418083 최희태 ###

library(ggplot2) #ggplot2 라이브러리 불러옴

#Q1. mpg 데이터에서 cty와 hwy 데이터에 대한 평균을 구하시오.
#    library(ggplot2) #mpg데이터가 이 패키지 안에 포함됨

mean(mpg$cty) #도시연비 평균
mean(mpg$hwy) #고속연비 평균 


#Q2.  qplot을 이용하여 x = cty와 y = hwy를 그리고 
#     x좌표와 y좌표에 각각 “CITY”, “HIGHWAY”를 라벨링하시오.
#     또한 그림위에 제목(title)도 라벨링하시오.

qplot(data = mpg, x=cty, y=hwy) + ggtitle("CITY+HIGHWAY") + 
  xlab("CITY") + ylab("HIGHWAY")


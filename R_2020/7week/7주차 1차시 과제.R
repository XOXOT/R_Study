
#1418083 최희태 
# Q1. mpg 데이터의 cty(도시연비)와 hwy(고소도로연비)간에 어떤 관계가 있는지 알아보려고 합니다. 
#     x축은 cty, y축은 hwy로 된 산점도를 만들어 보세요. 

library(ggplot2)
ggplot(data = mpg, aes(x = cty, y = hwy)) + geom_point()

# Q2. 비국 지역별 인구통계 정보를 담은 ggplot2패키지의 midwest 데이터를 이용해서 전체 인구와 아시아인 인구 간에 어떤 관계가 있는지 알아보려고 합니다. 
#    x축은 poptotal(전체인구), y축은 popasian(아시아인 인구)으로 된 산점도를 만들어 보세요. 
#     전체 인구는 50만명 이하, 아시아인 인구는 1만명 이하인 지역만 산점도에 표시되게 설정하세요.

ggplot(data = midwest, aes(x = poptotal, y = popasian)) + geom_point() + xlim(0, 500000) + ylim(0, 10000)

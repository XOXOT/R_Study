
### 1418083 최희태 ###

library(ggplot2)
library(dplyr)
mpg = as.data.frame((ggplot2::mpg))

#01. ggplot2 패키지의 mpg 데이터를 사용할 수 있도록 불러온 뒤 복사본을 만드세요 
mpg_new = mpg

#02. 복사본 데이터를 이용해서 cty는 city로, hwy는 highway로 변수명을 수정하세요. 
mpg_new = rename(mpg_new, city = cty, highway = hwy)

#03. 데이터 일부를 출력해서 변수명이 바뀌었는지 확인해 보세요. 아래와 같은 결과물이 출력되어야 합니다. 
head(mpg_new)


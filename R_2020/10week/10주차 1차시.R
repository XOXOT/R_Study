#1418083 최희태 

library(foreign) # SPSS 파일 로드
library(dplyr) # 전처리
library(ggplot2) # 시각화
library(readxl) 

raw_welfare <- read.spss(file = "Koweps_hpc10_2015_beta1.sav", to.data.frame = T)

welfare = raw_welfare

##변수명 바꾸기
welfare <- rename(welfare,
                  sex = h10_g3, # 성별
                  birth = h10_g4, # 태어난 연도
                  marriage = h10_g10, # 혼인 상태
                  religion = h10_g11, # 종교
                  income = p1002_8aq1, # 월급
                  code_job = h10_eco9, # 직종 코드
                  code_region = h10_reg7) # 지역 코드

#나이 변수 만들기
welfare$age <- 2015 - welfare$birth + 1

#연령대 변수 검토 
welfare = welfare %>%
  mutate(ageg = ifelse(age < 30, "young",
                        ifelse(age <= 59, "middle", "old")))
table(welfare$ageg)
qplot(welfare$ageg)


options(pillar.sigfig=5) # 소수점 표현하고 싶을 때 사용 (총 5개 숫자로 구해라.)
ageg_income <- welfare %>%
  filter(!is.na(income)) %>% 
  group_by(ageg) %>% 
  summarise(mean_income = mean(income))
ageg_income

ggplot(data = ageg_income, aes(x = ageg, y = mean_income)) + geom_col()

#막대 정렬하는법 
ggplot(data = ageg_income, aes(x = ageg, y = mean_income)) + 
  geom_col() +
  scale_x_discrete(limits = c("young","middle","old"))


                   
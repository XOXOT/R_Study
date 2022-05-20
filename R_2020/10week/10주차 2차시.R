#1418083 최희태 

options(pillar.sigfig=5)

sex_income = welfare %>%
  filter(!is.na(income)) %>% 
  group_by(ageg, sex) %>% 
  summarise(mean_income = mean(income)) 
sex_income

#groups의 경고창을 지우고 싶으면 
sex_income = welfare %>%
  filter(!is.na(income)) %>% 
  group_by(ageg, sex) %>% 
  summarise(mean_income = mean(income),.groups='drop')
sex_income

#성별부여
welfare$sex = ifelse(welfare$sex == 1, "male", "female")


ggplot(data = sex_income, aes(x = ageg, y = mean_income, fill = sex)) +
  geom_col() +
  scale_x_discrete(limits = c("young", "middle", "old"))
sex_income

#표 옵션 변경(막대 분리)
ggplot(data = sex_income, aes(x = ageg, y = mean_income, fill = sex)) +
  geom_col(position = "dodge") +
  scale_x_discrete(limits = c("young", "middle", "old"))

# 성별 연령별 월급 평균표만들기
sex_age = welfare %>% 
  filter(!is.na(income)) %>% 
  group_by(age, sex) %>% 
  summarise(mean_income = mean(income),.groups='drop')
head(sex_age)

#선그래프 구하기 
ggplot(data = sex_age, aes(x = age, y = mean_income, col = sex)) + geom_line()

#변수 검토하기 (직업별 분류)
class(welfare$code_job)
table(welfare$code_job)

library(readxl)
list_job = read_excel("Koweps_Codebook.xlsx", col_names = T, sheet = 2)
excel("Koweps_Codebook.xlsx", col_names = T, sheet = 2)
head(list_job)

#조인
welfare = left_join(welfare,list_job ,id = "code_job")

welfare %>%
  filter(!is.na(code_job)) %>%
  select(code_job, job) %>%
  head(10)

job_income = welfare %>% 
  filter(!is.na(job)&!is.na(income)) %>% 
  group_by(job) %>%
  summarise(mean_income = mean(income))
head(job_income)

#top10
top10 = job_income %>% 
  arrange(desc(mean_income)) %>% 
  head(10)
top10

#top10 시각화
ggplot(data = top10, aes(x = reorder(job, mean_income), y = mean_income)) +
  geom_col() +
  coord_flip() #좌측으로 눕히는 함수 

#bottom10 
bottom10 <- job_income %>%arrange(mean_income) %>%head(10)
bottom10

#bottom10 시각화
ggplot(data = bottom10, aes(x = reorder(job, -mean_income),
                            y = mean_income)) +
  geom_col() + 
  coord_flip() + 
  ylim(0, 850)

#성별로 어떤 직업이 많은가? 

job_male <- welfare %>% 
  filter(!is.na(job)& sex == "male") %>% 
  group_by(job) %>%
  summarise(n = n()) %>% 
  arrange(desc(n)) %>%
  head(10)
job_male

job_female <- welfare %>% 
  filter(!is.na(job)& sex == "female") %>% 
  group_by(job) %>%
  summarise(n = n()) %>% 
  arrange(desc(n)) %>%
  head(10)
job_female

# 남성 직업 빈도 상위 10개 직업
ggplot(data = job_male, aes(x = reorder(job,n) ,y = n)) +
  geom_col() +
  coord_flip()

# 여성 직업 빈도 상위 10개 직업
ggplot(data = job_female, aes(x = reorder(job, n ),y = n )) +
  geom_col() +
  coord_flip()

#종교 유무에 따른 이혼율 

class(welfare$religion) 
table(welfare$religion)

#종교가 있는가 없는가?
welfare$religion <- ifelse(welfare$religion == 1,"yes","no")
table(welfare$religion)

qplot(welfare$religion)

#혼인 상태 
class(welfare$marriage)
table(welfare$marriage)

#1은 결혼, 3은 이혼 
welfare$group_marriage <- ifelse(welfare$marriage == 1, "marriage",
                                 ifelse(welfare$marriage == 3, "divorce", NA))
table(welfare$group_marriage) 
table(is.na(welfare$group_marriage))

qplot(welfare$group_marriage)

#종교 유무에 따른 이혼율 표 만들기

religion_marriage = welfare %>% 
  filter(!is.na(group_marriage)) %>% 
  group_by(religion, group_marriage) %>% 
  summarise(n = n()) %>% 
  mutate(tot_group = sum(n)) %>%
  mutate(pct = round(n/tot_group*100, 1)) #비율에 *100을 하여 백분율 반들기 
religion_marriage

#count() 활용
religion_marriage <- welfare %>%
  filter(!is.na(group_marriage)) %>% 
  count(religion, group_marriage) %>% 
  group_by(religion) %>%
  mutate(pct = round(n/sum(n)*100, 1))





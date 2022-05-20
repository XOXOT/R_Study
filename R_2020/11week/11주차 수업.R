# 이혼 추출
divorce = religion_marriage %>% 
  filter(group_marriage == "divorce") %>% 
  select(religion, pct)
ggplot(data = divorce, aes(x = religion, y=pct)) + geom_col()


#1. 연령대별 이혼율 표 만들기
ageg_marriage = welfare %>%
  filter(!is.na(group_marriage)) %>% 
  group_by(ageg, group_marriage) %>% 
  summarise(n = n()) %>% 
  mutate(tot_group = sum(n)) %>%
  mutate(pct = round(n/tot_group*100, 1))
ageg_marriage


#count() 활용
ageg_marriage <- welfare %>%
  filter(!is.na(group_marriage)) %>% 
  count(ageg, group_marriage) %>% 
  group_by(ageg) %>%
  mutate(pct = round(n/sum(n)*100, 1))

#2. 연령대별 이혼율 그래프 만들기
# 초년 제외, 이혼 추출
ageg_divorce <- ageg_marriage %>%
  filter(ageg != "young" & group_marriage == "divorce") %>%
  select(ageg, pct)
ageg_divorce
# 그래프 만들기
ggplot(data = ageg_divorce, aes(x = ageg, y =pct)) + geom_col()


#3. 연령대 및 종교 유무에 따른 이혼율 표 만들기
# 연령대, 종교유무, 결혼상태별 비율표 만들기
ageg_religion_marriage <- welfare %>% 
  filter(!is.na(group_marriage) & ageg != "young") %>% 
  group_by(ageg, religion, group_marriage) %>% 
  summarise(n = n()) %>%
  mutate(tot_group = sum(n)) %>%
  mutate(pct = round(n/tot_group*100, 1))
ageg_religion_marriage

#count() 활용
ageg_religion_marriage <- welfare %>%
  filter(!is.na(group_marriage) & ageg != "young") %>% 
  count(ageg,religion, group_marriage) %>% 
  group_by(ageg, religion) %>%
  mutate(pct = round(n/sum(n)*100,1))


#연령대 및 종교 유무별 이혼율 표 만들기
df_divorce <- ageg_religion_marriage %>%
  filter(group_marriage == "divorce") %>%
  select(ageg,religion,pct)
df_divorce

ggplot(data = df_divorce, aes(x = ageg, y = pct , fill=religion) ) +
  geom_col(position = "dodge")

#노년층이 많은 지역은 어디인가?
class(welfare$code_region)
table(welfare$code_region) 

# 지역 코드 목록 만들기
list_region <- data.frame(code_region = c(1:7),
                          region = c("서울",
                                      "수도권(인천/경기) ",
                                      " 부산/ 경남/ 울산"
                                      , "대구/경북",
                                      "대전/충남",
                                      "강원/충북",
                                      " 광주/ 전남/ 전북/ 제주도"))

#welfare에 지역명 변수 추가
welfare = left_join(welfare,list_region,id ="code_region")

#1. 지역별 연령대 비율표 만들기
region_ageg <- welfare %>%
  group_by(region, ageg) %>% 
  summarise(n = n()) %>% 
  mutate(tot_group = sum(n)) %>%
  mutate(pct = round(n/tot_group*100, 2))

head(region_ageg)

#count() 활용
region_ageg <- welfare %>%
  count(region, ageg) %>%
  group_by(region) %>%
  mutate(pct = round(n/sum(n)*100, 2))

#. 그래프 만들기
ggplot(data = region_ageg, aes(x = region, y = pct,fill = ageg)) +
  geom_col() +
  coord_flip()

# 노년층 비율 내림차순 정렬
list_order_old <- region_ageg %>% 
  filter(ageg == "old") %>% 
  arrange(pct)

# 지역명 순서 변수 만들기
order <- list_order_old$region 
order

ggplot(data = region_ageg, aes(x = region, y = pct, fill = ageg)) +
  geom_col() +
  coord_flip() +
  scale_x_discrete(limits = order)


#연령대 순으로 막대 색깔 나열하기
class(region_ageg$ageg)

levels (region_ageg$ageg) 

region_ageg$ageg <- factor(region_ageg$ageg,
                           level = c("old", "middle", "young"))
class(region_ageg$ageg)

levels(region_ageg$ageg)

ggplot(data = region_ageg, aes(x = region, y = pct , fill = ageg)) +
  geom_col() +
  coord_flip() +
  scale_x_discrete(limits = order)









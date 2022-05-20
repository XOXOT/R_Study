
library(dplyr)
exam = read.csv("csv_exam.csv")
exam
exam %>% filter(class == 1) #class가 1인 것만 필터
exam %>% filter(class == 2) #class가 2인 것만 필터
unique(exam$class) #class가 중첩되지 않게 모든 클래스의 종류를 보여줌 
exam %>% filter(class != 1) #class가 1이 아닌 것만 필터
exam %>% filter(math > 50) #수학 성적이 50점을 초과한 경우 
exam %>% filter(english >= 80) #영어 성적이 80점 이상인 경우 필터
exam %>% filter(class == 1 & math >= 50) #1분반이면서 수학성적이 50점이상 필터 
exam %>% filter(english>=90 | math >= 90) #영어 성적이 90이상이거나 수학성적이 90점 이상인 경우 필터 
exam %>% filter(class == 1 | class == 3 | class == 5); exam %>% filter(class %in% c(1,3,5));  #1,3,5 분반만 추출 %in%을 써서 한번에 가능 

class1 = exam %>% filter(class == 1)
class2 = exam %>% filter(class == 2)

mean(class1$math)
mean(class2$english)

exam %>% select(math)
exam %>% select(english)

exam %>% select(!english); exam %>% select(-english)

exam %>% select(-english,-math)

# 함수 조합 
exam %>% filter(class ==1) %>% select(english)

#보기 좋게 열바꿈 
exam %>% 
  filter(class ==1) %>% 
  select(english)

#일부 출력 
exam %>% 
  select(id,math) %>% 
  head(10)

#arrange 함수로 정렬 
exam %>% arrange(math) #오름차순 
exam %>% arrange(desc(math)) #내림차순 
exam %>% arrange(class, math) #class로 오름차순하고 math 오름차순 

#파생변수 추가 
exam %>% 
  mutate(total = math + english + science) %>% 
  head

#2개추가 
exam %>% 
  mutate(total = math + english + science,
         mean = (math + english + science)/3) %>% 
           head
exam %>% 
  mutate(test = ifelse(science>=60, "pass", "fail"))

#2개의 함수 한꺼번에 
exam %>% 
  mutate(total = math + english + science) %>% 
  arrange(total) %>% 
  head

exam %>% summarise(mean_math=mean(math))

exam %>% 
  group_by(class) %>% 
  summarise(mean_math=mean(math))


exam %>% 
  group_by(class) %>% 
  summarise(mean_math=mean(math),
            sum_math=sum(math),
            median_math=median(math),
            n=n()) #n()은 빈도 함수 -학생 수

mpg %>% 
  group_by(manufacturer,drv) %>% 
  summarise(mean_cty=mean(cty)) %>% 
  head(10)

mpg %>% 
  group_by(manufacturer) %>% 
  filter(class=="suv") %>% 
  mutate(tot=(cty+hwy)/2) %>% 
  summarise(mean_tot=mean(tot)) %>% 
  arrange(desc(mean_tot)) %>% 
  head(10)

# 데이터 합치기 

# 중간고사데이터생성
test1 <-data.frame(id =c(1,2,3,4,5),
                   midterm=c(60,80, 70, 90,85))

# 기말고사데이터생성
test2 <-data.frame(id = c(1, 2, 3, 4,5),
                   final = c(70, 83, 65, 95,80))

#left_join은 열기준으로 데이터 합치기 
total = left_join(test1, test2, by = "id")
total 

total = left_join(class = c(1,2,3,4,5),)

name <- data.frame(class = c(1, 2, 3, 4, 5 ) ,
                   teacher = c("kim", "lee", "park", "choi", "jung"))
name

exam_new <- left_join(exam, name, by = "class")
exam_new

# 학생 1~5번 시험 데이터 생성
group_a <- data.frame(id = c(1, 2, 3, 4, 5) ,
                      test = c(60, 80, 70, 90, 85))
# 학생 6~10번 시험 데이터 생성
group_b <- data.frame(id = c(6, 7, 8, 9, 10),
                      test = c(70, 83, 65, 95, 80))

group_all <- bind_rows(group_a, group_b); group_all <- rbind(group_a, group_b) #같이 행기준 합치기 



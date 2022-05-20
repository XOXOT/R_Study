
#R 기본 문법 
sum(1:4)
(sum(1:4))
print(sum(1:4))
x=sum(1:4) #x에 대입을 하면 원래 실행이 안됨 

rm(list = ls()) #모든 리스트 삭제 

#한 줄에 한번에 넣고 싶으면 ' ; ' 삽입 

typeof(x)

#논리형 - logical (TRUE(1), FALSE(0)) 

#정수형 - integer ex)1,2,3,4,

#실수형 - double ex)1.5, 3.4 ... 

#복소수형 - complex ex) 1+2i, 3+4i  

#문자형 - character  
(f = c(LETTERS[1:4]))
# LETTERS(1:4) 해버리면 letters라는 변수가 있어야함 [] 대괄호는 

#요인형 - factor   ㅇ (범주형) ex)남 or 여 , 10세이하 or 10~20세 or 
as.factor(f) #f라는 데이터 변수를 factor형으로 변경 이때 변경하는 함수는 as. 이다. as. 하고 변형시킬 유형을 입력하면 변경가능 
             #

#하나의 벡터에 서로 다른 유형의 데이터가 혼합되면 우선순위가 
# 논리형 < 정수, 요인 < 실수 < 복소수 < 문자형  
#논리 + 실수 = 실수 이런식으로... 



#벡터(vector) – 동일한 데이터 유형으로 구성된 데이터 집합
#행렬(matrix) – 동일한 종류로 구성된 2차원 데이터 집합
#배열(array) – 동일한 데이터 종류로 구성된 2차원 이상의 구조
#데이터 프레임(data frame) – 각 열마다 같은 길이의 벡터를 갖는 구조
#리스트(list) – 여러 유형의 변수를 자유롭게 결합한 구조

#R 변수 이름을 지정하는 방법
# 문자, 숫자
# 대소문자 구별
# 한글 문자
# 특수 문자는 ‘_’, ‘.’만 사용
# 숫자로 시작안됨
# 특수 문자로 시작 시 바로 숫자가 뒤따를 수 없음

#함수 이름을 정확히 기억하지 못할 경우 …
# apropos(“mean”) – mean과 연관된 모든 문자열 출력

#<<- 이것도 가능 , -> 가능 



age1 <- c(3, 2, 1, 2, 3, 2)
fac1 <- factor(age1, labels=c('one', 'two', 'three'))
fac1

ls()

x1 = c(9,4,3,7,6) #5개원소를 갖는 벡터 
x2 = matrix(1:12,3,4) #3행 4열 행렬 
x3 = array(1:24,c(3,4,2)) #3행 4행 2차원 
x4 = data.frame(a=1:5, b=letters[1:5], c=as.factor(1:5))
x = list(x1,x2,x3,x4)
x[[2]] #인덱스 2번 불러옴 

apropos("mean")

5%%10 # 5를 10로 나눈 나머지
10%%5
10%/%5 # 10을 5로 나눈 몫 

1:2
1:3

z = matrix(1,3,4)
w = matrix(1:6,2,3)
w%*%z

_a  = c(1,2,3)
.a = c(1,2,3)
y = c(1,2,3,NA)
3*y

var1 = c(1,2,5,7,8)
var1[-2] 
var1[-2] 

3*y

fruit <- c(1,2,3,4)
fruit[-1:3]
names(fruit)<-c(“apple”,“peach”,“orange”,“nana”)
seq(from=1,to=10,length=5)
3***3 

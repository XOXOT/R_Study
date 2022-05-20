
###2주차 1차시 학습확인 1418083 최희태###

#1.  set.seed(10)
#    x = sample(1:100,30) 
#    sort() 함수를 이용해서 x의 값들을 내림차순 및 오름차순으로 출력하시오.

set.seed(10) #10을 시드로 가지는 패턴의 난수를 얻기위한 설정 
x = sample(1:100,30) #샘플데이터를 만들어 x에 할당 30개의 난수 생성(1~100)
sort(x) #절대값 오름차순 
sort(x,decreasing = T) #절대값 내림차순

#2. 위의 x를 order()함수를 이용해서 내림차순으로 출력하시오.  

order(x) 
order(x,decreasing = T)
#order함수는 오름차순 형태로 인덱스 값을 배열해 주는 것 따라서 인덱싱 해주어야함 
x[order(x)]
x[order(x,decreasing = T)]

#3.  name = c(“Maria”, “kildong”, “tiger”)
#    ID    = c(1,3,5)
#    sex   = c(“F”, “M”, “M”)
#    list()함수를 사용하여 Info라는 변수에 저장하고 출력하시오.

name = c("Maria","kildong","tiger")
ID = c(1,3,5)
sex = c("F","M","M")

Info = list(name, ID, sex) #Info 변수에 name, ID, sex 저장 

Info 

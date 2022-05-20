rm(list = ls()) #모든 리스트 삭제 
#control + L 을 누르면 콘솔 삭제 

a = c(4,3,7,6,2)
order(a,decreasing = T)
2,3,4,6,7 #order함수는 이렇게 정렬 후에 
5,2,1,4,3 #들어간 숫자 정렬 후에 인덱싱(들어있는 순서)
#따라서 대괄호를 하면 원소의 값을 불러올 수 있으니 대괄호를 붙여야함 

idx = order(a,a,decreasing = T)
a[idx]

name = c("Maria","kildong","tiger")
ID = c(1,3,5)
sex = c("F","M","M")

Info = list(name = c("Maria","kildong","tiger"),
            ID = c(1,3,5),
            sex = c("F","M","M"))
Info
print(Info)

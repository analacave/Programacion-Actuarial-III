#Colocar el Rank Y determinar los mejores hospitales según lo quiera el usuario
rankhospital <- function(estado="TX",resultado="infarto",num="mejor"){
    outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character") 
    options(warn = -1)
    if(resultado == "infarto"){
        x <- split(outcome[c(2,7,11)],outcome[c(2,7,11)]$State)
    }else if(resultado=="falla"){  
        x <- split(outcome[c(2,7,17)],outcome[c(2,7,17)]$State)
    }else if(resultado=="neumonía"){
        x <- split(outcome[c(2,7,23)],outcome[c(2,7,23)]$State)
    }else{ 
        print(NA)
    }
    Hospital <- x[estado][[estado]][,1]; Rate <- as.numeric(x[estado][[estado]][,3])
    u <- na.omit(data.frame(Hospital,Rate))
    index <- with(u,order(Rate,Hospital))
    z <- u[index,]; t <- nrow(u)
    datos <- data.frame(z,rank=1:t)
    if(num=="mejor"){
        head(datos,1)
    }else if(num=="peor"){
        tail(head(datos,t),1)  
    }else if(0<num & num<=t){
        tail(head(datos,num),1)
    }else if(t<num){
        print("Error")
    }
}
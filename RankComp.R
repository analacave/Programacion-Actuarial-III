#rank de hospitales en base a todos los estados
rankingcompleto <- function(resultado="infarto",num="mejor"){
    outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character") 
    options(warn = -1)
    if(resultado == "infarto"){
        x <- split(outcome[c(2,7,11)],outcome[c(2,7,11)]$State)
    }else if(resultado=="falla"){  
        x <- split(outcome[c(2,7,17)],outcome[c(2,7,17)]$State)
    }else if(resultado=="neumonía"){
        x <- split(outcome[c(2,7,23)],outcome[c(2,7,23)]$State)
    }
    Hospital <- c()
    for(j in 1:54){
        H <- x[j][[1]][,1]; Rate <- as.numeric(x[j][[1]][,3])
        u <- na.omit(data.frame(H,Rate))
        index <- with(u,order(Rate,H))
        u <- u[index,][1]; t <- nrow(u)
        if(num=="mejor"){
            Hospital <- c(Hospital,as.character(u[1,1]))
        }else if(num=="peor"){
            Hospital <- c(Hospital,as.character(u[t,1]))
        }else if(0<num & num<=t ){
            Hospital <- c(Hospital,as.character(u[num,1]))
        }else if (t<num){
            Hospital <- c(Hospital,as.character(u[t+1,1]))
        } 
    }
    Estado <- sort(unique(outcome$State))
    data.frame(Hospital,Estado)
}

head(rankingcompleto("infarto",20),10)
tail(rankingcompleto("neumonía","peor"),3)
tail(rankingcompleto("falla","mejor"),10)
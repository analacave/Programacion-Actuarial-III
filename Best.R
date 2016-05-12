#Calcula el mejor hopita dependiendo de la tasa de mortalidad por enfermedad
best <- function(estado="TX",resultado="infarto"){
    outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character") 
    options(warn = -1)
    if(resultado == "infarto"){
        x <- split(outcome[c(2,7,11)],outcome[c(2,7,11)]$State)
    }else if(resultado=="falla"){  
        x <- split(outcome[c(2,7,17)],outcome[c(2,7,17)]$State)
    }else if(resultado=="neumonía"){
        x <- split(outcome[c(2,7,23)],outcome[c(2,7,23)]$State)
    }
    Hospital <- x[estado][[estado]][,1]; Mortalidad <- as.numeric(x[estado][[estado]][,3])
    u <- na.omit(data.frame(Hospital,Mortalidad))
    index <- with(u,order(Mortalidad,Hospital))
    z <- u[index,]
    head(z,1)
}  


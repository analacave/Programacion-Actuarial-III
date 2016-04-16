#Función sapply & lappyl

jirafa <- function(variables=100,escenarios=100,fun="rnorm"){
    if(fun=="rgamma"){
        y <- sapply(lapply(rep(variables,escenarios),fun,0.5),mean)
        hist(y)
    }else{
        x <- sapply(lapply(rep(variables,escenarios),fun),mean)
        hist(x) 
    }
}
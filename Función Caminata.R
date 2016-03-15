z <- 100
ana <- vector("numeric",0)
caminata<- function(x){
for(i in 1:x) { 
    length(ana) <- length(ana) + 1
    ana[i]<- z
    moneda <- rbinom(1,1,0.5)
    if(moneda==1){
        z<- z+1
        ana[i]<- z
    }else {
        z<- z - 1
        ana[i]<- z
    }
  }
   print(ana)
   plot(ana,type= "l",lwd=5)
   }
caminata(100)
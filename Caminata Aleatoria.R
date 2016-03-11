z <- 5
k <- 1
anni <- vector("numeric",0)
while(z>=3 && z<=10){
      moneda <- rbinom(1,1,0.5)
      length(anni) <- length(anni)
      if(moneda==1){
            z <- z+1
            anni[k] <- z
          } else {
                z <- z-1  
                anni[k] <- z
              }
      k <- k+1
    }
anni

    
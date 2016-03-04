#Prueba de Funcionamiento
n<- 100000
mensajes<- vector("character",n)
for(i in 1:n){
    p<-runif(1)
    if(p<=0.30){
        mensajes[i]<-"Mensaje 30%"
    } else if (p<=0.50){
        mensajes[i]<-"Mensaje 20% a"
    } else if (p<=0.70){
        mensajes[i]<-"Mensaje 20% b"
    } else if (p<=0.90){
        mensajes[i]<-"Mensaje 20% c"
    } else {
        mensajes[i]<-"Mensaje 10%"
    }
}
mensajes
plot(table(mensajes))
#Prueba de Asignación de Variables
x <- 1
#Impresion Forzada
print(x)
#Impresión Indirecta
x
msg <- "Hola a todos"
msg

x <- 1#un comentario

#Se inicio una secuencia de datos & se imprimio  
x <- 1:100
x
#Con corchete, al inicio de cada fila se vera
#la posición que corresponde al primer elemento
#de cada rengón

#Es más útil saber esto para situaciones como ésta:
x <- rep(c("a","b","c"),30)
x

##Clases atómicas en R
?class
class:1
class(1) #interger
class(1L) #numeric
class(1*1L) #numeric
class(3+12i) #complex
class((3+12i)*(3-12i)) #complex
class(TRUE) #boolean
class(TRUE*1) #numeric
class(c(1,FALSE,3L,2+4i,a)) #la clase que siempre gana es caractér
#La clase más dominante es el caractér

#Para crear vectores vacios de tipo y
#tamaño que me interesa
a <- vector(mode= "numeric",length = 10)
a <- vector(mode= "numeric", length = "10")
#La función c() también me permite
#crear vectores, pero lo hace a partir
#de los elementos del vector
a <- c(1,5,3L,2+4i,T,FALSE)
a
b <- c(a,"cadena")
b
d <- c(1,5,3L,2+4i,T,FALSE,"cadena")
d

#coección implícita
x <- 0:6
class(x)
as.numeric(x)
as.logical(x)
as.complex(x)
as.character(x)

#Listas de objetos
x <- list(F, 3L, 94.5, 2+3i, "a")
x
#Cada vector de la lista puede ser de diferente clase.

#Matrices
x <- matrix(nrow=2,ncol = 3)
x
dim(x)
attributes(x)

x <- matrix(1:6, 2,3, TRUE)
x

x <- matrix(1:10, 2,5)
x

x <- 1:10
x
dim(x) <- c(2,5)

x

#cbind y rbind
x <- 1:5
y <- 11:15
z <- 21:25

cbind(x,y,z)
rbind(x,y,z)

x <- 11:15
y <- 21:25
a <- 31:35
z <- 41:45
r <- 51:55

rbind(x,y,a,z,r)

cbind(x,y)

x <- (1,matrix(1:5))

#Factores
x <- factor(c("si","si","no"))
x
h <- factor(c("azul","amarillo","rojo","naranja","verde","blanco"))
h
table(x)
table(y)
plot(x)
#Separamos las listas por clases
unclass(x)
unclass(h)
#Para separar con un oren definido por nosotros mismos
x <- factor(c("si","si","no"), levels = c("si","no"))
x

h <- factor(c("azul","amarillo","rojo","naranja","verde","blanco"), levels = c("azul","verde","naranja","amarillo","blanco","rojo") )
h
#Para mantener los datos que nos interesan
h <- factor(c("azul","amarillo","rojo","naranja","verde","blanco"), levels = c("azul","verde","naranja","amarillo") )
h

#Valores faltantes
x <- c(1,2,NA,10,3)
is.na(x)
is.nan(x)

y <- c(1,2,NAN,NA,3)
is.na(y)
is.nan(y)

#Data Frames
x <- data.frame(foo= 1:4, bar=c(T,F,F,T))
x
row.names(x)
#Para modificar el nombre de las filas
row.names(x) <- c("hugo","paco", "luis","rosita")
x
nrow(x);ncol(x)
#Para modificar el nombre de las columnas
j <- 1:3
names(j) <- c("foo","bar","norf")
j
#Nombres en listas
m <- list(a=1,b=2,c=3)
m

#Nombres en matrices
n <- matrix(1:4,2,2)
n
dimnames(n) <- list(c("a","b"),c("c","d"))
n

data <- read.csv(file = "table.csv")
head(data)
#Probaremos la función dget & dput
y <- data.frame(a=1,b="a")
y
dput(y)
dput(y, file= "y.R")
#Con la siguiente instruccion eliminamos de la memoria a "y"
rm(y)
#Si referente en la memoria recuperamos el objeto & apartir del archivo que guardamos
nueva.y <- dget(file="y.R")
nueva.y

#Varios objetos al mismo tiempo dump
x <- "Programacion Actuarial III"
y <- data.frame(a=1, b="a")
#dump me permite realizar lo mismo que dget pero con objetos múltiples
dump(c("x","y"),file="data.R")
rm(x,y)
source("data.R")

##conexiones
con <- url("http://www.fcfm.buap.mx/","r")
readLines(con,10)

#Creamos un vector 
x <- c("a","b","c","c","d","e")
x

#Extraemos un elemento con [
x[1]
x[2]
x[x >="c"]
x[1:4]
u <- x == "c"
u
x[u]
x[!u]

#extraccion de una lista con []
x <- list(foo=1:4, bar=0.6)
x
x[1];class(x[1])
x[[1]];class(x[[1]])
x$foo
class(foo)
class(x$foo)
x["bar"]
class(x$bar)

x <- list(foo=1:4,bar=0.6,baz="Hola")
nombre <- "bar"
x[nombre]
x[[nombre]]
x$nombre

x <- list(a=list(10,12,14),b=list(3,14,2,81))
x[[c(1,3)]]
x[c(1,3)]
x[[1]][[3]]
x[[c(2,1)]]

#Estructuras de Control
x <- 11
if(x<3){
    y <- 10
} else {
    y <-5
}
y

x <-2
y <- if(x<3){
    y <- 10
} else{
    y<- 5
}
y
n <- 9
runif(n,0,8)
runif(5,0,1)

x<- runif(1,1,100)
if(1<x & x<30){
    y<-"Hola"
} else if (31<x & x<50){
    y<-"¿Qué onda?"
} else if (51<x & x<60){
    y<-"¿Quépedo wey?"
} else if (61<x & x<80){
    y<-"¿Qué pex?"
} else if (81<x & x<100){
    y<-"Quiubo"
}
y
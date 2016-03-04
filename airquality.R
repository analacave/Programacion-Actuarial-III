#Airquality

y  <-  airquality
dput ( y , " airquality.R " )

#Depurar base de datos airquality
jirafa<-( airquality )
guacamaya  <-  airquality [complete.cases ( airquality ),]
guacamaya

nrow(guacamaya)
dim(guacamaya)
sum(complete.cases ( airquality ))

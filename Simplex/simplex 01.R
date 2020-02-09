#ITEC RIO CUARTO - DESARROLLO DE SOFTWARE

#MATERIA = MATEMATICA APLICADA
#PROFESOR = JORGE ANTONIO SOSA
#ALUMNO = SERGIO POSSE
#AÑO = 2019

#GUIA METODO SIMPLEX EN R
#EJERCICIO 01

#	Max      40*X1 + 60*X2
#
#	s.a.     2*X1 + 1*X2 <= 70
#              1*X1 + 1*X2 <= 40
#              1*X1 + 3*X2 <= 90
#
#              X1 >= 0, X2 >= 0

##PREVIO: Indicamos que usaremos la libreria boot que contiene el metodo simplex

library(boot)

#####PASO 1 - Asignar los coef. de la funcion objt. a un vector

a<-c(40,60)

#####PASO 2 - Ahora los coef izquierdos de restricciones tipo "menor o igual"
#####van en una matriz m*n
##rbind es para concatenar vectores, matrices o datos en una sola fila

A1<-rbind(c(2,1),c(1,1),c(1,3))

#####PASO 3 - Asignar a un vector los coef derechos de A1

b1<-c(70,40,90)

#####PASO 4 - NO HAY RESTRICCIONES TIPO MAYOR O IGUAL A2 y b2 no existen
#####NOTA: La condicion de no negatividad es para evaluar el resultado pero
#####no se indica en el metodo simplex del lenguaje R

#####PASO 5 - NO HAY RESTRICCION DEL TIPO "IGUAL A", A3 y b3 no existen
#####en el argumento

#####PASO 6 pasar las variables como argumento al metodo simplex
#####con maxi="TRUE" especificamos si es maximizar o minimzar (false)
simplex(a,A1,b1,maxi="TRUE")

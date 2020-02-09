#ITEC RIO CUARTO - DESARROLLO DE SOFTWARE

#MATERIA = MATEMATICA APLICADA
#PROFESOR = JORGE ANTONIO SOSA
#ALUMNO = SERGIO POSSE
#AÑO = 2019

#GUIA METODO SIMPLEX EN R
#EJERCICIO 02


#	Maximizar Z = f(x,y) = 3x + 2y
#	sujeto a:	2x + y = 18 
#			2x + 3y = 42 
#			3x + y = 24 
#			x = 0, y = 0


##PREVIO: Indicamos que usaremos la libreria boot que contiene el metodo simplex

library(boot)

#####PASO 1 - Asignar los coef. de la funcion objt. a un vector

a<-c(3,2)

#####PASO 2 - Ahora los coef izquierdos de restricciones tipo "menor o igual"
#####van en una matriz m*n
##rbind es para concatenar vectores, matrices o datos en una sola fila

A1<-rbind(c(2,1),c(2,3),c(3,1))

#####PASO 3 - Asignar a un vector los coef derechos de A1

b1<-c(18,42,24)

#####PASO 4 - NO HAY RESTRICCIONES TIPO MAYOR O IGUAL A2 y b2 no existen
#####NOTA: La condicion de no negatividad es para evaluar el resultado pero
#####no se indica en el metodo simplex del lenguaje R

#####PASO 5 - NO HAY RESTRICCION DEL TIPO "IGUAL A", A3 y b3 no existen
#####en el argumento

#####PASO 6 pasar las variables como argumento al metodo simplex
#####con maxi="TRUE" especificamos si es maximizar o minimzar (false)
simplex(a,A1,b1,maxi="TRUE")
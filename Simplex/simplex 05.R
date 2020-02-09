#ITEC RIO CUARTO - DESARROLLO DE SOFTWARE

#MATERIA = MATEMATICA APLICADA
#PROFESOR = JORGE ANTONIO SOSA
#ALUMNO = SERGIO POSSE
#AÑO = 2019

#GUIA METODO SIMPLEX EN R
#EJERCICIO 05


#Costo de construcción: una compañía química está diseñando una planta
#para producir dos tipos de polímeros, P1 y P2. La planta debe tener una
#capacidad de producción de al menos 100 unidades de P1 y 420 unidades
#de P2 cada día. Existen dos posibles diseños para las cámaras principales
#de reacción que se incluirán en la planta. Cada cámara de tipo A cuesta
#pesos 600.000 y es capaz de producir 10 unidades de P1 y 20 unidades de
#P2 por día; el tipo B es un diseño más económico, cuenta $ 300.000 y es
#capaz de producir 4 unidades de P1 y 30 unidades de P2 por día. A causa
#de costo de operación, es necesario tener al menos 4 cámaras de cada tipo
#de la planta. 

#a.¿Cuántas cámaras de cada tipo deben incluirse para minimizar el costo de construcción y satisfacer el programa de producción requerido?

#P1=productos tipo P1 que se fabrican en la camara
#P2=productos tipo P2 que se fabrican en la camara

#				P1		P2	Costo instalacion de la camara
#camara A			10		20	600000
#camara B			4		30	300000

#x1 = cant camaras A a instalar
#x2 = cant camaras B a instalar

#FUNCION OBJETIVO (MINIMIZAR COSTO)
#####costo de camaras = 600000(x1) + 300000(x2)

#RESTRICCIONES ENCONTRADAS
##produccion P1: 10x1 + 4x2 >=100
##produccion P2: 20x1 + 30x2 >=420
##camaras a y b deben ser igual o mas que 4
#x1>=4 
#x2>=4

#lo de arriba es lo que se debe producir de cada producto entre ambas camaras

##indicamos que usaremos la libreria boot que contiene el metodo simplex
library(boot)


##PASO 1 - en un vector coloco los coeficientes de la funcion a optimizar

a<-c(6,3)

##PASO 2 - A2 es una matriz m*n con coeficientes del lado izquierdo de las
##restricciones del tipo "mayor o igual a"
#en este caso A2 y b2 existen PERO A1,b1,A3,b3 no existen y debo llenarlas
#con 0 al momento mismo de pasar los parametros a la func simplex

##rbind es para concatenar vectores, matrices o datos en una sola fila

A2<- rbind(c(10,4),c(20,30),c(1,0),c(0,1))

##PASO 3 - b2 corresponde a un vector con coeficientes de la parte derecha
##de las restricciones que se corresponde con la parte izquierda
##que asentamos en A2

b2<- c(100,420,4,4)


##PASO 4 - Pasar argumentos al metodo simplex y guardo el objeto que devuelve
#en una variable(solucion)

simplex(a=a,A1=c(0,0),b1=c(0),A2=A2,b2=b2,maxi="FALSE")
#ITEC RIO CUARTO - DESARROLLO DE SOFTWARE

#MATERIA = MATEMATICA APLICADA
#PROFESOR = JORGE ANTONIO SOSA
#ALUMNO = SERGIO POSSE
#AÑO = 2019

#GUIA METODO SIMPLEX EN R
#EJERCICIO 04


#Extracción de minerales: una compañía extrae minerales de una mina.
#El número de libras de los minerales A y B que pueden extraerse de cada
#tonelada de la mina I y II se muestran en la tabla siguiente,
#junto con los costos por tonelada de las minas

#				Mina I	Mina II
#Mineral A			100 lb	200 lb
#Mineral B			200 lb	50 lb

#Costo por Tonelada	$50		$60

#Si la compañía debe producir al menos 3000 libras de A y 2500 libras de B 
#a.	¿cuántas toneladas de cada mina deben procesarse con el objetivo de minimizar el costo? 
#b.	¿Cuál es el Costo mínimo?

#x1 = mina 1
#x2 = mina 2

#RESTRICCIONES ENCONTRADAS
##mineral A: 100x1 + 200x2 >=3000
##mineral B: 200x1 + 50x2 >=2500

#FUNCION OBJETIVO (MINIMIZAR COSTO)
#####costo = 50(x1)+60(x2)


#Ultima restriccion de condicion de no negatividad
#en R no es necesaria pero conceptualmente sirve para evaluar el resultado
#ya que es ilogico extraer -5 libras de un mineral(por ejemplo)

##indicamos que usaremos la libreria boot que contiene el metodo simplex
library(boot)


##PASO 1 - en un vector coloco los coeficientes de la funcion a optimizar

a<-c(50,60)

##PASO 2 - armar las matrices y vectores de las restricciones
##del tipo "menor igual" (A2 y b2); "mayor igual" (A2 y b2); "igual" (A3 y b3)

##si hubiera inecuaciones del tipo "menor igual" (A1 y b1) entonces se hace un conjunto
##de A1 y b1 con los coeficientes, pero como no existen debo llenarlas
#con 0 en vez de NULL (basta con llenarlas con 1 solo elemento)como ya
##experimentamos anteriormente en el ejercicio 03 de la guia.
#idem si hubiera restricciones del tipo "igual" (A3 y b3)

##A2 es una matriz m*n con coeficientes del lado izquierdo de las
##restricciones del tipo "mayor o igual a"

##rbind es para concatenar vectores, matrices o datos en una sola fila

A2<-rbind(c(100,200),c(200,50))

##PASO 3 - b1 corresponde a un vector con coeficientes de la parte derecha
##de las restricciones que se corresponde con la parte izquierda
##que asentamos en A1

b2<-c(3000,2500)



##NOTA: las restricciones del tipo condicion de no negatividad no es
##necesario incluirlas

##PASO 4 - Pasar argumentos al metodo simplex y guardo el objeto que devuelve
#en una variable(solucion)

solucion<- simplex(a=a,A1=c(0,0),b1=c(0),A2=A2,b2=b2, maxi="FALSE")

cat("Cantidad a extraer de la mina 1: ",solucion$soln[1],sep="\n")
cat("Cantidad a extraer de la mina 2: ",solucion$soln[2],sep="\n")
cat("Costo optimo total: ",solucion$value,sep="\n")

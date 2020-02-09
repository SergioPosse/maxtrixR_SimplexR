#ITEC RIO CUARTO - DESARROLLO DE SOFTWARE

#MATERIA = MATEMATICA APLICADA
#PROFESOR = JORGE ANTONIO SOSA
#ALUMNO = SERGIO POSSE
#AÑO = 2019

#GUIA METODO SIMPLEX EN R
#EJERCICIO 06


#Flete por envío: una compañía de fletes maneja los envíos de dos
#corporaciones, A y B, que están ubicadas en la misma ciudad.
#La corporación A envía cajas que pesan 3 libras cada una y tienen un
#volumen de dos pies cúbicos; B envía cajas de 1 pie cúbico que pesan
#5 libras cada una. Ambas corporaciones envían al mismo destino.
#El costo de transporte para cada caja de A es $ 0,75 y para B es $0,5.
#La compañía de fletes tiene un camión con capacidad de carga de 2400 pies
#cúbicos y una capacidad máxima de 36800 libras. En un acarreo,
#¿cuantas cajas desde cada corporación debe transportar este camión de
#modo que el ingreso de la compañía de fletes sea máximo?
#¿Cuál el ingreso máximo?


#cant. cajas de corporacion A = x1 
#cant. cajas de corporacion B = x2

#			 Caja Corp.A     Caja Corp.B
#===============================================
#Libras(lb)		 3		     5		
#PiesCubicos(p3)	 2		     1
#===============================================
#costo              0,75		     0,50

#RESTRICCIONES (lo que puede llevar el camion)

#3x1 + 5x2  <= 36800 P3

#2x1 + x2 <= 2400 lb

#ademas x1>=0;x2>=0

#FUNCION OBJETIVO (ingreso total de la compañia de fletes por transportar
#cajas de las dos compañias A y B)

# Z = 0.75x1 + 0.50x2


##indicamos que usaremos la libreria boot que contiene el metodo simplex

library(boot)


##PASO 1 - en un vector coloco los coeficientes de la funcion a optimizar

a<-c(0.75,0.50)

##PASO 2 - armar las matrices y vectores de las restricciones
##del tipo "menor igual" (A2 y b2); "mayor igual" (A2 y b2); "igual" (A3 y b3)

#MENOR IGUAL

A1<-rbind(c(3,5),c(2,1))

b1<-c(36800,2400)

#RESTRICCIONES MAYOR IGUAL NO HAY
#RESTRICCIONES IGUAL A NO HAY


##NOTA: las restricciones del tipo condicion de no negatividad no es
##necesario incluirlas

##PASO 3 - Pasar argumentos al metodo simplex y guardo el objeto que devuelve
#en una variable(solucion)
#como necesitamos que el ingreso total sea maximo, maxi = "TRUE" para maximizar
#la funcion objetivo

solucion<- simplex(a=a,A1=A1,b1=b1, maxi="TRUE")

cat("Cantidad cajas A a transportar: ",solucion$soln[1],sep="\n")
cat("Cantidad cajas B a transportar: ",solucion$soln[2],sep="\n")
cat("Ingreso maximo total: ",solucion$value, sep="\n")
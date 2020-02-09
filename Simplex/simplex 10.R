#ITEC RIO CUARTO - DESARROLLO DE SOFTWARE

#MATERIA = MATEMATICA APLICADA
#PROFESOR = JORGE ANTONIO SOSA
#ALUMNO = SERGIO POSSE
#AÑO = 2019

#GUIA METODO SIMPLEX EN R
#EJERCICIO 10


#Bebidas: La tienda de comestibles B&K vende dos tipos de bebidas 
#no alcohólicas: la marca de sabor decola A1 y la marca propia de la tienda,
#B&K de colas, más económica. El margen de utilidad en la bebida de cola A1
#es de alrededor de 5 centavos de dólar por lata, mientras que la de la bebida
#decola B&K suma una ganancia bruta de 7 centavos por lata. En promedio,
#la tienda no vende más de 500 latas de ambas bebidas de cola al día.
#Aun cuando A1 es una marca más conocida, los clientes tienden a comprar más
#latas de marca B&K, porque considerablemente es más económica.
#Se calcula que la venta de la marca B&K superan a las de la marca A1
#en una razón de 2 a 1 por lo menos. Sin embargo, B&K vende, como mínimo,
#100 latas de A1 al día.

#a) ¿Cuántas latas de cada marca debe tener en existencia la
#tienda diariamente para maximizar su utilidad?

#b) Determine la razón de las utilidades por lata de A1 y B&K
#que mantendrá inalterada la solución en (a).



#decola A1 = x1 
#B&K de cola = x2

#======================================|
#				Utilidad(dolar)|
#A1				5.00		   |
#						   |
#B&K				7.00		   |
#======================================|


#FUNCION OBJETIVO (ganancia total por la venta de los dos productos)

#		Z = 5.00(x1) + 7.00(x2)

#RESTRICCIONES ENCONTRADAS

#MENOR IGUAL

# x1 + x2 <= 500    	#entre las 2 gaseosas no venden mas de 500 al dia

#MAYOR IGUAL

# x1 >= 100			#vende como mínimo, 100 latas de A1 al día
# 2x2 >= x1 		#B&K superan a A1 en una razón de 2 a 1 por lo menos



#CONDICION DE NO NEGATIVIDAD

#	x1 >=0 ; x2 >=0


#/////////////////////////////////////////////////////////////////////////



##indicamos que usaremos la libreria boot que contiene el metodo simplex

library(boot)


##PASO 1 - en un vector coloco los coeficientes de la funcion a optimizar

a<-c(5.00,7.00)

##PASO 2 - armar las matrices y vectores de las restricciones
##del tipo "menor igual" (A2 y b2); "mayor igual" (A2 y b2); "igual" (A3 y b3)

#MENOR IGUAL

A1<-c(1,1)

b1<-c(500)

#MAYOR IGUAL

A2<-rbind(c(1,0),c(0,2))
b2<-c(100,1)


##NOTA: las restricciones del tipo condicion de no negatividad no es
##necesario incluirlas

##PASO 3 - Pasar argumentos al metodo simplex y guardo el objeto que devuelve
#en una variable(solucion)

solucion<- simplex(a=a,A1=A1,b1=b1,A2=A2,b2=b2, maxi="TRUE")

cat("Cantidad de latas A1: ",solucion$soln[1],sep="\n")
cat("Cantidad delatas B&K: ",solucion$soln[2],sep="\n")
cat("Utilidad optima: ",solucion$value,sep="\n")


#/////////////////////////////////////////////////////////////////////////
								



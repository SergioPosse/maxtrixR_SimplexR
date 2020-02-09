#ITEC RIO CUARTO - DESARROLLO DE SOFTWARE

#MATERIA = MATEMATICA APLICADA
#PROFESOR = JORGE ANTONIO SOSA
#ALUMNO = SERGIO POSSE
#AÑO = 2019

#GUIA METODO SIMPLEX EN R
#EJERCICIO 9


#Producción: Dos productos se fabrican en un centro de maquinado.
#Los tiempos de producción por unidad de los productos 1 y 2 son de 10 y 12
#minutos, respectivamente. El tiempo regular total de la máquina de 2.500
#minutos por día. En un día cualquiera, el fabricante vende entre 150 y 200
#unidades del producto 1, pero no más de 45 unidades del producto 2.
#Se pueden emplear horas extras para satisfacer la demanda a un costo adicional de 0.50 de dólar por minuto.
#a)	Suponiendo que las utilidades por unidad de los productos 1 y
#2 son.6.0 y 7.50 dólares, respectivamente, formule un modelo y determine
#el nivel óptimo de fabricación para cada producto, así como cualquier número de horas extra necesarias en el centro.
#b)	Si el costo por minuto de horas extra se incrementa a 1.50 dólares,
#¿la compañía debe utilizar horas extras?


#Producto 1 = x1 
#Producto 2 = x2

#==============================================================|
#			Tiempo Produccion(Minutos)	Utilidad(dolar)|
#Producto 1		10					6.00		   |
#										   |
#Producto 2		12					7.50		   |
#==============================================================|
#


#FUNCION OBJETIVO (ganancia total por la venta de los dos productos)

#		Z = 6.00(x1) + 7.50(x2)

#RESTRICCIONES ENCONTRADAS

#MENOR IGUAL

# 10x1 + 12x2 <=2500    #solo hay 2500 horas de maquina disponible
# x1 <= 200			#vende entre 150 y 200 del producto 1
# x2 <= 45			#no vende mas de 45 unid. del producto 2

#MAYOR IGUAL

#x1 >=150 			#vende entre 150 y 200 del producto 1

#CONDICION DE NO NEGATIVIDAD

#	x1 >=0 ; x2 >=0


#/////////////////////////////////////////////////////////////////////////



##indicamos que usaremos la libreria boot que contiene el metodo simplex

library(boot)


##PASO 1 - en un vector coloco los coeficientes de la funcion a optimizar

a<-c(6.00,7.50)

##PASO 2 - armar las matrices y vectores de las restricciones
##del tipo "menor igual" (A2 y b2); "mayor igual" (A2 y b2); "igual" (A3 y b3)

#MENOR IGUAL

A1<-rbind(c(10,12),c(1,0),c(0,1))

b1<-c(2500,200,45)

#MAYOR IGUAL

A2<-rbind(c(1,0))
b2<-c(150)


##NOTA: las restricciones del tipo condicion de no negatividad no es
##necesario incluirlas

##PASO 3 - Pasar argumentos al metodo simplex y guardo el objeto que devuelve
#en una variable(solucion)

solucion<- simplex(a=a,A1=A1,b1=b1,A2=A2,b2=b2, maxi="TRUE")

cat("Cantidad a fabricar producto 1: ",solucion$soln[1],sep="\n")
cat("Cantidad a fabricar producto 2: ",solucion$soln[2],sep="\n")
cat("Importe total optimo: ",solucion$value,sep="\n")


#/////////////////////////////////////////////////////////////////////////


##CALCULO HORAS EXTRA

#Se pueden emplear horas extras para satisfacer la demanda
#a un costo adicional de 0.50 de dólar por minuto.

#SI LA HORA EXTRA CUESTA 0.50 dolares por minuto
#podemos fijarnos la relacion entre ganancia por fabricar un producto
#y el producto entre el costo de hora extra y los minutos de fabricacion

#si nos da un valor positivo significa que hay ganancia, por lo que se podrian
#fabricar tantos productos como se quisieran pagando hora extra a 0.50

#==============================================================
#			T.Prod.(Min)	Utilidad($)	 Costo prod.
#     							 c/hora extra	 
#								  
#									
#
#Producto 1		10			$6.00		  0.50*10=$5 
#										   
#Producto 2		12			$7.50		  0.50*12=$6 
#==============================================================|


#Para el producto 1 tenemos una ganancia de $6.00 y para fabricar con
#horas extra nos cuesta $5.00, entonces seguiremos teniendo una ganancia de

# $6.00 - $5.00 = $1.00

#Para el producto 2 tenemos una ganancia de $7.50 y para fabricar con
#horas extra nos cuesta $6.00 entonces seguiremos teniendo una ganancia de

# $7.50 - $6.00 = $1.50

#Con hora extra a $0.50 tenemos ganancia infima pero es factible seguir produciendo

#/////////////////////////////////////////////////////////////////////////

#SI LA HORA EXTRA CUESTA 1.50 dolares por minuto
#==============================================================
#			T.Prod.(Min)	Utilidad($)	 Costo prod.
#     							 c/hora extra	 
#								  
#									
#
#Producto 1		10			$6.00		  1.50*10=$15 
#										   
#Producto 2		12			$7.50		  1.50*12=$18 
#==============================================================|


#Para el producto 1 tenemos una ganancia de $6.00 y para fabricar con
#horas extra nos cuesta $5.00, entonces seguiremos teniendo una ganancia de

# $6.00 - $15.00 = $-9.00

#Para el producto 2 tenemos una ganancia de $7.50 y para fabricar con
#horas extra nos cuesta $6.00 entonces seguiremos teniendo una ganancia de

# $7.50 - $18.00 = $-10.50

#Con hora extra a $1.50 tenemos PERDIDA, NO ES FACTIBLE SEGUIR PRODUCIENDO



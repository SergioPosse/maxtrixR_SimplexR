#ITEC RIO CUARTO - DESARROLO DE SOFTWARE

#MATERIA = MATEMATICA APLICADA
#PROFESOR = JORGE ANTONIO SOSA
#ALUMNO = SERGIO POSSE
#AÑO = 2019

#GUIA MATRICES
#EJERCICIO 07



#Un comerciante trabaja con dos marcas de conservas A y B.
#De la marca A vende diariamente 48 latas de sardinas, 
#62 latas de bonito y 30 latas de berberechos.
#A su vez, de la marca B, vende por día 30 latas de sardinas,
#84 latas de bonito y 26 latas de berberechos.

#CONSIGNA A
#Calcular la matriz que nos del número de latas que se venden por día.

#			 SARDINAS	BONITO	BERBERECHOS
#                 ====================================
#	MARCA A	|48		62		30	     |
#	MARCA B	|30		84		26	     |
#			====================================

filas = c("MARCA A", "MARCA B")
columnas = c("SARDINA", "BONITO", "BERBERECHO")

#paso como lista los dos vectores que hice con los nombres de filas columnas
#en el argumento "dimmnames"

#por defecto byrow="TRUE"

ventasDiarias<- matrix(c(48,30,62,84,30,26),nrow=2,ncol=3,dimnames=(list(filas,columnas)))

cat("Las ventas diarias son:")
ventasDiarias


#CONSIGNA B
#Si el supermercado cierra los sábados por la tarde y la venta de
#latas por la mañana es la mitad de la venta diaria, hallar la matriz
#que nos relaciona la venta de latas en una semana. 

#debo multiplicar la matriz por 7 si fueran los dias completos.
#en este caso es 6.5 (ya que sabados es medio dia nomas)

ventasSemanales<-ventasDiarias*6.5

cat("Las ventas semanales son:")
ventasSemanales


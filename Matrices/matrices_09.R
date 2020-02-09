#ITEC RIO CUARTO - DESARROLO DE SOFTWARE

#MATERIA = MATEMATICA APLICADA
#PROFESOR = JORGE ANTONIO SOSA
#ALUMNO = SERGIO POSSE
#AÑO = 2019

#GUIA MATRICES
#EJERCICIO 09



#Tres familias, A, B, y C, van a ir de vacaciones a una ciudad en la que hay
#tres hoteles, H1, H2 Y H3.
#La familia A necesita 2 habitaciones dobles y una sencilla,
#la familia B necesita 3 habitaciones dobles y una sencilla
#la familia C necesita una habitación doble y 2 sencillas.
#En el hotel H1, el precio de la habitación doble es de 84 dólares por día,
#y el de la habitación sencilla es de 45.
#En H2, la habitación doble cuesta 86 dólares por día
#y la sencilla cuesta 43 dólares por día.
#En H3, la doble cuesta 85 y la sencilla 44.  

#CONSIGNA A
#Escribe en forma de matriz el número de habitaciones (dobles o sencillas)
#que necesita cada una de las tres familias. 

#			 SENCILLA	DOBLE
#                 =====================
#	FAMILIA A	|1		2	  |
#	FAMILIA B	|1		3	  |
#	FAMILIA C	|2		1       |
#			=====================

filas = c("FAMILIA A", "FAMILIA B","FAMILIA C")
columnas = c("SENCILLA", "DOBLE")

#paso como lista los dos vectores que hice con los nombres de filas columnas
#en el argumento "dimmnames"

#por defecto byrow="TRUE"

familiasHabitaciones<- matrix(c(1,1,2,2,3,1),nrow=3,ncol=2,dimnames=(list(filas,columnas)))

cat("Familias/Habitaciones:")
familiasHabitaciones

#CONSIGNA B
#Expresa matricialmente el precio de cada tipo de habitación en cada uno de los tres
#hoteles

#			 SENCILLA	DOBLE
#                 =====================
#	H1		|45		84	  |
#	H2		|43		86	  |
#	H3		|44		85      |
#			=====================

filas = c("H1", "H2","H3")
columnas = c("SENCILLA", "DOBLE")

hotelesPrecios<- matrix(c(45,43,44,84,86,85),nrow=3,ncol=2,dimnames=(list(filas,columnas)))

cat("Precios habitaciones sencillas y dobles en los 3 hoteles:")
hotelesPrecios

#CONSIGNA C
#Obtener, a partir de las dos matrices anteriores, una matriz en la que se refleje
#el gasto diario que tendría cada una de las tres familias en cada uno de los tres
#hoteles.

gastoFamiliasHoteles<-familiasHabitaciones*hotelesPrecios

cat("Gasto diario de cada familia en cada hotel:")
gastoFamiliasHoteles 


#CONSIGNA D
#y si quisieras permanecer 10 dias?

#multiplico la matriz gastoFamiliaHoteles * 10

gastoFamiliasDiezDias<-gastoFamiliasHoteles*10

cat("Gasto por 10 dias de cada familia en cada hotel:")
gastoFamiliasDiezDias



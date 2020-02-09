#ITEC RIO CUARTO - DESARROLO DE SOFTWARE

#MATERIA = MATEMATICA APLICADA
#PROFESOR = JORGE ANTONIO SOSA
#ALUMNO = SERGIO POSSE
#AÑO = 2019

#GUIA MATRICES
#EJERCICIO 08



#Un hipermercado quiere ofertar tres clases de bandejas: A, B y C. 
#La bandeja A contiene 40 g de queso fontina, 160 g de roquefort y 80 g
#de camembert;
#la bandeja B contiene 120 g de cada uno de los tres tipos de queso anteriores;
#la bandeja C, contiene 150 g de queso fontina, 80 g de roquefort y 80 g de camembert.  

#CONSIGNA A
#Si se quiere sacar a la venta 50 bandejas del tipo A,
#80 de B y 100 de C, obtener matricialmente la cantidad que necesitarán,
#en kilogramos de cada una de las tres clases de quesos. 

#			 FONTINA	ROQUEFORT	CAMEMBERT
#                 ====================================
#	BANDEJA A	|40		160		80	     |
#	BANDEJA B	|120		120		120	     |
#	BANDEJA C	|150		80		80	     |
#			====================================

filas = c("BANDEJA A", "BANDEJA B","BANDEJA C")
columnas = c("FONTINA", "ROQUEFORT", "CAMEMBERT")

#paso como lista los dos vectores que hice con los nombres de filas columnas
#en el argumento "dimmnames"

#por defecto byrow="TRUE"

bandejasGramos<- matrix(c(40,120,150,160,120,80,80,120,80),nrow=3,ncol=3,dimnames=(list(filas,columnas)))

cat("Las bandejas contienen:")
bandejasGramos

#ahora debo crear un vector con la cantidad de cada bandeja para multiplicar

cantNueva<-c(50,80,100)

bandejasGramosNueva<-bandejasGramos*cantNueva

cat("Cantidad de gramos total requerida para cumplir con la demanda")
bandejasGramosNueva

#CONSIGNA B
#Sabiendo que el Kg de fontina vale $50, el Kg. de roquefort $60
#y el camembert 70, obtener matricialmente el importe que se pagará
#para por cada tipo de queso para envasar la totalidad de las bandejas.

#			 FONTINA	ROQUEFORT	CAMEMBERT
#                 ====================================
#	BANDEJA A  | 2000		8000		4000	      |
#	BANDEJA B  | 9600		9600		9600	      |
#	BANDEJA C  |15000		8000		8000	      |
#			====================================
#			$50		$60		$70

#Si multiplico de forma normal como la consigna A me multiplica por fila
#en este caso debo multiplicar 50*2000, 50*9600, 50*15000
#para obtener el costo total de los gramos de fontina para cada bandeja
#es decir debo multiplicar por columnas
#por lo que necesito trasponer la matriz original(bandejasGramosNueva)

precios<-c(50,60,70)

costoBandejasNuevas<-t(bandejasGramosNueva)*precios

costoBandejasNuevas<-t(costoBandejasNuevas)

cat("Costo en $ para cada queso en cada bandeja")
costoBandejasNuevas

#ahora necesito sumar los importes correspondientes al mismo tipo de queso
#para eso sumo los valores de cada columna

costoBandejasNuevasTotal<-colSums(costoBandejasNuevas)

cat("50 bandejas A, 80 bandejas B, 100 bandejas C, Cuestan:")
costoBandejasNuevasTotal


#CONSIGNA C
#Cuanto cuesta cada clase de bandeja, obtener matricialmente

#primero multiplico la traspuesta de bandejasGramos * precios

costoBandejasQuesos<-t(bandejasGramos)*precios

costoBandejasQuesos<-t(costoBandejasQuesos)

costoBandejasQuesos

#ahora debo sumar el costo de cada queso en cada bandeja

costoBandejas<-rowSums(costoBandejasQuesos)

cat("Precio por tipo de bandeja:")

costoBandejas
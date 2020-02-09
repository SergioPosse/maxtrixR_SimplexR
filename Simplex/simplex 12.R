#ITEC RIO CUARTO - DESARROLLO DE SOFTWARE

#MATERIA = MATEMATICA APLICADA
#PROFESOR = JORGE ANTONIO SOSA
#ALUMNO = SERGIO POSSE
#AÑO = 2019

#GUIA METODO SIMPLEX EN R
#EJERCICIO 12


#Fabricación: La empresa el SAMÁN Ltda. Dedicada a la fabricación de muebles,
#ha ampliado su producción en dos líneas más. Actualmente fabrica mesas,
#sillas, camas y bibliotecas. Cada mesa requiere de 2 piezas rectangulares
#de 8 pines, y 2 piezas cuadradas de 4 pines. Cada silla requiere de 1 pieza
#rectangular de 8 pines y 2 piezas cuadradas de 4 pines, cada cama requiere
#de 1 pieza rectangular de 8 pines, 1 cuadrada de 4 pines y 2 bases
#trapezoidales de 2 pines y finalmente cada biblioteca requiere de 2 piezas
#rectangulares de 8 pines, 2 bases trapezoidales de 2 pines y 4 piezas
#rectangulares de 2 pines. Cada mesa cuesta producirla $10000 y se vende en
#$ 30000, cada silla cuesta producirla $ 8000 y se vende en $ 28000, cada
#cama cuesta producirla $ 20000 y se vende en $ 40000, cada biblioteca cuesta
#producirla $ 40000 y se vende en $ 60000. El objetivo de la fábrica es
#maximizar las utilidades.

#======================================================================
############      Rec-8pin	Cuad-4pin	base-trap-2pin	Rec-2pin 
#mesa			2		2		0			0
#Silla		1		2		0			0		
#cama			1		1		2			0 		
#biblioteca 	2		0		2			4
#======================================================================


#Costo de produccion
#		  Importe Venta	 Costo Prod.	  Ganancia		
#mesa 	= 30000 	-	 10000	   =	  20000
#silla 	= 28000 	-	  8000	   =	  20000
#cama		= 40000 	-	 20000	   =	  20000
#biblioteca = 40000 	-	 60000	   =	  20000

#cant. mesas 	 = x1 
#cant. sillas 	 = x2
#cant. camas 	 = x3
#cant. bibliotecas = x4

#FUNCION OBJETIVO (ahora que se cuanto gano con cada mueble, escribo Z)

# 		Z = 20000x1 + 20000x2 + 20000x3 + 20000x4


#RESTRICCIONES

#RESTRICCIONES "MENOR IGUAL A" NO HAY
#RESTRICCIONES "MAYOR IGUAL A" NO HAY
#RESTRICCIONES "IGUAL A" NO HAY

#CONDICION DE NO NEGATIVIDAD (no puedo tener cantidades negativas)
#	x1>=0 ; x2>=0 ; x3>=0 ; x4>=0


##indicamos que usaremos la libreria boot que contiene el metodo simplex

library(boot)

##PASO 1 - en un vector coloco los coeficientes de la funcion a optimizar

a<-c(20000,20000,20000,20000)

##PASO 2 - armar las matrices y vectores de las restricciones

##		NO HAY RESTRICCIONES

##NOTA: las restricciones del tipo condicion de no negatividad no es
##necesario incluirlas

##PASO 3 - Pasar argumentos al metodo simplex y guardo el objeto que devuelve
#en una variable(solucion)
#como necesitamos que el ingreso total sea maximo, maxi = "TRUE" para maximizar
#la funcion objetivo

solucion<- simplex(a=a, maxi="TRUE")

cat("Cantidad de mesas a producir: ",solucion$soln[1],sep="\n")
cat("Cantidad de sillas a producir: ",solucion$soln[2],sep="\n")
cat("Cantidad de camas a producir: ",solucion$soln[3],sep="\n")
cat("Cantidad de bibliotecas a producir: ",solucion$soln[4],sep="\n")

cat("Ingreso total optimo: ",solucion$value,sep="\n")

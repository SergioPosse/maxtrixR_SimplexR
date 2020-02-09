#ITEC RIO CUARTO - DESARROLO DE SOFTWARE

#MATERIA = MATEMATICA APLICADA
#PROFESOR = JORGE ANTONIO SOSA
#ALUMNO = SERGIO POSSE
#AÑO = 2019

#GUIA MATRICES
#EJERCICIO 05


#Una empresa tiene tres minas con menas de composiciones:
#Níquel (%) Cobre (%) Hierro (%).

#Mina A: [1 2 3]
#Mina B: [2 5 7]
#Mina C: [1 3 1]

#¿Cuántas toneladas de cada mina deben utilizarse para obtener
# 7 toneladas de níquel
#18 toneladas de cobre
#16 toneladas de hierro

#PRIMERA DEDUCCION
#No tenemos las toneladas de minerales total que hay en cada mina
#por eso debemos encontrar una forma de expresarlo
#Por regla de 3 simple tenemos que

#MINA A
#A=toneladas totales de la mina A
#NA=toneladas de niquel en la mina A

#A>>>>>>100% |
#		 | TRES SIMPLE |> 1A/100 = NA  
#NA>>>>>>  1% |

#Sabiendo esto la formula para el cobre e hierro es la misma cambiando
#coeficientes

#CA=toneladas de cobre en mina A

		#2A/100 = CA

#HA=toneladas de hierro en mina A

		#3A/100 = HA
#MINA B

#B=toneladas totales de la mina B

#NB=toneladas de niquel en la mina B

#		2B/100=NB

#CB=toneladas de cobre en mina B

#		5B/100 = CB

#HB=toneladas de hierro en mina B

#		7B/100 = HB

#MINA C

#C=toneladas totales de la mina C

#NC=toneladas de niquel en la mina C

#		1C/100=NC

#CC=toneladas de cobre en mina C

#		3C/100 = CC

#HC=toneladas de hierro en mina C

#		1C/100 = HC

#SEGUNDA DEDUCCION
#Necesito extraer por igual de cada mina hasta tener
#7 toneladas de niquel
#18 toneladas de cobre
#16 toneladas de hierro

#Toneladas totales de niquel

#NA + NB + NC = 7

#Remplazando...

#1A/100 + 2B/100 + 1C/100 = 7

#multiplico por 100 en ambos lados de la ecuacion para eliminar el 100 dividiendo...

#1A + 2B + 1C = 700

#Toneladas totales de cobre

#CA + CB + CC = 18

#Remplazando...

#2A/100 + 5B/100 + 3C/100 = 18

#multiplico por 100 en ambos lados de la ecuacion para eliminar el 100 dividiendo...

#2A + 5B + 3C = 1800

#Toneladas totales de hierro

#HA + HB + HC = 16

#Remplazando...

#3A/100 + 7B/100 + 1C/100 = 16

#multiplico por 100 en ambos lados de la ecuacion para eliminar el 100 dividiendo...

#3A + 7B + 1C = 1600


# Y planteamos un sistema de tres ecuaciones con 3 incógnitas:

#   1A + 2B + 1C = 700
#   2A + 5B + 3C = 1800
#   3A + 7B + 1C = 1600


#Creo la matriz 3x3 con los coeficientes del lado izquierdo del sistema de ecuaciones

#Hago 2 arrays para los nombres de filas y columnas

filas = c("Niquel", "Cobre", "Hierro")
columnas = c("Mina A", "Mina B", "Mina C")

#paso como lista los dos vectores que hice con los nombres de filas columnas
#en el argumento "dimmnames"

#OJO!! el vector de coeficientes debe escribirse columna por columna de arriba a abajo
#o fila por fila de izquierda derecha, fijarse segun el caso porque
#puede que se arme una matriz traspuesta a la deseada si no introducimos correctamente

#por defecto byrow="TRUE"

m1<- matrix(c(1,2,3,2,5,7,1,3,1),nrow=3,ncol=3,dimnames=(list(filas,columnas)))

#creo un vector con los coeficientes del lado derecho del sistema de ecuaciones

v1<- c(700,1800,1600)

#Muestro la matriz y el vector

m1

v1

#uso solve para encontrar la solucion al sistema de ecuaciones planteado

solucion<- solve(m1,v1)

cat("Valor de A p/ reemplazar luego: ",solucion[1])
cat("Valor de B p/ reemplazar luego: ",solucion[2])
cat("Valor de C p/ reemplazar luego: ",solucion[3])


#REEMPLAZANDO EN LAS ECUACIONES ORIGINALES 
#DEDUCIMOS CUANTAS TONELADAS DEBEN SACARSE DE CADA MINA PARA TENER
#7 NIQUEL, 18 COBRE , 16 HIERRO


#   1A + 2B + 1C = 700
#    1(200) + 2(100) + 1(300) = 700
#	200 + 200 + 300 = 700 
	#multiplico todos los terminos por 0.01 para revertir la multiplicacion por 100 de antes
	#2 + 2 + 3 = 7 
#==> por lo tanto necesito de niquel: 2t de la mina A, 2t de la mina B, 3t de la mina C

#   2A + 5B + 3C = 1800
#    2(200) + 5(100) + 3(300) = 1800
#	400 + 500 + 900 = 1800
	#multiplico todos los terminos por 0.01 para revertir la multiplicacion por 100 de antes
	#4 + 5 + 9 = 18 
#==> por lo tanto necesito de cobre: 4t de la mina A, 5t de la mina B, 9t de la mina C


#   3A + 7B + 1C = 1600
#    3(200) + 7(100) + 1(300) = 1600
#	600 + 700 + 300 = 1600 toneladas de hierro entre las 3 minas
	#multiplico todos los terminos por 0.01 para revertir la multiplicacion por 100 de antes
	#6 + 7 + 3 = 16 
#==> por lo tanto necesito de hierro: 6t de la mina A, 7t de la mina B, 3t de la mina C

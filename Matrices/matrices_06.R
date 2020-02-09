#ITEC RIO CUARTO - DESARROLO DE SOFTWARE

#MATERIA = MATEMATICA APLICADA
#PROFESOR = JORGE ANTONIO SOSA
#ALUMNO = SERGIO POSSE
#AÑO = 2019

#GUIA MATRICES
#EJERCICIO 06



#1-La edad de un padre es doble de la suma de las edades de sus dos hijos

#2-Mientras que hace unos años (exactamente la diferencia de las edades actuales
#de los hijos), la edad del padre era triple que la suma de las edades, en aquel tiempo,
#de sus hijos.

#3-Cuando pasen tantos años como la suma de las edades actuales de los hijos
#la suma de edades de las tres personas será 150 años.

#Pregunta: ¿Qué edad tenía el padre en el momento de nacer sus hijos? 

#x = edad del padre

#y = edad hijo mayor

#z = edad hijo menor

#PRIMERA DEDUCCION
#La edad de un padre es doble de la suma de las edades de sus dos hijos

#	x = 2(y + z)
#     x - 2y - 2z = 0

#SEGUNDA DEDUCCION
#Hace unos años(exactamente la diferencia de las edades actuales
#de los hijos), la edad del padre era triple que la suma de las edades, en aquel tiempo,
#de sus hijos.

#diferencia de edades actuales de los hijos = y-z

#la edad del padre era triple que la suma de las edades, en aquel tiempo,
#de sus hijos. (le resto a la edad actual de un hijo (y) la diferencia de edadades
#actuales de los dos hijos

#edad de sus hijos en aquel tiempo = y - (y-z)
					     = z - (y-z)

# x - (y-z) = 3 (y - (y-z) + z - (y-z))
# x - y + z = 3 (y - y + z + z - y + z)
# x - y + z = 3y -3y +3z +3z -3y +3z

# x - y + z -3z -3z +3y -3z = 3z +3z -3y +3z

#x -2y - 8z = 0 #simplificada

#Cuando pasen tantos años como la suma de las edades actuales de los hijos = y + z

#La suma de edades de las tres personas será 150 años.
# x + (y+z) + z + (y+z) + y + (y+z) = 150
# x + 4y + 4z = 150 ##simplificada


# Y planteamos un sistema de tres ecuaciones con 3 incógnitas:

#   x - 2y - 2z    = 0
#   x + 2y - 8z	 = 0
#   x + 4y + 4z	 = 150


#ORDENO PARA ARMAR LA MATRIX QUE LAS VARIABLES QUEDEN EN LA MISMA COLUMNA
#relleno con ceros para completar variables en un sistema de ecuaciones canonica 
#para luego implementar por medio de una matriz

# 1x - 2y - 2z = 0
# 1x + 2y - 8z = 0
# 1x + 4y + 4z = 150

#Creo la matriz 5x5 con los coeficientes del lado izquierdo del sistema de ecuaciones

#Hago 2 arrays para los nombres de filas y columnas

filas = c("Deduccion 01", "Deduccion 02", "Deduccion 03")
columnas = c("Padre(x)", "H.Mayor(y)", "H.Menor(z)")

#paso como lista los dos vectores que hice con los nombres de filas columnas
#en el argumento "dimmnames"

#OJO!! el vector de coeficientes debe escribirse columna por columna de arriba a abajo
#o fila por fila de izquierda derecha, fijarse segun el caso porque
#puede que se arme una matriz traspuesta a la deseada si no introducimos correctamente

#por defecto byrow="TRUE"

m1<- matrix(c(1,1,1,-2,2,4,-2,-8,4),nrow=3,ncol=3,dimnames=(list(filas,columnas)))

#creo un vector con los coeficientes del lado derecho del sistema de ecuaciones

v1<- c(0,0,150)

#Muestro la matriz y el vector

m1

v1

#uso solve para encontrar la solucion al sistema de ecuaciones planteado

solucion<- solve(m1,v1)

cat("El padre actualmente tiene: ",solucion[1]," Años")
cat("El hijo mayor actualmente tiene: ",solucion[2]," Años")
cat("El hijo menor actualmente tiene: ",solucion[3]," Años")


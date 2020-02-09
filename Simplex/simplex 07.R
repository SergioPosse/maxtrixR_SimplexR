#ITEC RIO CUARTO - DESARROLLO DE SOFTWARE

#MATERIA = MATEMATICA APLICADA
#PROFESOR = JORGE ANTONIO SOSA
#ALUMNO = SERGIO POSSE
#AÑO = 2019

#GUIA METODO SIMPLEX EN R
#EJERCICIO 07


#Producción: Una compañía fabrica tres tipos de muebles para patio:
#Sillas, mecedoras y sillones. 
#Cada uno requiere madera, plástico y aluminio,
#como se muestra en la siguiente tabla:

#			Madera 	Plástico 	Aluminio 
#Silla		1 unidad 	1 unidad	2 unidades
#Mecedora 		1 unidad	1 unidad	3 unidades
#Sillones 		1 unidad	2 unidades 	5 unidades

#La compañía tiene disponibles 400 unidades de madera,
#500 unidades de plástico y 1450 unidades de aluminio.
#Cada silla, mecedora y sillón se vende en $21, $24 y $36 respectivamente.
#Suponiendo que todos los muebles pueden venderse, determine la producción
#para que el ingreso total sea máximo. ¿Cuál es el ingreso máximo?  


#cant. sillas = x1 
#cant. mecedoras = x2
#cant. sillones = x3

#RESTRICCIONES (lo que tiene disponible de material la fabrica)
#ecuacion que relaciona la madera de los 3 muebles y la disponible
#x1 + x2 + x3 <= 400

#ecuacion que relaciona el plastico
#x1 + x2 + 2x3 <= 500

#ecuacion que relaciona el aluminio
#2x1 + 3x2 + 5x3 <= 1450

#ademas x1>=0;x2>=0;x3>=0

#FUNCION OBJETIVO (ingreso total por la venta de los 3 tipos de muebles)

# Z = 21x1 + 24x2 + 36x3


##indicamos que usaremos la libreria boot que contiene el metodo simplex
library(boot)


##PASO 1 - en un vector coloco los coeficientes de la funcion a optimizar

a<-c(21,24,36)

##PASO 2 - armar las matrices y vectores de las restricciones
##del tipo "menor igual" (A2 y b2); "mayor igual" (A2 y b2); "igual" (A3 y b3)

#MENOR IGUAL
A1<-rbind(c(1,1,1),c(1,1,2),c(2,3,5))

b1<-c(400,500,1450)

#RESTRICCIONES MAYOR IGUAL NO HAY
#RESTRICCIONES IGUAL A NO HAY


##NOTA: las restricciones del tipo condicion de no negatividad no es
##necesario incluirlas

##PASO 3 - Pasar argumentos al metodo simplex y guardo el objeto que devuelve
#en una variable(solucion)
#como necesitamos que el ingreso total sea maximo, maxi = "TRUE" para maximizar
#la funcion objetivo

solucion<- simplex(a=a,A1=A1,b1=b1, maxi="TRUE")

cat("Cantidad sillas a producir: ",solucion$soln[1],sep="\n")
cat("Cantidad mecedoras a producir: ",solucion$soln[2],sep="\n")
cat("Cantidad sillones a producir: ",solucion$soln[3],sep="\n")
cat("Ingreso maximo total: ",solucion$value, sep="\n")
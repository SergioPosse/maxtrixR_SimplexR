#ITEC RIO CUARTO - DESARROLLO DE SOFTWARE

#MATERIA = MATEMATICA APLICADA
#PROFESOR = JORGE ANTONIO SOSA
#ALUMNO = SERGIO POSSE
#AÑO = 2019

#GUIA METODO SIMPLEX EN R
#EJERCICIO 11


#Fabricación:  Una empresa fabrica cuatro productos: A, B, C y D.
#Cada unidad del producto A requiere dos horas de fresado, una hora
#de montaje y 10 dólares de inventario en proceso. Cada unidad del
#producto B necesita una hora de fresado, tres horas de montaje y
#un costo de cinco dólares de proceso de inventariado.
#Una unidad del producto C requiere 2 ½ horas de fresado,
#2 ½ horas d montaje y dos dólares de proceso de inventariado.
#Por último, cada unidad del producto D requiere cinco horas de fresado,
#no necesita montaje y cuesta 12 dólares de proceso de inventariado.
#La empresa tiene 120 horas de fresado y 160 horas de montaje disponibles.
#Además, no puede disponer de más de mil dólares para proceso de inventario.
#Cada unidad del producto A genera un beneficio de 40 dólares; una
#unidad del producto B genera un beneficio de 24 dólares; las unidades
#del producto C generan 36 dólares y las del producto D, 23 dólares.
#No se pueden vender más de 20 unidades del producto A,
#ni más de 16 unidades del producto C;
#puede venderse cualquier número de unidades de los productos B y D.
#Sin embargo, hay que producir y vender por lo menos 10 unidades del
#producto D para satisfacer un requisito contractual.
#Formule el problema anterior como un problema de programación lineal.
#El objetivo de la empresa es maximizar los beneficios que resultan de
#la venta de los cuatro productos. Resuelva el problema en computadora.

#Producto A = x1 
#Producto B = x2
#Producto C = x3
#Producto D = x4

#Pase las horas a minutos por preferencia personal
#1hora = 60 min

#=========================================================================|
#		Hs.Fresado    Hs.Montaje    Costo(dolar)	  Beneficio (dolar) |
#Prod. A 	     2*60		1*60		  10 			40            |
#Prod. B	     1*60		3*60		   5       	      24            |
#Prod. C	     2.5*60		2.5*60	   2 		      36            |
#Prod. D	     5*60		0*60		  12		      23            |
#=========================================================================|

#####AHORA EXPRESADO EN MINUTOS LA TABLA
#=========================================================================|
#		Hs.Fresado    Hs.Montaje    Costo(dolar)	  Beneficio (dolar) |
#Prod. A 	     120		 60		  10 			40            |
#Prod. B	      60		180		   5       	      24            |
#Prod. C	     150		150	  	   2 		      36            |
#Prod. D	     300		  0		  12		      23            |
#=========================================================================|

#FUNCION OBJETIVO A MAXIMIZAR (el maximo beneficio por la venta de los 4 prod.)

#		Z = 40x1 + 24x2 + 36x3 + 23x4

#RESTRICCIONES ENCONTRADAS (LAS HORAS TAMBIEN LAS PASE A MINUTOS)

#120x1 + 60x2 + 150x3 + 300x4 <= 7200 (120h*60) #horas de fresado disponibles
#60x1 + 180x2 + 150x3 + 0x4 <= 9600 (160h*60) #horas de montaje
#10x1 + 5x2 + 2x3 + 12x4 <= 60000 (1000h*60) #dolares disponibles para inventario

# x1 <= 20  #no se pueden vender mas de 20 unid. de prod. A
# x3 <= 16  #no se pueden vender mas de 16 unid. de prod. C !OJO!! PROD. C

# x4 >= 10  #vender por lo menos 10 unid. del prod. D por requisito contractual 

#condicion de no negatividad
# x1>=0 ; x2>=0 ; x3>=0 ; x4>=0


##indicamos que usaremos la libreria boot que contiene el metodo simplex
library(boot)


##PASO 1 - en un vector coloco los coeficientes de la funcion a optimizar

a<-c(40,24,36,23)

##PASO 2 - armar las matrices y vectores de las restricciones
##del tipo "menor igual" (A2 y b2); "mayor igual" (A2 y b2); "igual" (A3 y b3)

#MENOR IGUAL #agrego los coef. 0 para represetnar lo que no existe
# en las matrices ya que no puede quedar vacio

#	 120x1 + 60x2 + 150x3 +  300x4 <= 7200
#	 60x1 + 180x2 + 150x3 +  0x4 <= 9600
#	10x1 + 5x2 +   2x3 + 12x4 <= 60000
# 	 1x1 + 0x2 +   0x3 +  0x4 <= 20 
# 	 0x1 + 0x2 +   1x3 +  0x4 <= 16


A1<-rbind(c(120,60,150,300),c(60,180,150,0),c(10,5,2,12),c(0,0,1,0))

b1<-c(7200,9600,60000,20,16)

#MAYOR IGUAL
# 	 0x1 + 0x2 +   0x3 +  1x4 >= 10

A2<-c(0,0,0,1)

b2<-c(10)

#NO HAY RESTRICCIONES DEL TIPO "IGUAL A" (A3,b3 no existen)

##NOTA: las restricciones del tipo condicion de no negatividad no es
##necesario incluirlas

##PASO 3 - Pasar argumentos al metodo simplex y guardo el objeto que devuelve
#en una variable(solucion)

solucion<- simplex(a=a,A1=A1,b1=b1,A2=A2,b2=b2, maxi="TRUE")

cat("Cant. a producir de Prod. A: ",solucion$soln[1],sep="\n")
cat("Cant. a producir de Prod. B: ",solucion$soln[2],sep="\n")
cat("Cant. a producir de Prod. C: ",solucion$soln[3],sep="\n")
cat("Cant. a producir de Prod. D: ",solucion$soln[4],sep="\n")

cat("Ingreso maximo por vender los 4 prod.: ",solucion$value,sep="\n")

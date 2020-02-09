#ITEC RIO CUARTO - DESARROLLO DE SOFTWARE

#MATERIA = MATEMATICA APLICADA
#PROFESOR = JORGE ANTONIO SOSA
#ALUMNO = SERGIO POSSE
#AÑO = 2019

#GUIA METODO SIMPLEX EN R
#EJERCICIO 03


#Formulación de dieta: Una dieta debe contener al menos 16 unidades
#de carbohidratos y 20 de proteínas. El alimento A contiene 2 unidades de
#carbohidratos y 4 de proteínas; el alimento B contiene 2 unidades de
#carbohidratos y 1 de proteínas. Sí el alimento A cuesta $1,20 por unidad
#y el B $0,80 por unidad. ¿cuántas unidades de cada alimento deben compararse
#para minimizar el costo? ¿Cuál es el costo mínimo?

##Alimento A: 2Carbos y 4Proteinas = $1.20
##Alimento B: 2Carbos y 1Proteina = $0.80

##Costo total para al menos alcanzar 16 carbos y 20 proteinas

#####costo = 1.20(x1)+0.80(x2)

#x1 representa una cantidad ideal a comprar del alimento A
#x2 representa una cantidad ideal a comrpar del alimento B
#No sabemos cuanto de cada alimento por eso son variables, solo sabemos
#que esa "cantidad" balanceada e ideal se multiplica por el precio unitario
#debemos encontrar cual proporcion es la mas optima a comprar con el metodo
#simplex

#Primera restriccion: los carbos deben ser al menos 16
#como minimo 16 en total entre los 2 alimentos
#nos fijamos cuantos carbos tiene cada alimento y lo expresamos
#en ecuacion

#Alimento A (2 carbos)
#Alimento B (2 carbos)

#por lo tanto la cant. de alimento A (x1) que compremos se multiplica
#por su cant. de carbos individual y lo mismo con el alimento B

#2x1 + 2x2 >=16

#Segunda restriccion: las proteinas no deben ser mas de 20
#solo menor o igual (como maximo 20 en total entre los 2 alimentos)
#nos fijamos cuantas proteinas tiene cada alimento y lo expresamos
#en ecuacion

#Alimento A (4 proteinas)
#Alimento B (1 proteina)

#por lo tanto la cant. de alimento A (x1) que compremos se multiplica
#por su cant. de carbos individual y lo mismo con el alimento B

#4x1 + 1x2 >=20

#Ultima restriccion de condicion de no negatividad
#en R no es necesaria pero conceptualmente sirve para evaluar el resultado
#ya que es ilogico comprar -5 alimentos B (por ejemplo)

##indicamos que usaremos la libreria boot que contiene el metodo simplex
library(boot)


##PASO 1 - en un vector coloco los coeficientes de la funcion a optimizar

a<-c(1.20,0.80)

##PASO 2 - A1 es una matriz m*n con coeficientes del lado izquierdo de las
##restricciones del tipo "menor o igual a"

##rbind es para concatenar vectores, matrices o datos en una sola fila

A2<-rbind(c(2,2),c(4,1))

##PASO 3 - b1 corresponde a un vector con coeficientes de la parte derecha
##de las restricciones que se corresponde con la parte izquierda
##que asentamos en A1

b2<-c(16,20)

##si hubiera inecuaciones del tipo <= (menor o igual) entonces se hace otro conjunto
##de A2 y b2

##si hubiera igualdades en las restricciones entonces se usa una tercer A (A3)
##con su respectivos coeficientes de la parte derecha de la igualacion (b3)

##NOTA: las restricciones del tipo condicion de no negatividad no es
##necesario incluirlas

##PASO 4 - Pasar argumentos al metodo simplex

#NOTA IMPORTANTE: 
#si no hay restricciones <= (menor o igual), lo mismo debo incluirlas para poder llegar a
#los parametros A2 y b2, (lo mismo si solo hubiera restricciones del tipo = (igual a)
#deberia completar primero A1,b1 A2,b2 y luego llegar a A3 y b3
#primero probe asignandole NULL a los parametros que no utilizaba pero me daba error
#luego lo llene con 0 0 como mencional a documentacion oficial de R

solucion <- simplex(a=a,A1=c(0,0),b1=c(0),A2=A2,b2=b2,maxi="FALSE")



#There's also sprintf():

#sprintf("Current working dir: %s", wd)
#To print to the console output, use cat() or message():

#cat(sprintf("Current working dir: %s\n", wd))
#message(sprintf("Current working dir: %s\n", wd))


#la funcion cat nos permite concatenar variables y strings
#mientras que solucion es un objeto, puedo acceder a sus atributos con $
#solo porque se trata de la version s3 de la clase, si usara s4 seria @
#el atributo del objeto generado por simplex llamado soln (solucion$soln) es un
#vector con los valores de todas las x como solucion, para acceder a ellas
#usamos los corchetes vector[1], notese que el primer elemento
#no es 0 como es habitual sino que empieza desde 1


cat("La x1 debe valer: ", solucion$soln[1],sep="\n")

cat("La x2 debe valer: ", solucion$soln[2],sep="\n")

cat("x1 y x2 en la func objetivo nos da como resultado: ", solucion$value,sep="\n")
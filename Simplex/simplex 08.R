#ITEC RIO CUARTO - DESARROLLO DE SOFTWARE

#MATERIA = MATEMATICA APLICADA
#PROFESOR = JORGE ANTONIO SOSA
#ALUMNO = SERGIO POSSE
#AÑO = 2019

#GUIA METODO SIMPLEX EN R
#EJERCICIO 08


#Trabajo y Juego: La señorita Ana Gómez es una estudiante emprendedora
#de primer año en el Itec Río Cuarto. Comprende que sólo el trabajo y
#nada de diversión hacen de Ana una muchacha aburrida. Como resultado,
#Ana quiere distribuir su tiempo disponible, de alrededor de 10 horas al día,
#entre el trabajo y la diversión. Calcula que el juego es dos veces más
#divertido que el trabajo. También quiere estudiar por lo menos tanto como juega.
#Sin embargo, Ana comprende que si quiere terminar todas sus tareas universitarias,
#no puede jugar más de cuatro horas al día. ¿Cómo debe distribuir Ana su tiempo para
#maximizar su satisfacción tanto en el trabajo como en el juego?

#Horas que juega = x1 
#Horas que trabaja = x2

#funcion objetivo(podria medirse en grado de satisfaccion)
#y dice que jugar es dos veces mas "satisfactorio" que trabajar, osea que 
#trabajar es "una vez" satisfactorio

#  cant. satisfaccion = 2x1 + x2

#RESTRICCIONES ENCONTRADAS

##x1 <= 4 (no puede jugar mas de 4 horas al dia)
##x2 >= x1 (quiere estudiar por lo menos tanto como juega)
##x1 + x2 <=10 (tiempo disponible 10 hs al dia)

##x1>=0;x2>=0


##indicamos que usaremos la libreria boot que contiene el metodo simplex
library(boot)


##PASO 1 - en un vector coloco los coeficientes de la funcion a optimizar

a<-c(2,1)

##PASO 2 - armar las matrices y vectores de las restricciones
##del tipo "menor igual" (A2 y b2); "mayor igual" (A2 y b2); "igual" (A3 y b3)

#MENOR IGUAL
A1<-rbind(c(1,0),c(1,1))

b1<-c(4,10)

#MAYOR IGUAL
A2<-rbind(c(0,1))
b2<-c(1)


##NOTA: las restricciones del tipo condicion de no negatividad no es
##necesario incluirlas

##PASO 3 - Pasar argumentos al metodo simplex y guardo el objeto que devuelve
#en una variable(solucion)

solucion<- simplex(a=a,A1=A1,b1=b1,A2=A2,b2=b2, maxi="TRUE")

cat("Cantidad horas de juego: ",solucion$soln[1],sep="\n")
cat("Cantidad horas de trabajo: ",solucion$soln[2],sep="\n")
cat("Cantidad de diversion/satisfaccion: ",solucion$value,sep="\n")

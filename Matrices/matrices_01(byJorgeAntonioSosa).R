# Guia de Matrices 
# Ejercicio 01 
# 2019 by JAS
# ----------------
#  Un agente de bolsa vendió a un cliente 200 acciones tipo A,
#  300 de tipo B, 500 de tipo C y 300 de tipo D.
#  Si las acciones se venden a $20, $30, $45 y $100 por acción, respectivamente.
#  a.	Escriba un vector renglón que dé el número de acciones vendidas de cada tipo.
#  b.	Escriba un vector columna que indique los precios correspondientes.
#  c.	¿De cuánto dinero estamos hablando?
# ----------------

# a)
Tipo  <- matrix(c(200,300,500,300),nrow=1,ncol=4)
colnames(Tipo) <- c("Tipo A","Tipo B","Tipo C","Tipo D")
rownames(Tipo) <- "Acciones vendidas"
Tipo

# b)
Valor <- matrix(c(20,30,45,100),nrow=4,ncol=1)
colnames(Valor) <- "Precio Unitario"
rownames(Valor) <- c("Tipo A","Tipo B","Tipo C","Tipo D")
Valor

# c
# el vector columna se transpone para multiplicar, sino da error de dimension
Plata  <- Tipo * t(Valor)
Total  <- sum(Plata)
cat("la cantidad total de dinero es : ", Total)




# extra: para mostrar la matriz final, hay que crearla...
Final <- matrix(c(Tipo, t(Valor), Plata), nrow=4, ncol=3)
colnames(Final)<-c("cantVendida","Xaccion","Total")
rownames(Final)<-c("A=$20","B=$30","C=$45","D=$100")
Final

# Calculo los totales, sumando las columnas
cat("Cantidad de Acciones Vendidas:", sum(Final[,1]))

cat("Importe Total                :", sum(Final[,3]))







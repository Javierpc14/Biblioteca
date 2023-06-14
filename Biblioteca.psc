
//Menu Biblioteca
//Aplicacion que gestiona los libros de una biblioteca
//Realizar procesos introducir, listar, eliminar , salir
//Introducir los libros uno a uno guardandolos en la memoria
//Listar todos los libros que almacene la biblioteca
//Eliminar cualquier libro conservando el resto de libros

SubProceso Visualizar(codigo Por Valor, digito Por Valor, autor Por Valor)
	Segun codigo Hacer
	1:
		Escribir "Biblioteca vacia";
	2:
		Escribir "Datos guardados";
	3:
		Escribir "Datos no se guardaron";
	4:
		Escribir "No existe libro ", digito;
	5:
		Escribir "Datos libro ", digito, " son";
	6:
		Escribir "Datos libro ", digito, " no modificados";
	7:
		Escribir "Datos libro ", digito, " modificados";
	8:
		Escribir "Datos libro ", digito, " no se modificaron";
	9:
		Escribir "Libro borrado";
	10:
		Escribir "Libro no se borró";
	11:
		Escribir "Libros encontrados";
	12:
		Escribir "No se encontraron libros de ", autor;
	13:
		Escribir "Listado libros";
	FinSegun
FinSubProceso

SubProceso respuesta <- Verificar(pregunta Por Valor)
	Definir respuesta como logico;
	Definir letra como caracter;
	respuesta <- Falso;
	Mientras respuesta = Falso Hacer
		Escribir Sin Saltar pregunta;
		Leer letra;
		Si letra = "s" o letra = "S" Entonces
			respuesta <- Verdadero;
		SiNo
			respuesta <- Falso;
		FinSi
	FinMientras
FinSubProceso

SubProceso Buscar(libreria Por Referencia, contador Por Valor)
	Definir indice, j como Entero;
	Definir autor como Cadena;
	
	Si contador > 0 Entonces
		Escribir Sin Saltar "Introduzca autor: ";
		Leer autor;
		Visualizar(11, 0, "");
		j <- 0;

		Para indice <- 0 Hasta contador - 1 Con Paso 1 Hacer
			Si libreria[indice, 1] = autor Entonces
				Escribir "[" , "Libro " , indice , "] " , libreria[indice, 0] , ", " , libreria[indice, 1] , ", " , libreria[indice, 2];
				j <- j + 1;
            FinSi
		FinPara
		Si j = 0 Entonces
			Visualizar(12, 0, autor);
			Escribir "";
		FinSi
		
	Sino
		Visualizar(1, 0, "");
		Escribir "";
	FinSi
FinSubProceso

SubProceso Mostrar(libreria Por Referencia, contador Por Valor)
	Definir indice Como Entero;
	
	Si contador > 0 Entonces
		Escribir Sin Saltar "Introduzca numero de libro a mostrar (0-", contador - 1, "): ";
		Leer indice;
		
		Si indice < 0 O indice > contador - 1 Entonces
			Visualizar(4, indice, "");
			Escribir "";
		Sino
			Visualizar(5, indice, "");
			Escribir "TITULO: " , libreria[indice, 0];
			Escribir "AUTOR: " , libreria[indice, 1];
			Escribir "AÑO: " , libreria[indice, 2];
			Escribir "";
		FinSi
		
	Sino
		Visualizar(1, 0, "");
		Escribir "";
	FinSi
FinSubProceso

SubProceso Actualizar(libreria Por Referencia, contador Por Valor)
	Definir indice Como Entero;
	Definir titulo, autor, anyo Como Cadena;
	Si contador > 0 Entonces
		Escribir "Introduzca numero de libro modificado (0-" , contador -1 , ")";
		leer indice;
		Si indice < 0 O indice > contador - 1 Entonces
			Visualizar(4, indice, "");
			Escribir "";
		SiNo
			Visualizar(5, indice, "");
			Escribir "TITULO: " , libreria[indice, 0];
			Escribir "AUTOR: " , libreria[indice, 1];
			Escribir "AÑO: " , libreria[indice, 2];
			Escribir "";
			Si Verificar("¿Desea modificar los datos de este libro (s,n)?") Entonces
				Escribir "Introduzca los nuevos datos del libro " , indice;
				Escribir Sin Saltar "TITULO: ";
				Leer titulo;
				Escribir Sin Saltar "AUTOR: ";
				Leer autor;
				Escribir Sin Saltar "AÑO: ";
				Leer anyo;
				Escribir "";
				Si Verificar("¿Guardar los nuevos datos introducidos (s,n)?") Entonces
					libreria[ indice, 0 ] <- titulo ;
					libreria[ indice , 1 ] <- autor ;
					libreria[ indice , 2 ] <- anyo ;
					
					Visualizar(7, indice, "");
					Escribir "";
				SiNo
					Visualizar(8, indice, "");
					Escribir "";
				FinSi
			FinSi
		FinSi
	Sino
		Visualizar(1, 0, "");
		Escribir "";
	FinSi
FinSubProceso


SubProceso Menu()
Escribir "MENU BIBLIOTECA" ;
Escribir "1) Introducir libro" ;
Escribir "2) Listar libreria" ;
Escribir "3) Eliminar libro" ;
Escribir "4) Buscar libro" ;
Escribir "5) Mostrar libro" ;
Escribir "6) Actualizar libro" ;
Escribir "0) Salir programa" ;
Escribir "" ;
FinSubProceso

SubProceso Introducir( libreria Por Referencia , contador Por Referencia )
Definir titulo , autor , anyo Como Cadena ;
Escribir "Introduzca datos del libro" ;
Escribir Sin Saltar "TITULO " ;
Leer titulo ;
Escribir Sin Saltar "AUTOR " ;
Leer autor ;
Escribir Sin Saltar "AÑO " ;
Leer anyo ;

Escribir "";
Si Verificar("¿Desea modificar los datos de este libro (s,n)?") Entonces
	libreria[ contador , 0 ] <- titulo ;
	libreria[ contador , 1 ] <- autor ;
	libreria[ contador , 2 ] <- anyo ;
	contador <- contador + 1 ;

	Visualizar(2, 0, "");

SiNo
	Visualizar(3, 0, "");
FinSi
Escribir "";
FinSubProceso



SubProceso Listar( libreria Por Referencia , contador Por Valor )
Definir indice Como Entero ;
Si contador >= 1 Entonces
	Visualizar(13, 0, "");
Para indice <- 0 Hasta contador - 1 Hacer
Escribir "[ Libro " , indice , " ] " , libreria[ indice , 0 ] , " " , libreria[ indice , 1 ] , " ", libreria[ indice , 2 ] ;
FinPara
Escribir "" ;
SiNo
	Visualizar(1, 0, "");
Escribir "" ;
FinSi
FinSubProceso



SubProceso Eliminar( libreria Por Referencia , contador Por Referencia )
	Definir indice Como Entero ;
	
	Si contador >= 1 Entonces
		Escribir Sin Saltar "Introduzca numero de libro a eliminar (0-" , contador - 1 , ")" ;
		Leer indice ;
		Si indice < 0 | indice > contador - 1 Entonces
			Visualizar(4, indice, "");
			Escribir "" ;
		SiNo
			Visualizar(5, indice, "");
			Escribir "TITULO " , libreria[ indice , 0 ] ;
			Escribir "AUTOR " , libreria[ indice , 1 ] ;
			Escribir "AÑO " , libreria[ indice , 2 ] ;
			Escribir "" ;
			Si Verificar("¿Desea Eliminar este libro (s,n)?") Entonces
				libreria[ indice , 0 ] <- "" ;
				libreria[ indice , 1 ] <- "" ;
				libreria[ indice , 2 ] <- "" ;
				Mientras indice < contador - 1 Hacer
					libreria[ indice , 0 ] <- libreria[ indice + 1 , 0 ] ;
					libreria[ indice , 1 ] <- libreria[ indice + 1 , 1 ] ;
					libreria[ indice , 2 ] <- libreria[ indice + 1 , 2 ] ;
					indice <- indice + 1 ;
				FinMientras
				contador <- contador - 1 ;
				Visualizar(9, 0, "");
				Escribir "";
			SiNo
				Visualizar(10, 0, "");
				Escribir "";
			FinSi
		FinSi
	SiNo
		Visualizar(1, 0, "");
	Escribir "" ;
	FinSi
FinSubProceso



Proceso Biblioteca
Escribir "" ;
Dimension libreria[ 10 , 3 ] ;
Definir opcion , contador Como Entero ;
Definir libreria Como Cadena ;
contador <- 0 ;
Repetir
Menu() ;
Repetir
Escribir Sin Saltar "Introduzca opcion (0-6)" ;
Leer opcion ;
Hasta Que opcion >= 0 & opcion <= 9
Segun opcion Hacer
1 : Introducir( libreria , contador ) ;
2 : Listar( libreria , contador ) ;
3 : Eliminar( libreria , contador ) ;
4: Buscar( libreria, contador);
5: Mostrar( libreria, contador);
6: Actualizar( libreria, contador);
7 , 8 , 9 : Escribir "" ;
FinSegun
Hasta Que opcion = 0
FinProceso
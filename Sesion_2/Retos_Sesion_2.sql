# created by: Gabriel Sainz Vázquez
# e-mail: gabriel.sainzva@anahuac.mx

USE tienda;
SHOW tables;

#-------------------------------------------------
#RETO 1: Búsqueda de patrones mediante LIKE

#¿Qué artículos incluyen la palabra Pasta en su nombre?
DESCRIBE articulo;
SELECT * FROM articulo WHERE nombre LIKE '%Pasta%';

#¿Qué artículos incluyen la palabra Cannelloni en su nombre?
DESCRIBE articulo;
SELECT * FROM articulo WHERE nombre LIKE '%Cannelloni%';

#¿Qué nombres están separados por un guión (-) por ejemplo Puree - Kiwi?
DESCRIBE articulo;
SELECT * FROM articulo WHERE nombre LIKE '% - %';

#¿Qué puestos incluyen la palabra Designer?
DESCRIBE puesto;
SELECT * FROM puesto WHERE nombre LIKE '%Designer%';

#¿Qué puestos incluyen la palabra Developer?
DESCRIBE puesto;
SELECT * FROM puesto WHERE nombre LIKE '%Developer%';

#-------------------------------------------------
# Reto 2: Funciones de agrupamiento
# Usando la base de datos tienda, escribe consultas que permitan responder las siguientes preguntas.

# ¿Cuál es el promedio de salario de los puestos?
DESCRIBE puesto;
SELECT avg(salario) AS promedio_salario FROM puesto;

# ¿Cuántos artículos incluyen la palabra Pasta en su nombre?
DESCRIBE articulo;
SELECT count(nombre) AS cuenta_pasta 
	FROM articulo
    WHERE nombre LIKE '%pasta%';

# ¿Cuál es el salario mínimo y máximo?
DESCRIBE puesto;
SELECT min(salario) AS minimo_salario, 
		max(salario) AS maximo_salario
		FROM puesto;

# ¿Cuál es la suma del salario de los últimos cinco puestos agregados?
DESCRIBE puesto;
SELECT sum(salario)
	FROM puesto 
    WHERE id_puesto > ( SELECT max(id_puesto) - 5 FROM puesto);

#-------------------------------------------------
# Reto 3: Agrupamientos
#Usando la base de datos tienda, escribe consultas que permitan responder las siguientes preguntas.
SHOW tables;

#¿Cuántos registros hay por cada uno de los puestos?
DESCRIBE puesto;
SELECT nombre, count(*) FROM puesto 
	GROUP BY nombre;

#¿Cuánto dinero se paga en total por puesto?
DESCRIBE puesto;
SELECT nombre, sum(salario) FROM puesto 
	GROUP BY nombre;

#¿Cuál es el número total de ventas por vendedor?
DESCRIBE venta;
SELECT id_empleado, count(*) AS ventas FROM venta 
	GROUP BY id_empleado;

#¿Cuál es el número total de ventas por artículo?
DESCRIBE venta;
SELECT id_articulo, count(*) FROM venta 
	GROUP BY id_articulo;






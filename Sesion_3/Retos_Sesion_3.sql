# created by: Gabriel Sainz Vázquez
# e-mail: gabriel.sainzva@anahuac.mx


# RETO 1: subconsultas -----------
USE tienda;

# ¿Cuál es el nombre de los empleados cuyo sueldo es menor a $10,000?
DESCRIBE empleado;
DESCRIBE puesto;
SELECT * FROM puesto;
SELECT nombre, apellido_paterno
	FROM empleado
    WHERE id_puesto IN (SELECT id_puesto 
								FROM puesto 
                                WHERE salario > 10000);

# ¿Cuál es la cantidad mínima y máxima de ventas de cada empleado?

SELECT id_empleado, min(total_ventas), max(total_ventas)
	FROM
	(SELECT clave, id_empleado, count(*) AS total_ventas
		FROM venta
		GROUP BY clave, id_empleado) AS sq
	GROUP BY id_empleado;

# ¿Cuáles claves de venta incluyen artículos cuyos precios son mayores a $5,000?

SELECT clave, id_articulo FROM venta
 WHERE id_articulo IN (
 SELECT id_articulo FROM
 articulo WHERE precio > 5000);

# RETO 2: JOINS -----------

#¿Cuál es el nombre de los empleados que realizaron cada venta?
SELECT * FROM empleado;
SELECT * FROM venta;

SELECT clave, nombre, apellido_paterno 
	FROM empleado As e 
    JOIN venta as v 
    ON e.id_empleado = v.id_empleado
    ORDER BY clave;

#¿Cuál es el nombre de los artículos que se han vendido?
SELECT * FROM venta;
SELECT * FROM articulo;

SELECT clave, nombre 
	FROM venta AS v
    LEFT JOIN articulo AS a
    ON v.id_articulo = a.id_articulo
    ORDER BY clave;

#¿Cuál es el total de cada venta?
SELECT * FROM venta;
SELECT * FROM articulo;
SELECT * FROM articulo;

SELECT clave, round(sum(precio), 2) AS total
	FROM venta as v
    JOIN articulo as a
    ON v.id_articulo = a.id_articulo
    GROUP BY clave
    ORDER BY clave;
    
# RETO 3: definicion de vistas -----------
    
# Obtener el puesto de un empleado.
SELECT * FROM empleado;
SELECT * FROM puesto;

CREATE VIEW puesto_empleado AS
(SELECT e.id_puesto, CONCAT(e.nombre, " ", e.apellido_paterno, " ", e.apellido_materno) AS nombre_empleado, p.nombre AS puesto
	FROM empleado AS e
    JOIN puesto AS p 
    ON e.id_puesto = p.id_puesto);
    
select * FROM puesto_empleado;

# Saber qué artículos ha vendido cada empleado.
SELECT * FROM empleado;
SELECT * FROM venta;
SELECT * FROM articulo;

CREATE VIEW articulo_vendido_empleado1 AS
(SELECT v.clave, CONCAT(e.nombre, " ", e.apellido_paterno, " ", e.apellido_materno) AS nombre_empleado, v.id_articulo, a.nombre as articulo
	FROM venta as v
    JOIN empleado as e 
    ON e.id_empleado = v.id_empleado
    JOIN articulo As a
    ON a.id_articulo = v.id_articulo
    ORDER BY v.clave);

SELECT * FROM articulo_vendido_empleado1;

# Saber qué puesto ha tenido más ventas.
SELECT * FROM puesto;
SELECT * FROM venta;
SELECT * FROM empleado;

CREATE VIEW puesto_mas_ventas AS 
(SELECT p.nombre, count(v.clave) AS total
	FROM venta as v
    JOIN empleado AS e
    ON v.id_empleado = e.id_empleado
    JOIN puesto AS p
    ON e.id_puesto = p.id_puesto
    GROUP BY p.nombre);

select * FROM puesto_mas_ventas













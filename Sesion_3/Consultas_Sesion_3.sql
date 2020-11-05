USE tienda;

# Subconsultas ------------------------------
SELECT * FROM puesto;
SELECT max(id_puesto) - 5 FROM puesto;
SELECT sum(salario)
	FROM puesto
	WHERE id_puesto > 995;

# Where

SELECT sum(salario)
	FROM puesto
	WHERE id_puesto > (SELECT max(id_puesto) - 5 FROM puesto);

# Where in 
# empleados cuyo puesto es Junior executive
SELECT id_puesto 
	FROM puesto 
	WHERE nombre = 'Junior Executive';
    
# Cada subocnsulta obtiene una relación-> una tabla
SELECT * 
	FROM empleado 
    WHERE id_puesto IN 
		(SELECT id_puesto 
		FROM puesto 
		WHERE nombre = 'Junior Executive');

# FROM 
# Menor y mayor cantidad de ventas de un artículo 
SELECT * FROM venta;
SELECT clave, id_articulo, count(*) AS cantidad
	FROM venta
    GROUP BY clave, id_articulo
    ORDER BY cantidad DESC;

SELECT id_articulo, min(cantidad) AS cantidad_min, max(cantidad) AS cantidad_max
	FROM 
    (SELECT clave, id_articulo, count(*) AS cantidad
	FROM venta
    GROUP BY clave, id_articulo
    ORDER BY cantidad DESC) AS subconsulta
    GROUP BY id_articulo;

DESCRIBE empleado;
DESCRIBE puesto;

SELECT nombre, apellido_paterno, (SELECT salario FROM puesto WHERE id_puesto = e.id_puesto) AS sueldo
	FROM empleado AS e;

# JOINS ----------------------------------
# Sueldo de cada empleado usando una subconsulta
    
SHOW KEYS FROM venta;
SHOW KEYS FROM puesto;
SHOW KEYS FROM empleado;

SELECT * FROM puesto;
SELECT * FROM empleado;

SELECT * 
	FROM empleado AS e
    JOIN puesto AS p
    ON e.id_puesto = p.id_puesto;
    
SELECT * 
	FROM puesto AS p 
    LEFT JOIN empleado AS e 
    ON p.id_puesto = e.id_puesto;

SELECT * 
	FROM empleado AS e 
    RIGHT JOIN puesto AS p 
    ON p.id_puesto = e.id_puesto;


# vistas ------------------------------
SELECT v.clave, v.fecha, a.nombre AS producto, a.precio, concat(e.nombre, ' ', e.apellido_paterno) AS empleado
	FROM venta as v
    JOIN empleado AS e
    ON v.id_empleado = e.id_empleado 
    JOIN articulo AS a 
    ON v.id_articulo = a.id_articulo;

CREATE VIEW tickets038 AS 
(SELECT v.clave, v.fecha, a.nombre AS producto, a.precio, concat(e.nombre, ' ', e.apellido_paterno) AS empleado
	FROM venta as v
    JOIN empleado AS e
    ON v.id_empleado = e.id_empleado 
    JOIN articulo AS a 
    ON v.id_articulo = a.id_articulo);

SELECT * FROM tickets038;
SELECT clave, round(sum(precio), 2) AS total 
FROM tickets038
GROUP BY clave;

























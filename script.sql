/*
CREACION DE LAS TABLAS ALUMNO, PROFESOR, MATERIA Y LAS TABLAS INTERMEDIAS QUE PERMITEN RELACIONARLAS
*/
CREATE TABLE tbl_alumno (
    num_control integer NOT NULL PRIMARY KEY,
    nombre_alumno varchar(50),
    apellido_paterno varchar(50),
    apellido_materno varchar(50)
);

CREATE TABLE tbl_profesor (
    clave_profesor integer NOT NULL PRIMARY KEY,
    nombre_profesor varchar(50),
    apellido_paterno varchar(50),
    apellido_materno varchar(50)
);

CREATE TABLE tbl_materia (
    id_materia integer NOT NULL PRIMARY KEY,
    nombre_materia varchar(50)
);

CREATE TABLE tbl_alumno_materia (
    id_alumno integer NOT NULL,
    id_materia integer NOT NULL,
    FOREIGN KEY (id_alumno) REFERENCES tbl_alumno(num_control),
    FOREIGN KEY (id_materia) REFERENCES tbl_materia(id_materia),
    UNIQUE (id_alumno, id_materia)
);

CREATE TABLE tbl_profesor_materia (
    id_profesor integer NOT NULL,
    id_materia integer NOT NULL,
    FOREIGN KEY (id_profesor) REFERENCES tbl_profesor(clave_profesor),
    FOREIGN KEY (id_materia) REFERENCES tbl_materia(id_materia),
    UNIQUE (id_profesor, id_materia)
);

/*
INSERCION DE DATOS EN LAS TABLAS
*/
INSERT INTO tbl_alumno VALUES
(73558, 'Manuel', 'Caridad', 'Agab'),
(64164,'Ofelia','Leandro','Lorena'),
(53156,'Virgilio','Rosario','Lucio')
;

INSERT INTO tbl_profesor VALUES
(91766,'Luzia','Plinio','Ligia'),
(90866,'Faustino','Morena','Valter'),
(09914,'Adalberto','Ivonette','Onofre')
;

INSERT INTO tbl_materia VALUES
(1,'Fisica'),
(2,'TIC'),
(3,'Filosofia')
;

INSERT INTO tbl_alumno_materia VALUES
(73558, 2),
(64164, 1),
(64164, 3),
(53156, 3),
(53156, 2)
;

INSERT INTO tbl_profesor_materia VALUES
(91766,1),
(91766,2),
(90866,2),
(09914,3)
;

/*
MODIFICACION DE DATOS
*/
UPDATE tbl_alumno
SET apellido_paterno = 'Morrison'
WHERE num_control = 73558
;

UPDATE tbl_profesor
SET nombre_profesor = 'Fausto'
WHERE nombre_profesor = 'Faustino'
;

UPDATE tbl_materia
SET nombre_materia = 'Informatica'
WHERE id_materia = 2
;

/*
ELIMINACION DE DATOS
*/
DELETE FROM tbl_alumno
WHERE num_control = 53156
;

DELETE FROM tbl_alumno_materia
WHERE id_alumno = 53156
AND id_materia = 6
;

DELETE FROM tbl_profesor_materia
WHERE id_profesor = 91766
AND id_materia = 2
;

/*
CONSULTAS CON LEFT JOIN, INNER JOIN Y RIGHT JOIN
LEFT JOIN: Muestra todas las tuplas de la tabla especificada primero (tabla izquierda) y solo los registros que tengan correspondencia en la tabla derecha.
RIGHT JOIN: Lo mismo que LEFT JOIN pero a la inversa, todos los registros de la tabla derecha, solo los correspondientes en la izquierda.
INNER JOIN: Solo muestra los registros de ambas tablas que se correspondan, ignora si alguna de las 2 tablas contiene un registro vacio en esa tupla.
*/
SELECT tbl_alumno.nombre_alumno,tbl_materia.nombre_materia
FROM
(tbl_alumno LEFT JOIN tbl_alumno_materia ON tbl_alumno.num_control = tbl_alumno_materia.id_alumno
            RIGHT JOIN tbl_materia ON tbl_alumno_materia.id_materia = tbl_materia.id_materia)
;

SELECT tbl_profesor.nombre_profesor,tbl_materia.nombre_materia
FROM
(tbl_profesor INNER JOIN tbl_profesor_materia ON tbl_profesor.clave_profesor = tbl_profesor_materia.id_profesor
            INNER JOIN tbl_materia ON tbl_profesor_materia.id_materia = tbl_materia.id_materia)
;
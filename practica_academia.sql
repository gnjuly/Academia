
CREATE DATABASE academia;

USE academia;

/*Para hacer 'drop' de todas las tablas hay que comenzar por la última hacia arriba.*/
-- DROP DATABASE academia;
-- DROP TABLE alumno;
-- DROP TABLE profesor;
-- DROP TABLE asignatura;
-- DROP TABLE examen;
-- DROP TABLE asig_alumno;
-- DROP TABLE asig_profesor;

/*Para hacer 'select'*/
-- SELECT * FROM alumno;
-- SELECT * FROM profesor;
-- SELECT * FROM asignatura;
-- SELECT * FROM asig_alumno;
-- SELECT * FROM asig_profesor;
-- SELECT * FROM examen;
--
-- Table structure for table `alumno`
--
CREATE TABLE alumno(
alumno_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
nombre VARCHAR(45) NOT NULL,
apellido VARCHAR(45) NOT NULL,
telefono INT NOT NULL,
fecha_alta DATE NOT NULL,
fecha_baja DATE,

PRIMARY KEY  (alumno_id)
);

--
-- Table structure for table `profesor`
--
CREATE TABLE profesor(
profesor_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
nombre VARCHAR(45) NOT NULL,
apellido VARCHAR(45) NOT NULL,
mail VARCHAR(45) NOT NULL,
fecha_alta DATE NOT NULL,
fecha_baja DATE,

PRIMARY KEY (profesor_id)
);

--
-- Table structure for table `asignatura`
--
CREATE TABLE asignatura(
asignatura_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
nombre VARCHAR(45) NOT NULL,
fecha_inicio DATE NOT NULL,
fecha_fin DATE NOT NULL,

PRIMARY KEY  (asignatura_id)
);


--
-- Table structure for table `examen`
--
CREATE TABLE examen(
examen_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
fecha_examen DATE NOT NULL,
asignatura_id SMALLINT UNSIGNED NOT NULL,

PRIMARY KEY (examen_id),
CONSTRAINT fk_asignatura_examen FOREIGN KEY (asignatura_id)
REFERENCES asignatura(asignatura_id) ON DELETE CASCADE ON UPDATE CASCADE
);

--
-- Table structure for table `asig_alumno`
--
CREATE TABLE asig_alumno(
asig_alumno_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
alumno_id SMALLINT UNSIGNED NOT NULL,
asignatura_id SMALLINT UNSIGNED NOT NULL,
nota SMALLINT UNSIGNED,


PRIMARY KEY (asig_alumno_id),
CONSTRAINT fk_asignatura_a FOREIGN KEY (asignatura_id)
REFERENCES asignatura(asignatura_id) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT fk_alumno FOREIGN KEY (alumno_id)
REFERENCES alumno(alumno_id) ON DELETE CASCADE ON UPDATE CASCADE
);

--
-- Table structure for table `asig_profesor`
--
CREATE TABLE asig_profesor(
asig_profesor_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
profesor_id SMALLINT UNSIGNED NOT NULL,
asignatura_id SMALLINT UNSIGNED NOT NULL,


PRIMARY KEY (asig_profesor_id),
CONSTRAINT fk_asignatura_p FOREIGN KEY (asignatura_id)
REFERENCES asignatura(asignatura_id) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT fk_profesor FOREIGN KEY (profesor_id)
REFERENCES profesor(profesor_id) ON DELETE CASCADE ON UPDATE CASCADE
);


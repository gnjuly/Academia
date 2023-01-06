USE academia;

-- Nota media de cada asignatura.

SELECT nombre, 
		(SELECT AVG(nota) 
			FROM asig_alumno AS aa 
            WHERE aa.asignatura_id = a.asignatura_id) AS nota_media
	FROM asignatura AS a
    GROUP BY nombre
    ORDER BY nota_media DESC;

-- Nota media asociada a cada profesor (media las notas de sus asignaturas)

SELECT profesor_id,
		(SELECT nombre FROM profesor AS p WHERE p.profesor_id = ap.profesor_id) AS nombre,
        (SELECT apellido FROM profesor AS p WHERE p.profesor_id = ap.profesor_id) AS apellido,
        (SELECT AVG(nota) FROM asig_alumno AS aa WHERE aa.asignatura_id = ap.asignatura_id) AS nota_media
	FROM asig_profesor AS ap
    GROUP BY profesor_id, nombre, apellido
    ORDER BY profesor_id;

-- ¿Cuál es la nota del último examen realizado por el alumno con mayor nota media?

SELECT nota,
		alumno_id, 
		(SELECT nombre 
			FROM alumno AS alum 
            WHERE alum.alumno_id = aa.alumno_id) AS nombre,
        (SELECT apellido 
			FROM alumno AS alum 
            WHERE alum.alumno_id = aa.alumno_id) AS apellido
	FROM asig_alumno AS aa
    WHERE aa.alumno_id = (SELECT aa.alumno_id 
							FROM asig_alumno AS aa 
                            GROUP BY alumno_id 
                            ORDER BY AVG(nota) DESC LIMIT 1)
				AND aa.asignatura_id = (SELECT aa.asignatura_id 
											FROM asignatura AS a 
                                            WHERE a.asignatura_id = (SELECT e.asignatura_id 
																		FROM examen AS e 
                                                                        ORDER BY e.fecha_examen DESC LIMIT 1));


-- ¿Cuál es la asignatura más dificil?

SELECT AVG(nota) AS nota_promedio,
		asignatura_id,
        (SELECT nombre 
			FROM asignatura AS a 
            WHERE a.asignatura_id = aa.asignatura_id) AS asignatura 
	FROM asig_alumno AS aa 
	GROUP BY asignatura_id
    ORDER BY AVG(nota) ASC;

-- Busca el grupo de riesgo de cada asignatura (alumnos que peor van) y 
-- verifica si hay alguno que esté en todas.

SELECT nota, asignatura_id, alumno_id
	FROM asig_alumno
    WHERE asignatura_id = 1
    ORDER BY nota ASC LIMIT 5;

SELECT nota, asignatura_id, alumno_id
	FROM asig_alumno
    WHERE asignatura_id = 2
    ORDER BY nota ASC LIMIT 5;

SELECT nota, asignatura_id, alumno_id
	FROM asig_alumno
    WHERE asignatura_id = 3
    ORDER BY nota ASC LIMIT 5;

SELECT nota, asignatura_id, alumno_id
	FROM asig_alumno
    WHERE asignatura_id = 4
    ORDER BY nota ASC LIMIT 5;

SELECT nota, asignatura_id, alumno_id
	FROM asig_alumno
    WHERE asignatura_id = 5
    ORDER BY nota ASC LIMIT 5;

SELECT nota, asignatura_id, alumno_id
	FROM asig_alumno
    WHERE asignatura_id = 6
    ORDER BY nota ASC LIMIT 5;

-- Querys de prueba para ultimo ejercicio.
-- No sabemos como agrupar los 5 peores de cada asignatura
SELECT nota, asignatura_id, alumno_id
	FROM asig_alumno
    GROUP BY asignatura_id
    HAVING alumno_id = (SELECT alumno_id FROM asig_alumno ORDER BY nota ASC LIMIT 1);


    

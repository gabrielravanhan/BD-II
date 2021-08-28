-- Identificar os demais registros do mesmo campo NOT NULL

SELECT nome, email
	FROM medicos
		WHERE email IS NOT NULL;
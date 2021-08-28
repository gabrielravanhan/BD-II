-- 1) Identificar algum registro campo NULL

SELECT nome, email
	FROM medicos
		WHERE email IS NULL;
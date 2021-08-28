-- 04 Utilizando like mostrar médicos

-- NOME começa com U
SELECT *
	FROM medicos
		WHERE nome LIKE 'U%';
        
-- NOME começa com UVINA
SELECT *
	FROM medicos
		WHERE nome LIKE 'UVINA%';

-- NOME com a segunda letra V
SELECT *
	FROM medicos
		WHERE nome LIKE '_V%';

-- NOME com a letra A em qualquer posição
SELECT *
	FROM medicos
		WHERE nome LIKE '%A%';
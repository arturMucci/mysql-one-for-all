SELECT
	users.usuario AS pessoa_usuaria,
	IF (MAX(YEAR(hist.data_reproducao)) >= 2021, 'Ativa', 'Inativa') AS status_pessoa_usuaria
FROM
	historico as hist
INNER JOIN
	users AS users ON users.id = hist.usuario_id
GROUP BY
	usuario
ORDER BY
	usuario;

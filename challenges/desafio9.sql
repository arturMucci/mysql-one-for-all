SELECT
	COUNT(hist.musica_id) AS musicas_no_historico
FROM
	historico AS hist
INNER JOIN
	users AS us ON hist.usuario_id = us.id
WHERE
	us.usuario = 'Barbara Liskov';

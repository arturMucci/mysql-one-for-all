SELECT
	users.usuario AS pessoa_usuaria,
  COUNT(hist.musica_id) AS musicas_ouvidas,
  ROUND(SUM(mus.duracao) / 60, 2) AS total_minutos
FROM
	historico AS hist
INNER JOIN
	users AS users ON users.id = hist.usuario_id
INNER JOIN
	musicas AS mus ON mus.id = hist.musica_id
GROUP BY
	usuario
ORDER BY
	usuario;

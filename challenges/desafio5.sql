SELECT
	mus.title AS cancao,
  COUNT(hist.musica_id) AS reproducoes
FROM
	musicas AS mus
INNER JOIN
	historico AS hist  ON mus.id = hist.musica_id
GROUP BY
	mus.title
ORDER BY
	reproducoes DESC, cancao
LIMIT
	2;

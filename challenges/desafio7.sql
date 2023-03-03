SELECT
	art.nome AS artista,
  alb.title AS album,
  COUNT(us_se.usuario_id) AS pessoas_seguidoras
FROM
	artistas AS art
INNER JOIN
	albuns AS alb ON art.id = alb.artista_id
INNER JOIN
	usuario_segue AS us_se
WHERE
	art.id = us_se.artista_id
GROUP BY
	art.nome, alb.title
ORDER BY
	pessoas_seguidoras DESC, artista, album;

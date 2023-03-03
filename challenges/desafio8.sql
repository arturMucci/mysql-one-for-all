SELECT
	art.nome AS artista,
  alb.title AS album
FROM
	artistas AS art
INNER JOIN
	albuns AS alb ON art.id = alb.artista_id
HAVING
	nome = 'Elis Regina'
ORDER BY
	album;

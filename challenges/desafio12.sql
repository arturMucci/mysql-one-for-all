SELECT
	a.nome AS artista,
  CASE
      WHEN COUNT(mus_fav.musicas_id) >= 5 THEN 'A'
      WHEN COUNT(mus_fav.musicas_id) >= 3 THEN 'B'
      WHEN COUNT(mus_fav.musicas_id) >= 1 THEN 'C'
      ELSE '-'
  END AS 'ranking'
FROM
	artistas AS a
INNER JOIN
	albuns as alb ON a.id = alb.artista_id
INNER JOIN
	musicas as m ON m.album_id = alb.id
LEFT JOIN
	musicas_favoritas AS mus_fav ON m.id = mus_fav.musicas_id
GROUP BY
	nome
ORDER BY
	COUNT(mus_fav.musicas_id) DESC, artista;
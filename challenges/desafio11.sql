SELECT
	alb.title AS album,
  COUNT(fav_mus.musicas_id) AS favoritadas
FROM
	musicas_favoritas AS fav_mus
INNER JOIN
	musicas AS mus ON mus.id = fav_mus.musicas_id
INNER JOIN
	albuns AS alb ON alb.id = mus.album_id
GROUP BY
	album
ORDER BY
	favoritadas DESC, album
LIMIT
	3;

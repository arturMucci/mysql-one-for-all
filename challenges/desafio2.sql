SELECT
	COUNT(DISTINCT mus.title) AS cancoes,
	COUNT(DISTINCT mus.album_id) AS albuns,
	COUNT(DISTINCT art.nome) AS artistas
FROM
	musicas AS mus
INNER JOIN
	artistas AS art;

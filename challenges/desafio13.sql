SELECT
	CASE
		WHEN us.idade <= 30 THEN 'Até 30 anos'
		WHEN us.idade BETWEEN 31 AND 59 THEN 'Entre 31 e 60 anos'
		WHEN us.idade >= 60 THEN 'Maior de 60 anos'
  END AS faixa_etaria,
  COUNT(DISTINCT us.id) AS total_pessoas_usuarias,
  COUNT(fav_mus.musicas_id) AS total_favoritadas
FROM
  users AS us
    LEFT JOIN
  musicas_favoritas AS fav_mus ON fav_mus.user_id = us.id
GROUP BY
	faixa_etaria;

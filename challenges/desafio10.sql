CREATE TABLE musicas_favoritas(
	user_id INT NOT NULL,
	musicas_id INT NOT NULL,
	CONSTRAINT PRIMARY KEY (user_id, musicas_id),
	CONSTRAINT FOREIGN KEY (user_id) REFERENCES users(id),
	CONSTRAINT FOREIGN KEY (musicas_id) REFERENCES musicas(id)
);

INSERT INTO musicas_favoritas (user_id, musicas_id)
VALUES
	(1, 3),
	(1, 6),
	(1, 10),
	(2, 4),
	(3, 1),
	(3, 3),
	(4, 7),
	(4, 4),
	(5, 10),
	(5, 2),
	(8, 4),
	(9, 7),
	(10, 3);

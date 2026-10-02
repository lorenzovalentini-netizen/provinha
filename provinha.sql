CREATE TABLE aeronave(
	id_aeronave serial PRIMARY KEY,
	modelo VARCHAR(50) NOT NULL,
	codigo_cauda VARCHAR(10) UNIQUE NOT NULL,
	capacidade INT NOT NULL CHECK (capacidade >0)
);

CREATE TABLE piloto(
	id_piloto SERIAL PRIMARY KEY,
	nome varchar (150) NOT NULL,
	codigo_anac varchar (6) UNIQUE NOT NULL,
	horas_voo INT NOT NULL
);

CREATE TABLE voo(
	id_voo SERIAL PRIMARY KEY,
	aeronave_id INT REFERENCES aeronave (id_aeronave),
	piloto_id INT REFERENCES piloto (id_piloto),
	numero_voo VARCHAR(100) NOT NULL,
	origem VARCHAR(100) NOT NULL,
	destino VARCHAR(100) NOT NULL,
	data_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	status VARCHAR(100) CHECK (status IN ('agendado', 'em voo', 'concluido', 'cancelado')) DEFAULT 'agendado'
);

CREATE TABLE passageiros(
	id_passageiros serial PRIMARY KEY,
	nome VARCHAR (100) NOT NULL,
	cpf VARCHAR (11) UNIQUE NOT NULL,
	email VARCHAR (150) UNIQUE NOT NULL
);

CREATE TABLE passagens(
	id_passagens SERIAL PRIMARY KEY,
	id_voo INT REFERENCES voo (id_voo),
	id_passageiros INT REFERENCES passageiros (id_passageiros),
	assento VARCHAR(4) UNIQUE NOT NULL,
	classe VARCHAR (100) CHECK(classe IN ('economica', 'executiva' )) DEFAULT 'economica',
	valor DECIMAL NOT NULL CHECK(valor >0)
);

INSERT INTO aeronave(modelo, codigo_cauda, capacidade) VALUES
	('aeronave 1', 'POP-523', 120 ),
	('aeronave 2', 'POI-423', 220 ),
	('aeronave 3', 'POW-323', 80 ),
	('aeronave 4', 'POQ-223', 70 ),
	('aeronave 95', 'POK-123', 67 );


INSERT INTO piloto(nome, codigo_anac, horas_voo) VALUES
	('Jacinto', '123456', 9 ),
	('Jorge', '133456', 8 ),
	('Lorenzo', '143456', 12 ),
	('Leitoso', '153456', 14 ),
	('Leitoso', '163456', 22 );

    INSERT INTO voo(aeronave_id, piloto_id, numero_voo, origem, destino, status) VALUES
	(1, 1, '12', 'japao', 'veneza', 'agendado'),
	(2, 2, '6', 'china', 'gramado', 'cancelado'),
	(3, 3, '88', 'escócia', 'portugal', 'em voo'),
	(4, 4, '56', 'lisboa', 'brasil', 'concluido'),
	(5, 5, '67', 'suiça', 'amsterdam', 'agendado');

INSERT INTO passageiros (nome, cpf, email) VALUES
('Marcos Almeida', '12345678901', 'marcos@email.com'),
('Ana Ferreira', '23456789012', 'ana@email.com'),
('Julia Martins', '34567890123', 'julia@email.com'),
('Bruno Rocha', '45678901234', 'bruno@email.com'),
('Fernanda Lima', '56789012345', 'fernanda@email.com');

INSERT INTO passagens
(id_voo, id_passageiros, assento, classe, valor) VALUES
(1, 1, '12A', 'Economica', 450.00),
(2, 2, '15B', 'Economica', 520.00),
(3, 3, '02A', 'Executiva', 1200.00),
(4, 4, '03B', 'Executiva', 1500.00),
(5, 5, '18C', 'Economica', 380.00);
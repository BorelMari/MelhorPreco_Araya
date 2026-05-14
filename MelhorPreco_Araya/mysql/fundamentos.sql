CREATE TABLE usuarios (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    senha_hash VARCHAR(255) NOT NULL,
    cidade VARCHAR(50),
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE parceiros (
    id_parceiro INT PRIMARY KEY AUTO_INCREMENT,
    nome_fantasia VARCHAR(100) NOT NULL,
    cnpj VARCHAR(18) UNIQUE NOT NULL,
    endereco TEXT,
    lat_long VARCHAR(50),
    logotipo_url VARCHAR(255)
);

CREATE TABLE produtos (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    preco_produto float,
    nome_produto VARCHAR(100) NOT NULL,
    categoria VARCHAR(50), -- Ex: Bebidas, Limpeza
    codigo_barras VARCHAR(20) UNIQUE
);

CREATE TABLE ofertas (
    id_oferta INT PRIMARY KEY AUTO_INCREMENT,
    id_parceiro INT,
    id_produto INT,
    preco_original DECIMAL(10, 2),
    preco_oferta DECIMAL(10, 2) NOT NULL,
    data_validade DATE,
    FOREIGN KEY (id_parceiro) REFERENCES parceiros(id_parceiro),
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);
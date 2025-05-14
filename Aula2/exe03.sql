-- Criação do banco
CREATE DATABASE IF NOT EXISTS db_farmacia_bem_estar;
USE db_farmacia_bem_estar;

-- Criação da tabela de Categorias
CREATE TABLE tb_categorias (
    id BIGINT NOT NULL AUTO_INCREMENT,
    nome_categoria VARCHAR(100) NOT NULL,
    setor VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);

-- Criação da tabela de Produtos
CREATE TABLE tb_produtos (
    id BIGINT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(255),
    preco DECIMAL(10,2) NOT NULL,
    quantidade INT NOT NULL,
    categoria_id BIGINT,
    PRIMARY KEY (id),
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

-- Inserção de 5 registros em tb_categorias
INSERT INTO tb_categorias (nome_categoria, setor) VALUES
("Medicamentos", "Saúde"),
("Higiene Pessoal", "Beleza"),
("Vitaminas", "Suplementos"),
("Cuidados com a Pele", "Dermocosméticos"),
("Infantil", "Bebê");

-- Inserção de 8 registros em tb_produtos
INSERT INTO tb_produtos (nome, descricao, preco, quantidade, categoria_id) VALUES
("Paracetamol", "Analgésico e antitérmico", 15.99, 50, 1),
("Shampoo Anticaspa", "Tratamento capilar", 22.50, 30, 2),
("Vitamina C", "Suplemento de ácido ascórbico", 75.00, 20, 3),
("Protetor Solar FPS 60", "Proteção solar alta", 120.00, 15, 4),
("Pomada para assaduras", "Uso infantil", 18.90, 25, 5),
("Ômega 3", "Suplemento natural", 140.00, 10, 3),
("Creme Hidratante Corporal", "Uso diário", 89.90, 18, 4),
("Escova de Cabelo", "Uso pessoal", 35.00, 12, 2);

-- SELECT produtos com valor > R$ 50,00
SELECT * FROM tb_produtos
WHERE preco > 50.00;

-- SELECT produtos com valor entre R$ 5,00 e R$ 60,00
SELECT * FROM tb_produtos
WHERE preco BETWEEN 5.00 AND 60.00;

-- SELECT produtos com a letra 'C' no nome
SELECT * FROM tb_produtos
WHERE nome LIKE '%C%';

-- SELECT com INNER JOIN entre produtos e categorias
SELECT 
    p.id AS id_produto,
    p.nome AS nome_produto,
    p.preco,
    c.nome_categoria,
    c.setor
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.categoria_id = c.id;

-- SELECT com INNER JOIN filtrando por categoria específica
-- Exemplo: produtos da categoria "Vitaminas"
SELECT 
    p.id AS id_produto,
    p.nome AS nome_produto,
    p.preco,
    c.nome_categoria
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.categoria_id = c.id
WHERE c.nome_categoria = "Vitaminas";

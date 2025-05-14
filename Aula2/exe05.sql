-- Criação do banco de dados
CREATE DATABASE IF NOT EXISTS db_construindo_vidas;
USE db_construindo_vidas;

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
("Hidráulica", "Instalações"),
("Elétrica", "Infraestrutura"),
("Pintura", "Acabamento"),
("Ferramentas", "Equipamentos"),
("Revestimentos", "Acabamento");

-- Inserção de 8 registros em tb_produtos
INSERT INTO tb_produtos (nome, descricao, preco, quantidade, categoria_id) VALUES
("Canos PVC 50mm", "Utilizado para esgoto", 120.00, 30, 1),
("Fita Isolante", "Fita para isolamento elétrico", 9.50, 100, 2),
("Lata de Tinta Branca 18L", "Tinta acrílica", 145.90, 20, 3),
("Martelo de Borracha", "Ideal para assentamento de pisos", 70.00, 15, 4),
("Interruptor Simples", "Comando elétrico", 18.75, 40, 2),
("Parafusadeira Elétrica", "Ferramenta elétrica portátil", 299.99, 8, 4),
("Piso Cerâmico 60x60", "Revestimento para chão", 89.90, 50, 5),
("Cimento CP II 50kg", "Material de construção básico", 45.00, 60, 1);

-- SELECT produtos com valor > R$ 100,00
SELECT * FROM tb_produtos
WHERE preco > 100.00;

-- SELECT produtos com valor entre R$ 70,00 e R$ 150,00
SELECT * FROM tb_produtos
WHERE preco BETWEEN 70.00 AND 150.00;

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
-- Exemplo: produtos da categoria "Hidráulica"
SELECT 
    p.id AS id_produto,
    p.nome AS nome_produto,
    p.preco,
    c.nome_categoria
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.categoria_id = c.id
WHERE c.nome_categoria = "Hidráulica";


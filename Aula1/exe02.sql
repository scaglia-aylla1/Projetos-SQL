 CREATE DATABASE  db_registro_escolar;
 use db_registro_escolar;
 
-- Cria a tabela 'estudantes' se ela não existir
CREATE TABLE  tb_estudantes (
    id INT AUTO_INCREMENT,
    nome_completo VARCHAR(255) NOT NULL,
    data_nascimento DATE,
    email VARCHAR(255) UNIQUE,
    nota_final DECIMAL(3, 1),
    turma VARCHAR(50) NOT NULL,
    PRIMARY KEY(id)
); 

INSERT INTO tb_estudantes (nome_completo, data_nascimento, email, nota_final, turma) VALUES
('Ana Clara Silva', '2008-05-10', 'ana.clara@email.com', 8.5, '8A'),
('Pedro Henrique Oliveira', '2007-11-22', 'pedro.henrique@email.com', 6.8, '9B'),
('Mariana Souza Costa', '2009-03-01', 'mariana.costa@email.com', 9.2, '7C'),
('Lucas Almeida Santos', '2008-07-15', 'lucas.almeida@email.com', 7.5, '8A'),
('Beatriz Pereira Lima', '2007-09-05', 'beatriz.lima@email.com', 5.9, '9B'),
('Gabriel Rodrigues Alves', '2009-01-28', 'gabriel.alves@email.com', 8.0, '7C'),
('Isabela Fernandes Rocha', '2008-12-03', 'isabela.rocha@email.com', 6.5, '8A'),
('Matheus Gonçalves Souza', '2007-06-18', 'matheus.goncalves@email.com', 9.5, '9B');

-- Seleciona todos os estudantes com nota final maior que 7.0
SELECT * FROM tb_estudantes WHERE nota_final > 7.0;

-- Atualiza a nota final do Pedro Henrique Oliveira
UPDATE tb_estudantes
SET nota_final = 7.1
WHERE id = 2;
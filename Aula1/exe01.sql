CREATE DATABASE db_systemRh;

USE db_systemRh;
CREATE TABLE tb_colaboradores(
 id INT AUTO_INCREMENT,
 nome VARCHAR(255) NOT NULL,
 email VARCHAR(255) UNIQUE NOT NULL,
 cargo VARCHAR(100) NOT NULL,
 data_contratacao DATE NOT NULL,
departamento VARCHAR(100) NOT NULL,
PRIMARY KEY(id)
);
INSERT INTO tb_colaboradores (nome, email, cargo, data_contratacao, departamento) VALUES
('Ana Souza', 'ana.souza@email.com', 'Analista de RH', '2024-08-15', 'Recursos Humanos'),
('Carlos Pereira', 'carlos.pereira@email.com', 'Desenvolvedor Front-End', '2023-05-20', 'Tecnologia da Informação'),
('Mariana Oliveira', 'mariana.oliveira@email.com', 'Assistente Administrativo', '2025-01-10', 'Administrativo'),
('Ricardo Alves', 'ricardo.alves@email.com', 'Gerente de Projetos', '2022-11-01', 'Projetos'),
('Fernanda Lima', 'fernanda.lima@email.com', 'Analista de Marketing', '2025-03-01', 'Marketing');

ALTER TABLE tb_colaboradores
ADD COLUMN salario DECIMAL(10, 2) NOT NULL;

SELECT * FROM tb_colaboradores;

UPDATE tb_colaboradores SET salario = 5500.00 WHERE id = 1; -- Ana Souza
UPDATE tb_colaboradores SET salario = 7200.50 WHERE id = 2; -- Carlos Pereira
UPDATE tb_colaboradores SET salario = 3800.00 WHERE id = 3; -- Mariana Oliveira
UPDATE tb_colaboradores SET salario = 9000.00 WHERE id = 4; -- Ricardo Alves
UPDATE tb_colaboradores SET salario = 6000.00 WHERE id = 5; -- Fernanda Lima

INSERT INTO tb_colaboradores (nome, email, cargo, data_contratacao, departamento, salario) VALUES
('Luana Freitas', 'lufreitas@email.com', 'Desenvolvedora Backend', '2025-04-22', 'Tecnologia', 9500.00);

INSERT INTO tb_colaboradores (nome, email, cargo, data_contratacao, departamento, salario) VALUES
('Ana Julia Faria', 'anju@email.com', 'Estágiaria', '2025-02-25', 'Tecnologia', 1800.00);

SELECT * FROM tb_colaboradores;

SELECT * FROM tb_colaboradores WHERE salario > 2000;

SELECT * FROM tb_colaboradores WHERE salario < 2000;

UPDATE colaboradores
SET salario = 6000.00, departamento = 'Gestão de Pessoas'
WHERE id = 1;
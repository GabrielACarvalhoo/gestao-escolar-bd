-- DML — inserção de dados (INSERT)
-- Sistema de Gestão Escolar

USE gestao_escolar;

-- 1. Inserindo Usuários (Base para Responsáveis, Alunos e Professores)
-- IDs 1 a 3: Responsáveis | IDs 4 a 8: Alunos | IDs 9 a 11: Professores
INSERT INTO Usuario (idUsuario, nomeUsuario, dtNascimento, rua, cidade, cep) VALUES
(1, 'Carlos Silva', '1980-05-15', 'Rua das Flores, 123', 'São Paulo', '01001-000'),
(2, 'Mariana Oliveira', '1975-10-22', 'Av. Paulista, 900', 'São Paulo', '01310-100'),
(3, 'Roberto Santos', '1982-03-30', 'Rua Augusta, 456', 'São Paulo', '01305-000'),
(4, 'Lucas Silva', '2010-02-14', 'Rua das Flores, 123', 'São Paulo', '01001-000'),
(5, 'Beatriz Silva', '2012-08-09', 'Rua das Flores, 123', 'São Paulo', '01001-000'),
(6, 'Pedro Oliveira', '2009-11-20', 'Av. Paulista, 900', 'São Paulo', '01310-100'),
(7, 'Ana Santos', '2011-04-18', 'Rua Augusta, 456', 'São Paulo', '01305-000'),
(8, 'João Fernandes', '2010-12-05', 'Rua do Sol, 88', 'São Paulo', '02002-000'),
(9, 'Fernanda Lima', '1990-07-11', 'Av. Brasil, 1500', 'São Paulo', '01430-000'),
(10, 'Ricardo Mendes', '1985-09-25', 'Rua da Consolação, 300', 'São Paulo', '01302-000'),
(11, 'Juliana Costa', '1992-01-10', 'Rua Bela Vista, 77', 'São Paulo', '01322-000');

-- 2. Inserindo Séries
INSERT INTO Serie (idSerie, nomeSerie) VALUES
(1, '6º Ano - Ensino Fundamental'),
(2, '7º Ano - Ensino Fundamental'),
(3, '8º Ano - Ensino Fundamental'),
(4, '1º Ano - Ensino Médio');

-- 3. Inserindo Disciplinas
INSERT INTO Disciplina (idDisciplina, nomeDisciplina, cargaHoraria) VALUES
(1, 'Matemática', 120),
(2, 'Língua Portuguesa', 120),
(3, 'História', 80),
(4, 'Ciências', 80),
(5, 'Geografia', 80);

-- 4. Inserindo Responsáveis (Especialização de Usuário)
INSERT INTO Responsavel (idResponsavel, idUsuario) VALUES
(1, 1), -- Carlos Silva
(2, 2), -- Mariana Oliveira
(3, 3); -- Roberto Santos

-- 5. Inserindo Alunos (Especialização de Usuário)
INSERT INTO Aluno (matricula, idUsuario) VALUES
(1, 4), -- Lucas Silva
(2, 5), -- Beatriz Silva
(3, 6), -- Pedro Oliveira
(4, 7), -- Ana Santos
(5, 8); -- João Fernandes

-- 6. Inserindo Professores (Especialização de Usuário)
INSERT INTO Professor (idProfessor, idUsuario, formacao, dtAdmissao, cargaHorariaSemanal) VALUES
(1, 9, 'Licenciatura em Matemática', '2018-02-01', 40),      -- Fernanda Lima
(2, 10, 'Licenciatura em Letras', '2015-03-15', 30),        -- Ricardo Mendes
(3, 11, 'Licenciatura em História e Geografia', '2020-01-20', 40); -- Juliana Costa

-- 7. Inserindo Turmas
INSERT INTO Turma (idTurma, idSerie, nomeTurma, anoLetivo) VALUES
(1, 1, 'Turma 6A', 2023),
(2, 2, 'Turma 7A', 2023),
(3, 4, 'Turma 1M', 2023);

-- 8. Inserindo Telefones dos Usuários
INSERT INTO Telefone_Usuario (idUsuario, telefone) VALUES
(1, '(11) 99999-1111'),
(1, '(11) 3333-1111'),
(2, '(11) 98888-2222'),
(3, '(11) 97777-3333'),
(9, '(11) 96666-4444'),
(10, '(11) 95555-5555'),
(11, '(11) 94444-6666');

-- 9. Inserindo Relação Responsável_Aluno
INSERT INTO Responsavel_Aluno (matricula, idResponsavel, parentesco) VALUES
(1, 1, 'Pai'),     -- Carlos é pai de Lucas
(2, 1, 'Pai'),     -- Carlos é pai de Beatriz
(3, 2, 'Mãe'),     -- Mariana é mãe de Pedro
(4, 3, 'Pai');     -- Roberto é pai de Ana

-- 10. Inserindo Relação Aluno_Turma
INSERT INTO Aluno_Turma (matricula, idTurma) VALUES
(1, 1), -- Lucas na Turma 6A
(2, 2), -- Beatriz na Turma 7A
(3, 1), -- Pedro na Turma 6A
(4, 2), -- Ana na Turma 7A
(5, 3); -- João na Turma 1M

-- 11. Inserindo Avaliações
-- (matricula, idDisciplina, numeroAvaliacao, notaN1, notaN2)
INSERT INTO Avaliacao (matricula, idDisciplina, numeroAvaliacao, notaN1, notaN2) VALUES
(1, 1, 1, 7.5, 8.0), -- Lucas, Mat, Av 1
(1, 2, 1, 6.0, 7.0), -- Lucas, Port, Av 1
(2, 1, 1, 9.0, 8.5), -- Beatriz, Mat, Av 1
(3, 1, 1, 5.5, 6.0), -- Pedro, Mat, Av 1
(4, 3, 1, 8.0, 9.0), -- Ana, Hist, Av 1
(5, 4, 1, 7.0, 7.5); -- João, Cien, Av 1

-- 12. Inserindo Relação Leciona (Professor + Disciplina + Turma)
INSERT INTO Leciona (idProfessor, idDisciplina, idTurma) VALUES
(1, 1, 1), -- Fernanda ensina Matemática na Turma 6A
(1, 1, 2), -- Fernanda ensina Matemática na Turma 7A
(2, 2, 1), -- Ricardo ensina Português na Turma 6A
(2, 2, 3), -- Ricardo ensina Português na Turma 1M
(3, 3, 2), -- Juliana ensina História na Turma 7A
(3, 5, 3); -- Juliana ensina Geografia na Turma 1M

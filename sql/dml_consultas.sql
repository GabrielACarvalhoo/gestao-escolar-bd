-- DML — consultas e atualizações (SELECT, UPDATE)
-- Sistema de Gestão Escolar.
USE gestao_escolar;

-- 1. SELECT SIMPLES
-- Objetivo: Consultar as disciplinas que possuem uma carga horária alta.
-- Explicação: Esta query seleciona o nome e a carga horária de todas as 
-- disciplinas cadastradas cuja carga horária seja maior que 80 horas.

SELECT nomeDisciplina, cargaHoraria 
FROM Disciplina 
WHERE cargaHoraria > 80;

-- 2. SELECT COM JOIN ENTRE TABELAS
-- Objetivo: Saber em quais turmas cada aluno está matriculado.
-- Explicação: Esta query cruza dados de 4 tabelas para exibir informações legíveis.
-- Ela pega o nome do usuário (que é o aluno), liga com a tabela Aluno, 
-- depois passa pela tabela associativa Aluno_Turma para finalmente chegar
-- na tabela Turma e buscar o nome da turma.

SELECT u.nomeUsuario AS Nome_Aluno, t.nomeTurma AS Turma, t.anoLetivo AS Ano
FROM Usuario u
JOIN Aluno a ON u.idUsuario = a.idUsuario
JOIN Aluno_Turma at ON a.matricula = at.matricula
JOIN Turma t ON at.idTurma = t.idTurma;

-- 3. UPDATE COM CONDIÇÃO (WHERE)
-- Objetivo: Corrigir/Atualizar a nota N2 de um aluno específico em uma avaliação.
-- Explicação: Esta query atualiza a coluna 'notaN2' para 8.5 na tabela Avaliacao. 
-- A cláusula WHERE garante que a alteração seja feita exclusivamente na prova 
-- (numeroAvaliacao = 1) de Língua Portuguesa (idDisciplina = 2) do aluno 
-- Lucas (matricula = 1), que anteriormente era 7.0.

UPDATE Avaliacao 
SET notaN2 = 8.5 
WHERE matricula = 1 
AND idDisciplina = 2 
AND numeroAvaliacao = 1;


-- SELECT para confirmar se o UPDATE funcionou corretamente:
SELECT * 
FROM Avaliacao 
WHERE matricula = 1 AND idDisciplina = 2;

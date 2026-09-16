-- DDL do banco gestao_escolar (baseado no modelo logico)

-- Usuario
CREATE TABLE Usuario (
  idUsuario INT NOT NULL AUTO_INCREMENT,
  nomeUsuario VARCHAR(100) NOT NULL,
  dtNascimento DATE NOT NULL,
  rua VARCHAR(150) NOT NULL,
  cidade VARCHAR(100) NOT NULL,
  cep VARCHAR(10) NOT NULL,
  PRIMARY KEY (idUsuario)
);

-- Serie
CREATE TABLE Serie (
  idSerie INT NOT NULL AUTO_INCREMENT,
  nomeSerie VARCHAR(50) NOT NULL,
  PRIMARY KEY (idSerie)
);

-- Disciplina
CREATE TABLE Disciplina (
  idDisciplina INT NOT NULL AUTO_INCREMENT,
  nomeDisciplina VARCHAR(100) NOT NULL,
  cargaHoraria INT NOT NULL,
  PRIMARY KEY (idDisciplina)
);

-- Responsavel, especializacao de Usuario
CREATE TABLE Responsavel (
  idResponsavel INT NOT NULL AUTO_INCREMENT,
  idUsuario INT NOT NULL,
  PRIMARY KEY (idResponsavel),
  FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Aluno, especializacao de Usuario
CREATE TABLE Aluno (
  matricula INT NOT NULL AUTO_INCREMENT,
  idUsuario INT NOT NULL,
  PRIMARY KEY (matricula),
  FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Professor, especializacao de Usuario
CREATE TABLE Professor (
  idProfessor INT NOT NULL AUTO_INCREMENT,
  idUsuario INT NOT NULL,
  formacao VARCHAR(100) NOT NULL,
  dtAdmissao DATE NOT NULL,
  cargaHorariaSemanal INT NOT NULL,
  PRIMARY KEY (idProfessor),
  FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Turma
CREATE TABLE Turma (
  idTurma INT NOT NULL AUTO_INCREMENT,
  idSerie INT NOT NULL,
  nomeTurma VARCHAR(50) NOT NULL,
  anoLetivo INT NOT NULL,
  PRIMARY KEY (idTurma),
  FOREIGN KEY (idSerie) REFERENCES Serie(idSerie) ON DELETE RESTRICT ON UPDATE CASCADE
);

-- Telefone_Usuario, atributo multivalorado do Usuario
CREATE TABLE Telefone_Usuario (
  idUsuario INT NOT NULL,
  telefone VARCHAR(20) NOT NULL,
  PRIMARY KEY (idUsuario, telefone),
  FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Responsavel_Aluno, entidade associativa
CREATE TABLE Responsavel_Aluno (
  matricula INT NOT NULL,
  idResponsavel INT NOT NULL,
  parentesco VARCHAR(50) NOT NULL,
  PRIMARY KEY (matricula, idResponsavel),
  FOREIGN KEY (matricula) REFERENCES Aluno(matricula) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (idResponsavel) REFERENCES Responsavel(idResponsavel) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Aluno_Turma, entidade associativa
CREATE TABLE Aluno_Turma (
  matricula INT NOT NULL,
  idTurma INT NOT NULL,
  PRIMARY KEY (matricula, idTurma),
  FOREIGN KEY (matricula) REFERENCES Aluno(matricula) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (idTurma) REFERENCES Turma(idTurma) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Avaliacao, entidade fraca (depende de Aluno e Disciplina)
CREATE TABLE Avaliacao (
  matricula INT NOT NULL,
  idDisciplina INT NOT NULL,
  numeroAvaliacao INT NOT NULL,
  notaN1 FLOAT NOT NULL,
  notaN2 FLOAT NOT NULL,
  PRIMARY KEY (matricula, idDisciplina, numeroAvaliacao),
  FOREIGN KEY (matricula) REFERENCES Aluno(matricula) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (idDisciplina) REFERENCES Disciplina(idDisciplina) ON DELETE RESTRICT ON UPDATE CASCADE
);

-- Leciona, relacionamento ternario (Professor + Disciplina + Turma)
CREATE TABLE Leciona (
  idProfessor INT NOT NULL,
  idDisciplina INT NOT NULL,
  idTurma INT NOT NULL,
  PRIMARY KEY (idProfessor, idDisciplina, idTurma),
  FOREIGN KEY (idProfessor) REFERENCES Professor(idProfessor) ON DELETE RESTRICT ON UPDATE CASCADE,
  FOREIGN KEY (idDisciplina) REFERENCES Disciplina(idDisciplina) ON DELETE RESTRICT ON UPDATE CASCADE,
  FOREIGN KEY (idTurma) REFERENCES Turma(idTurma) ON DELETE CASCADE ON UPDATE CASCADE
);

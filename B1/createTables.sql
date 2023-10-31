CREATE TABLE Bib.Leitor (
  idLeitor INT IDENTITY PRIMARY KEY,
  nomeLeitor VARCHAR(50) NOT NULL,
  telefoneLeitor VARCHAR(20),
  emailLeitor VARCHAR(50),
  enderecoLeitor VARCHAR(100) NOT NULL,
  suspenso CHAR(1)
);

CREATE TABLE Bib.Livro (
  idLivro INT IDENTITY PRIMARY KEY,
  codigoLivro VARCHAR(10) NOT NULL,
  tituloLivro VARCHAR(50) NOT NULL,
  autorLivro VARCHAR(50) NOT NULL
);

CREATE TABLE Bib.Emprestimo (
  idEmprestimo INT IDENTITY PRIMARY KEY,
  idLivro INT,
  idLeitor INT,
  dataEmprestimo DATE NOT NULL,
  dataDevolucaoPrevista DATE NOT NULL,
  dataDevolucaoReal DATE,
  multa MONEY

  CONSTRAINT FK_idLivro FOREIGN KEY REFERENCES Bib.Livro(idLivro),
  CONSTRAINT FK_idLeitor FOREIGN KEY REFERENCES Bib.Leitor(idLeitor)
);

CREATE TABLE Bib.Multa (
  multaDiaria MONEY PRIMARY KEY
);
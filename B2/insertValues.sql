INSERT INTO Bib.Livro (codigoLivro, tituloLivro, autorLivro)
VALUES
    (100, 'Livro 1', 'Autor 1'),
    (150, 'Livro 2', 'Autor 2'),
    (300, 'Livro 3', 'Autor 3');

INSERT INTO Bib.Cliente (nomeLeitor, telefoneLeitor, emailLeitor, enderecoLeitor)
VALUES
    ('Cliente 1', '123456789', 'cliente1@email.com', 'Endereço 1'),
    ('Cliente 2', '987654321', 'cliente2@email.org', 'Endereço 2'),
    ('Cliente 3', '123234345', 'cliente3@email.net', 'Endereço 3');

INSERT INTO Bib.Emprestimo (idLivro, idLeitor, dataEmprestimo, dataDevolucaoPrevista, dataDevolucaoReal, multa)
VALUES
    (1, 1, '2023-08-10', '2023-08-24', NULL),
    (2, 2, '2023-09-15', '2023-09-29', '2023-09-20'),
    (3, 3, '2023-10-20', '2023-11-03', '2023-11-24', 7.0);

INSERT INTO Bib.Multa (multaDiaria)
VALUES
    (11),
    (8.50),
    (7.0);
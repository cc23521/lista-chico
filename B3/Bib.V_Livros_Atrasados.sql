CREATE VIEW Bib.V_Livros_Atrasados
AS
DECLARE
  @dataEmprestimo DATE,
  @dataDevolucaoReal DATE
SELECT
  @dataEmprestimo = dataEmprestimo,
  @dataDevolucaoReal = dataDevolucaoReal
FROM Bib.Emprestimo
WHERE
SELECT 
  Lv.idLivro, Lv.tituloLivro,
  Lt.idLeitor, Lt.nomeLeitor,
  E.dataDevolucaoPrevista, @diasAtraso = 
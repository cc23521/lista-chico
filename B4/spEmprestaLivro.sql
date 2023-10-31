create or alter procedure Bib.spEmprestaLivro
  @idLivro int,
  @idLeitor int,
  @diasEmprestimo int,
  @resultado char(3) output
as
begin
  -- Leitor está suspenso
  declare @estaSuspenso char(1)
  select @estaSuspenso = suspenso
  from Bib.Leitor
  where idLeitor = @idLeitor
  if @estaSuspenso = 'S'
  begin
    set @resultado = 'Não'
    return
  end

  -- Leitor tem mais de 5 livros emprestados
  declare @quantosLivros int 
  select @quantosLivros = count(*) from Bib.Emprestimo
  where idLeitor = @idLeitor and dataDevolucaoReal is null
  if @quantosLivros >= 5
  begin
    set @resultado = 'Não'
    return
  end

  -- Livro já está emprestado
  if exists (select * from Bib.Emprestimo where idLivro = @idLivro and dataDevolucaoReal is null)
  begin
    set @resultado = 'Não'
    return
  end

  begin tran
    set @resultado = 'Sim'
    insert into Bib.Emprestimo (idLivro, idLeitor, dataEmprestimo, dataDevolucaoPrevista, dataDevolucaoReal, multa)
    values (
      @idLivro, @idLeitor, getdate(), getdate() + @diasEmprestimo, null, null
    )
  commit tran
end
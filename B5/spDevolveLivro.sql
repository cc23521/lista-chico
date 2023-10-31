create or alter procedure Bib.spDevolveLivro
  @idLivro int,
  @resultado char(3) output
as
begin
  if exists (select * from Bib.Emprestimo where idLivro = @idLivro and dataDevolucaoReal is null)
  begin
    declare
      @dataDevolucaoPrevista date,
      @dataDevolucaoReal date = GETDATE()
    select
      @dataDevolucaoPrevista = dataDevolucaoPrevista
    from Bib.Emprestimo
    where idLivro = @idLivro
    if @dataDevolucaoReal > @dataDevolucaoPrevista
    begin
      declare @diasAtraso int = DATEDIFF('days', @dataDevolucaoReal, @dataDevolucaoPrevista)
      if @diasAtraso > 15
      begin
        begin tran
        declare @idLeitor int
        select @idLeitor = idLeitor
        from Bib.Emprestimo
        where idLivro = @idLivro and dataDevolucaoReal is null
        update Bib.Leitor
        set suspenso = 'S'
        where idLeitor = @idLeitor
        
        update Bib.Emprestimo
        set dataDevolucaoReal = GETDATE()
        where idLivro = @idLivro and dataDevolucaoReal is NULL
        set @resultado = 'Sim'
        commit tran      
      end
    end
    else
    begin
      update Bib.Emprestimo
      set dataDevolucaoReal = GETDATE()
      where idLivro = @idLivro and dataDevolucaoReal is NULL
      set @resultado = 'Sim'
    end
  end
  else
  begin
    set @resultado = 'Não'
  end
end
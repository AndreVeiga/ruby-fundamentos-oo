class Livro
  attr_reader :titulo, :preco, :ano_lancamento, :reimpressao, :editora

  def initialize titulo, preco, ano_lancamento, reimpressao, editora
    @titulo = titulo
    @ano_lancamento = ano_lancamento
    @reimpressao = reimpressao
    @preco = calcula_preco(preco)
    @editora = editora
  end

  def to_csv
    "#{@titulo} - #{@ano_lancamento} - #{@reimpressao}"
  end

  def matches? query
    query == "livro"
  end


  private 
  def calcula_preco base
    if @ano_lancamento < 2006 && @reimpressao
      base *= 0.90
    elsif @ano_lancamento < 2006 && !@reimpressao
      base *= 0.95
    elsif @ano_lancamento >= 2006 && @ano_lancamento <= 2010
      base *= 0.96
    else
      base
    end
  end
end


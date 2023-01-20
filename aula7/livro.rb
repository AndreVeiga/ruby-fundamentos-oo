require_relative "produto"

class Livro
  attr_reader :reimpressao

  include Produto

  def initialize titulo, preco, ano_lancamento, reimpressao, editora
    @titulo = titulo
    @ano_lancamento = ano_lancamento
    @reimpressao = reimpressao
    @preco = calcula_preco(preco)
    @editora = editora
  end

  def matches? query
    query == "livro"
  end
end
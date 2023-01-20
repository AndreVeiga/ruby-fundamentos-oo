require_relative "produto"

class Ebook

  include Produto

  def initialize titulo, preco, ano_lancamento, editora
    @titulo = titulo
    @ano_lancamento = ano_lancamento
    @preco = calcula_preco(preco)
    @editora = editora
  end

  def matches? query
    query == "ebook"
  end
end
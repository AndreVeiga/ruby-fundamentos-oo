require_relative "produto"
require_relative "impresso"

class Livro < Produto
  attr_reader :reimpressao

  include Impresso

  def initialize titulo, preco, ano_lancamento, reimpressao, editora
    super titulo, ano_lancamento, preco, editora
    @reimpressao = reimpressao
  end

  def matches? query
    query == "livro"
  end
end
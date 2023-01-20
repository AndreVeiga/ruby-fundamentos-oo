require_relative "produto"
require_relative "impresso"

class Revista < Produto
  attr_reader :numero

  include Impresso

  def initialize titulo, preco, ano_lancamento, editora, numero, reimpressao
    super titulo, ano_lancamento, preco, editora
    @numero = numero
    @reimpressao = reimpressao
  end

  def matches? query
    query == "revista"
  end
end
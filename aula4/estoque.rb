require_relative "contador"

class Estoque
  def initialize
    @livros = []
    @vendas = []
    @livros.extend Contador
  end

  def quantidade_de_vendas_de_um produto, &campo
    @vendas.count { |venda| campo.call(venda) ==  campo.call(produto) }
  end

  def que_mais_vendeu_por tipo, &campo
    @vendas.select {|l| l.tipo == tipo }
    .sort { |v1, v2|
      quantidade_de_vendas_de_um(v1, &campo) <=> quantidade_de_vendas_de_um(v2, &campo)
    }.last
  end

  def revista_que_mais_vendeu_por &campo
    que_mais_vendeu_por "revista", &campo
  end

  def livro_que_mais_vendeu_por &campo
    que_mais_vendeu_por "livro", &campo
  end
  
  def exporta_csv
    @livros.each do |livro|
      puts livro.to_csv
    end
  end

  def mais_baratos_que valor
    @livros.select do |livro|
      livro <= valor
    end
  end

  def total
    @livros.size
  end

  def <<(livro)
    @livros << livro if livro
    self
  end

  def vende livro
    @livros.delete livro
    @vendas << livro
  end

  def maxino_necessario
    @livros.maxino_necessario
  end
end
require_relative "contador"

class Estoque
  def initialize
    @livros = []
    @vendas = []
    @livros.extend Contador
  end

  def method_missing name
    matcher = name.to_s.match "(.+)_que_mais_vendeu_por_(.+)"
    if matcher
      tipo = matcher[1]
      campo = matcher[2].to_sym
      que_mais_vendeu_por tipo, &campo
    else
      super
    end
  end

  def respond_to? name
    name.to_s.match("(.+)_que_mais_vendeu_por_(.+)") || super
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

  private
  def que_mais_vendeu_por tipo, &campo
    @vendas.select {|l| l.tipo == tipo }
    .sort { |v1, v2|
      quantidade_de_vendas_de_um(v1, &campo) <=> quantidade_de_vendas_de_um(v2, &campo)
    }.last
  end

  def quantidade_de_vendas_de_um produto, &campo
    @vendas.count { |venda| campo.call(venda) ==  campo.call(produto) }
  end

end
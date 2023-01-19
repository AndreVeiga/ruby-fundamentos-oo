module Contador
  attr_reader :maxino_necessario

  def <<(livro)
    push(livro)
    if @maxino_necessario.nil? || @maxino_necessario < size
      @maxino_necessario = size
    end
    self
  end
end

class Livro
  attr_reader :titulo, :preco, :ano_lancamento, :reimpressao

  def initialize titulo, preco, ano_lancamento, reimpressao
    @titulo = titulo
    @ano_lancamento = ano_lancamento
    @reimpressao = reimpressao
    @preco = calcula_preco(preco)
    
  end

  def to_csv
    "#{@titulo} - #{@ano_lancamento} - #{@reimpressao}"
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

class Estoque
  def initialize
    @livros = []
    @livros.extend Contador
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

  def remove livro
    @livros.delete livro
  end

  def maxino_necessario
    @livros.maxino_necessario
  end
end

livro_ruby = Livro.new "Ruby", 100, 2005, true
livro_java = Livro.new "Java", 100, 1990, false
livro_php = Livro.new "PHP", 100, 2010, true
livro_node = Livro.new "Node", 100, 2012, true

estoque = Estoque.new

estoque << livro_ruby
estoque << livro_java 
estoque << livro_php 
estoque << livro_node

estoque.exporta_csv

estoque.remove livro_java

puts estoque.maxino_necessario

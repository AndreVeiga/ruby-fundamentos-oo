# Construtores
# Metodos privados
# attr_reader, attr_accessor, attr_writer
# @ para acessar váriaveis

class Livro
  attr_reader :titulo, :preco, :ano_lancamento

  def initialize titulo, preco, ano_lancamento
    @titulo = titulo
    @ano_lancamento = ano_lancamento
    @preco = calcula_preco(preco)
    
  end

  private 
  def calcula_preco base
    return base *= 0.7 if @ano_lancamento < 2000
    base
  end
end

livro_ruby = Livro.new "Ruby", 99, 1990

puts livro_ruby.titulo
puts livro_ruby.preco
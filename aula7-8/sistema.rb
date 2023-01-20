require_relative "livro"
require_relative "revista"
require_relative "ebook"

require_relative "estoque"


ruby = Livro.new "Ruby", 100, 2005, true, "Casa do Código"
java = Livro.new "Java", 100, 1990, false, "Casa do Código"
php = Livro.new "PHP", 100, 2010, true, "Casa do Código"
node = Livro.new "Node", 100, 2012, true, "Casa do Código"

crescer = Revista.new "Crescer", 50, 2017, "Casa do Educador", 1, false
nascer = Revista.new "Nascer", 50, 2017, "Casa do Educador", 2, false
viver = Revista.new "Viver", 50, 2017, "Casa do Educador", 3, true
evoluir = Revista.new "Evoluir", 50, 2017, "Casa do Educador", 4, false

python = Ebook.new "Python", 39.9, 2010, "Casa do Código"

estoque = Estoque.new

estoque << ruby << java << php << node
estoque << crescer << nascer << viver << evoluir
estoque << python
 
estoque.vende java
estoque.vende ruby
estoque.vende ruby

estoque.vende crescer
estoque.vende crescer
estoque.vende nascer
estoque.vende viver

livro_mais_vendido = estoque.livro_que_mais_vendeu_por_titulo

puts livro_mais_vendido.titulo

revista_mais_vendida = estoque.revista_que_mais_vendeu_por_ano_lancamento

puts revista_mais_vendida.titulo

puts "O produto possui reimpressao: #{revista_mais_vendida.possui_reimpressao?}"
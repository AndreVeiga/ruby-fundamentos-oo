require_relative "livro"
require_relative "estoque"


livro_ruby = Livro.new "Ruby", 100, 2005, true, "Casa do Código", "livro"
livro_java = Livro.new "Java", 100, 1990, false, "Casa do Código", "livro"
livro_php = Livro.new "PHP", 100, 2010, true, "Casa do Código", "livro"
livro_node = Livro.new "Node", 100, 2012, true, "Casa do Código", "livro"

revista_crescer = Livro.new "Crescer", 50, 2017, false, "Casa do Educador", "revista"
revista_nascer = Livro.new "Nascer", 50, 2017, false, "Casa do Educador", "revista"
revista_viver = Livro.new "Viver", 50, 2017, false, "Casa do Educador", "revista"
revista_evoluir = Livro.new "Evoluir", 50, 2017, false, "Casa do Educador", "revista"

estoque = Estoque.new

estoque << livro_ruby << livro_java << livro_php << livro_node
estoque << revista_crescer << revista_nascer << revista_viver << revista_evoluir
 
estoque.vende livro_java
estoque.vende livro_ruby
estoque.vende livro_ruby

estoque.vende revista_crescer
estoque.vende revista_crescer
estoque.vende revista_nascer
estoque.vende revista_viver

livro_mais_vendido = estoque.livro_que_mais_vendeu_por_titulo

puts livro_mais_vendido.titulo

revista_mais_vendida = estoque.revista_que_mais_vendeu_por_ano_lancamento

puts revista_mais_vendida.titulo
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
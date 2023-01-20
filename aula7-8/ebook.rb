require_relative "produto"

class Ebook < Produto
  def matches? query
    query == "ebook"
  end
end
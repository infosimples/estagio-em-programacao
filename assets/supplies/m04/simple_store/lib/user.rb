class User
  attr_reader :name, :cart
  def initialize(name)
    @name = name
    @cart = Cart.new
  end
end

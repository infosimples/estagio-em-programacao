class Cart

  attr_reader :items

  def initialize
    @items = []
  end

  def add(code, quantity)
    if (quantity = quantity.to_i) <= 0
      puts "\nQuantity must be > 0!".colorize(:red)
    elsif (product = Inventory.find_product(code)).nil?
      puts "\nProduct with code \"#{code}\" doesn't exist!".colorize(:red)
    else
      @items << { 'product' => product, 'quantity' => quantity }
      puts "\nProduct added!".colorize(:green)
    end
  end

  def print
    if @items.empty?
      puts "\nYour cart is empty! Try adding some products.".colorize(:yellow)
    else
      puts "\nYour cart has #{@items.size} item(s):"
      @items.each.with_index do |item, index|
        product = item['product']
        puts "#{index + 1}) #{item['quantity']} unit(s) - #{product.code} - #{product.title}"
      end
    end
  end

  def empty?
    @items.empty?
  end

  def total_amount
    total = 0
    @items.each do |item|
      product = item['product']
      discounted_price = if product.respond_to?(:discounted_price)
                           product.discounted_price
                         else
                           0
                         end

      subtotal = item['quantity'].to_i * discounted_price
      total += subtotal
    end
    total
  end

  def checkout(receipt_type)
    Kernel.print "Processing payment for your cart... "
    puts 'OK'.colorize(:green)
    puts "Here is your receipt: "

    receipt_printer = case receipt_type
                      when :simple then SimplePrinter.new(self)
                      when :full then FullPrinter.new(self)
                      else
                        fail "Unknown printer type: #{receipt_type}"
                      end

    puts receipt_printer.print
  end

end

class SimplePrinter < Printer

  def header
    "\nRECEIPT FOR YOUR PURCHASE AT INFO STORE\n"
  end

  def footer
    ""
  end

  def category_header(category)
    ""
  end

  def secondary_header
    <<-STR

DATE: #{Time.now.strftime('%d/%m/%Y')}

PURCHASED ITEMS:

Quantity - Code - Item - Unit Price
    STR
  end

  def list_header
    ""
  end

  def formatted_item(item)
    product = item['product']
    "#{item['quantity']} - #{product.code} - #{product.title} - #{product.price}\n"
  end

  def total_line
    "\nTotal: $ #{@cart.total_amount}\n\n"
  end

end

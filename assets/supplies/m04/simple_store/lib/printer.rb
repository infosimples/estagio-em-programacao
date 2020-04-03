class Printer

  if defined?(Product) &&
    defined?(DigitalProduct) &&
    defined?(FreshProduct) &&
    defined?(PhysicalProduct)

    CATEGORY_LABEL = {
      Product         => 'Other',
      DigitalProduct  => 'Digital items',
      FreshProduct    => 'Fresh items',
      PhysicalProduct => 'Physical items'
    }

  end

  def initialize(cart)
    @cart = cart
  end

  def print
    grouped_products = group_products

    receipt_str = ''
    receipt_str << divider.to_s
    receipt_str << header.to_s

    receipt_str << secondary_header.to_s

    grouped_products.each do |category, products|

      next if products.empty?

      receipt_str << category_header(category).to_s
      receipt_str << list_header.to_s

      products.each do |product|
        receipt_str << formatted_item(product).to_s
      end

    end

    receipt_str << total_line.to_s

    receipt_str << footer.to_s
    receipt_str << divider.to_s

    receipt_str
  end

  protected

  def group_products
    result = {}
    @cart.items.each do |item|
      result[item['product'].class] ||= []
      result[item['product'].class] << item
    end
    result
  end

  def date
    Time.now.strftime('%d/%m/%Y - %H:%M:%S')
  end

  def divider
    '-' * 80 << "\n"
  end

  def header
    "\n-- HEADER --\n"
  end

  def footer
    "\n-- FOOTER --\n"
  end

  def category_header(category)
    "\n-- CATEGORY_HEADER --\n"
  end

  def secondary_header
    "\n-- SECONDARY_HEADER --\n"
  end

  def list_header
    "\n-- LIST_HEADER --\n"
  end

  def formatted_item(product)
    "\n-- FORMATTED_ITEM --\n"
  end

  def total_line
    "\n-- TOTAL_LINE --\n"
  end

end

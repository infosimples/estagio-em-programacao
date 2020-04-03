require 'csv'

class Inventory
  def self.products
    @products ||= load_products
  end

  def self.load_products
    path = File.expand_path('../../products.csv', __FILE__)
    rows = CSV.read(path, headers: true)
    products = rows.map do |row|
      klass = Object.const_get(row['klass'])
      args = row.to_hash
      args.delete('klass')
      klass.new({
        'title'             => args['title'].to_s,
        'price'             => args['price'].to_f,
        'barcode'           => args['barcode'],
        'manufacturer_code' => args['manufacturer_code'].to_i,
        'expiration_date'   => args['expiration_date'].to_s,
        'url'               => args['url']
      })
    end
    products
  end

  def self.print_products
    puts 'Available products'
    products.each_with_index do |product, index|
      puts "#{index + 1}) #{product.code} | #{product.title} | #{product.price}"
    end
  end

  def self.find_product(code)
    products.find do |product|
      product.code == code
    end
  end

end

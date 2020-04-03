require 'byebug'
require 'colorize'
require 'csv'
require 'pry'
require 'time'

def putsc(str)
  puts(str.colorize(:blue))
end

def cli_option_1
  Inventory.print_products
end

def cli_option_2
  print "Type the product code: ".colorize(:blue)
  code = gets.chomp

  print "Type the desired quantity: "
  quantity = gets.chomp

  output = $user.cart.add(code, quantity)
end

def cli_option_3
  $user.cart.print
end

def cli_option_4
  # Checkout

  if $user.cart.empty?
    puts "\nOps! Your cart is empty.".colorize(:yellow)
  else
    puts 'You are about to pay for the following items: '
    $user.cart.print

    print "\nContinue ([y]/n)?  "
    answer = gets.chomp.downcase[0]

    if answer == 'n'
      puts 'Checkout aborted'.colorize(:yellow)
    else

      puts 'What kind of receipt would you like?'
      puts '1. Simple'
      puts '2. Full'
      print 'Type the option number ([1]): '

      answer = gets.chomp

      receipt_type = (answer == '2') ? :full : :simple

      $user.cart.checkout(receipt_type)
    end


  end


end

# Try to load source files.

files_pattern = File.expand_path('../lib/**/*.rb', __FILE__)

files = Dir[files_pattern].sort

if files.empty?
  puts "[error] Could not find Ruby source files. Aborting".colorize(:red)
  exit(1)
end

files.each do |file|
  print "Loading #{file}... "
  require(file)
  puts 'OK'.colorize(:green)
end

putsc ("\n" + '*' * 80)
putsc 'Welcome to Info Store, a buyer\'s best friend!'
print 'Please, enter your name: '.colorize(:blue)

user_name = gets.chomp
$user = User.new(user_name)

loop do

  cli_options = <<-OPTS

So, #{user_name}, what would you like to do now?
1. See list of available products
2. Add product to cart
3. See your cart
4. Proceed to checkout
5. Exit
OPTS

  putsc cli_options
  print 'Type the desired option number: '

  option = gets.chomp

  option = option.to_i

  case option
  when (1..4)
    send("cli_option_#{option}")
  when 5
    putsc "Bye then, see you next time!"
    exit 0
  else
    puts "\nOops! That\'s an invalid option!".colorize(:yellow)
    puts "Let\'s try again.".colorize(:yellow)
  end

end

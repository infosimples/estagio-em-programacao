#########################################
## Preencha todas as ocorrências de __ ##
#########################################


# Boolean (true/false)
#
def tipo_valor(condicao)
  if condicao
    'verdadeiro'
  else
    'falso'
  end
end
assert_equal 'verdadeiro', tipo_valor(true) # este exemplo já está preenchido
assert_equal __, tipo_valor(false)
assert_equal __, tipo_valor(nil)
assert_equal __, tipo_valor(1)
assert_equal __, tipo_valor(0)
assert_equal __, tipo_valor([])
assert_equal __, tipo_valor({})
assert_equal __, tipo_valor('Caracteres')
assert_equal __, tipo_valor('')


# String
#

# Concatenação
string = 'Ola, ' + 'Mundo'
assert_equal __, string

ola = 'Ola, '
mundo = 'Mundo'
string = ola + mundo
assert_equal __, ola
assert_equal __, mundo

ola = 'Ola, '
mundo = 'Mundo'
ola += mundo
assert_equal __, ola

# Quebra de linha
string = "\n"
assert_equal __, string.size

string = '\n'
assert_equal __, string.size

# Interpolação
valor = 123
string = "valor: #{valor}"
assert_equal __, string

valor = 123
string = 'valor: #{valor}'
assert_equal __, string

# Operação de "slice" em Strings
string = 'Arroz, Feijão e batata frita'
assert_equal __, string[7,3]
assert_equal __, string[7..9]
assert_equal __, string[1]

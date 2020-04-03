#########################################
## Preencha todas as ocorrências de __ ##
#########################################


# Operadores condicionais (if/else)
#

# Atribuição de valores com condições
if true
  resultado = 'valor_verdadeiro'
else
  resultado = 'valor_falso'
end
assert_equal __, resultado

resultado = 'valor_inicial'
if true
  resultado = 'valor_verdadeiro'
end
assert_equal __, resultado

resultado = 'valor_inicial'
if false
  resultado = 'valor_falso'
end
assert_equal __, resultado

# Uso de if com uma única linha de código
resultado = 'valor_inicial'
resultado = 'valor_verdadeiro' if true
assert_equal __, resultado

resultado = 'valor_inicial'
resultado = 'valor_falso' if false
assert_equal __, resultado


# Operadores de iteração
#

i = 1
resultado = 1
while i <= 10
  resultado = resultado * i
  i += 1
end
assert_equal __, resultado

# Uso de break
i = 1
resultado = 1
while true
  break if i > 10
  resultado = resultado * i
  i += 1
end
assert_equal __, resultado

# Uso de next
i = 1
resultado = 1
while i <= 10
  if (i % 2) == 0
    i += 1
    next
  end
  resultado = resultado * i
  i += 1
end
assert_equal __, resultado

# Uso do método #times
soma = 0
10.times do
  soma += 1
end
assert_equal __, soma

sum = 0
10.times do |i|
  sum += i
end
assert_equal __, sum

# Iterar pelos elementos de um Array
lista = [1, 2, 3]
soma = 0
lista.each do |elemento|
  soma += elemento
end
assert_equal __, soma

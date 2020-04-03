#########################################
## Preencha todas as ocorrências de __ ##
#########################################


# Array
#

# Atribuições a partir de Arrays
nome, sobrenome = ['Renato', 'Augusto']
assert_equal __, nome
assert_equal __, sobrenome

nome, sobrenome = ["Renato", "Augusto", "Brasil"]
assert_equal __, nome
assert_equal __, sobrenome

nome, sobrenome = ["Renato"]
assert_equal __, nome
assert_equal __, sobrenome

nome = "Renato"
sobrenome = "Augusto"
nome, sobrenome = sobrenome, nome
assert_equal __, nome
assert_equal __, sobrenome

# Criação de Arrays
lista_vazia = Array.new
assert_equal __, lista_vazia.size

# Acesso a elementos de Arrays
lista = ['leite', 'nescau', 'e', 'acucar']
assert_equal __, lista[0]
assert_equal __, lista.first
assert_equal __, lista[3]
assert_equal __, lista.last
assert_equal __, lista[-1]
assert_equal __, lista[-3]

# Operação de "slice" em um Array
lista = ['leite', 'nescau', 'e', 'acucar']
assert_equal __, lista[0,1]
assert_equal __, lista[0,2]
assert_equal __, lista[2,2]
assert_equal __, lista[2,20]
assert_equal __, lista[4,0]
assert_equal __, lista[4,100]
assert_equal __, lista[5,0]

# Operações de push e pop em um Array
lista = [1, 2]

lista.push('ultimo')
assert_equal __, lista

valor = lista.pop
assert_equal __, valor
assert_equal __, lista

# Operações de shift e unshift em um Array
lista = [1, 2]

lista.unshift('primeiro')
assert_equal __, lista

valor = lista.shift
assert_equal __, valor
assert_equal __, lista

# Iterar pelos elementos de um Array
lista = [1, 2, 3]
soma = 0
lista.each do |elemento|
  soma += elemento
end
assert_equal __, soma


# Hash
#

# Criação de Hashes
hash_vazio = Hash.new
assert_equal __, hash_vazio.size

hash = { 'um' => 1, 'dois' => 2 }
assert_equal __, hash.size
assert_equal __, hash['um']
assert_equal __, hash['dois']
assert_equal __, hash['inexistente']

# Modificação de um Hash
hash = { 'um' => 1, 'dois' => 2 }
hash['um'] = 'one'
assert_equal __, hash['um']

# Ordenação importa para um Hash?
hash1 = { 'um' => 1, 'dois' => 2 }
hash2 = { 'dois' => 2, 'um' => 1 }
assert_equal __, (hash1 == hash2)

#!/usr/bin/env ruby

# Carrega as bibliotecas (gems) usadas neste script.
require 'byebug'
require 'mysql2'
require 'pry'

class MySQLExercises1

  attr_reader :client

  def initialize
    @client = Mysql2::Client.new(
      host:     'localhost',
      database: 'ecommerce_sample',
      username: 'root'
    )
  end

  def q_about_query_method
    # O método `query` do objeto `@client`, criado no construtor acima, pode ser
    # usado para executar queries SQL no nosso banco de dados de exemplo.
    # Quando este método é chamado, ele retorna um objeto contendo diversas
    # informações sobre a query que foi executada, incluindo os resultados
    # da query.

    # Execute uma query qualquer usando o método `query` e responda: qual a
    # classe do objeto retornado por este método? Retorne esta classe.

    # Por exemplo, se o método retornasse uma String, você nem precisaria
    # alterar a linha abaixo.
    String
  end

  def q_how_many_tables
    # Quais são as tabelas que existem no DB (database) ecommerce_sample?
    # Retorne um Array contendo os nomes das tabelas como Strings.

    # Dica: experimente executar o comando `SHOW tables;` do MySQL.

    [ 'tabela1', 'tabela2', 'etc' ]
  end

  def q_title_data_type
    # Qual é o tipo completo (nome do tipo e tamanho máximo) da coluna `title`
    # da tabela `products`?
    # Retorne uma String com o nome do tipo.

    # Dica: experimente executar o comando `SHOW columns FROM products;` do MySQL.

    # Por exemplo, o tipo abaixo é o tipo comumente usado para colunas
    # que guardam números inteiros. "int" é o nome do tipo, e "11" é o tamanho
    # máximo permitido.
    'int(11)'
  end

  def q_categories_primary_key
    # Qual é a chave primária da tabela `categories`?
    # Retorne uma String com o nome da coluna correspondente.

    # Dica: execute "SHOW CREATE TABLE categories;" e localize
    # o parâmetro "PRIMARY KEY (...)"

    'nome_da_coluna_aqui'
  end

  def q_reviews_foreign_keys
    # A tabela "reviews" é usada para armazenar as avaliações que os usuários
    # fazem dos produtos. Por exemplo: se o usuário "Joãozinho" avaliou o
    # produto "Luva para bicicleta" com 5 estrelas, existe uma linha na tabela
    # que armazena essa informação.
    #
    # Portanto, na tabela "reviews", existem duas chaves estrangeiras: uma para
    # podermos localizar, na tabela "users", o usuário que fez a avaliação e outra
    # para podermos localizar, na tabela "products", o produto que foi avaliado.
    #
    # Sabendo disso, e lembrando da convenção para o nome das chaves estrangeiras
    # que foi usada na parte teórica, responda:
    #
    # Quais são as duas chaves estrangeiras da tabela "reviews"?
    #
    # Dica: execute "SHOW columns FROM reviews;" no MySQL.

    [ 'chave_estrangeira_1', 'chave_estrangeira_2']
  end


  def q_users_names_and_emails
    # A partir deste exercício, todos os exercícios fazem uma pergunta, marcada
    # com [PERGUNTA], e você deverá retornar uma string contendo uma query SQL
    # válida que, quando executada, responde à pergunta, isto é, retorna as
    # linhas e colunas desejadas.
    #
    # Você pode testar a sua query no MySQL e, quando o resultado
    # parecer correto, apenas copie e cole a query aqui.
    #
    # [PERGUNTA] Quais são os nomes e emails de todos os usuários?

    "SELECT ...... FROM users"
  end

  def q_users_names_and_visited_at
    # [PERGUNTA] Quais são os nomes e data da última visita de todos os
    # usuários que visitaram o site desde o início de 2016? O resultado deve vir
    # ordenado da data de visita mais recente para a mais antiga.
    #
    # DICA: Para realizar a comparação com uma data, use o seguinte
    # formato:
    #
    # WHERE column_name < '2010-12-30 20:15:15'

    # Esse código que começa com "<<-SQL" é apenas uma forma de construir uma
    # string que tem várias linhas em Ruby, conhecida como "here document".
    # A string acaba quando aparece o "SQL" final, na linha 121.
    # Mais informações: http://blog.jayfields.com/2006/12/ruby-multiline-strings-here-doc-or.html
    <<-SQL
      SELECT ..........
      FROM users
      WHERE visited_at .......
      ORDER BY ......
    SQL

  end

  def q_users_visits_this_year
    # [PERGUNTA] Quantos usuários visitaram o site desde o início de 2016?

    # Retorne uma única coluna chamada "num_users" com o número
    # desejado, como no exemplo abaixo:
    #
    # +-----------+
    # | num_users |
    # +-----------+
    # |        10 |
    # +-----------+

    <<-SQL
      SELECT ..........
      FROM users
      WHERE visited_at .......
    SQL
  end

  def q_products_count
    # [PERGUNTA] Quantos produtos existem?
    #
    # Formato da resposta:
    # +--------------+
    # | num_products |
    # +--------------+
    # |        12345 |
    # +--------------+

    <<-SQL
      SELECT ..........
    SQL
  end

  def q_products_conditions
    # A coluna `usage_status` da tabela `products` contém a condição de
    # uso do produto, por exemplo: "novo" ou "usado".
    #
    # [PERGUNTA] Quais os possíveis valores para a coluna `usage_status`, em
    # ordem alfabética?
    # Assuma que cada possível valor foi usado em pelo menos um produto, ou
    # seja, todos os possíveis valores aparecem nesta coluna 1 ou mais vezes.
    #
    # Formato da resposta:
    # +--------------+
    # | usage_status |
    # +--------------+
    # | novo         |
    # | nunca-usado  |
    # | super-novo   |
    # +--------------+

    <<-SQL
      SELECT ..........
    SQL
  end

  def q_products_for_sale
    # Na tabela `products`, a coluna `price` guarda o preço atual do produto e
    # a coluna `original_price` guarda o preço original, sem desconto. Por exemplo:
    # se um produto custa R$ 400 mas está em promoção por R$ 300, os valores das
    # colunas seriam price=300 e original_price=400.
    #
    # [PERGUNTA] Quantos produtos estão em promoção?
    #
    # DICA: em uma query, você pode realizar comparações entre duas colunas. Por
    # exemplo, se você quisesse encontrar todos os produtos cujas descrições não são
    # iguais ao seu próprio título:
    #
    # .... WHERE title != description
    #
    # Formato da resposta:
    # +--------------+
    # | num_for_sale |
    # +--------------+
    # |          999 |
    # +--------------+

    <<-SQL
      SELECT ..........
    SQL
  end

  def q_products_discounts
    # Na cláusula SELECT, além de especificar as colunas que queremos que sejam
    # incluídas no resultado, é possível "criar" novas colunas, que não existem
    # na tabela original, formadas a partir de alguma transformação/combinação
    # de colunas que existem.
    #
    # Por exemplo, a query abaixo retorna, a partir da tabela `products`, 3 colunas:
    # - id: id do produto
    # - original_price: preço do produto sem desconto
    # - half_price: preço do produto com 50% de desconto. Essa coluna não existe
    #               na tabela, mas foi construída a partir da aplicação de uma
    #               expressão matemática na coluna `original_price`.
    #
    # SELECT id,
    #        original_price,
    #        (original_price * 0.5) AS half_price
    # FROM products;
    #
    # [PERGUNTA] Sabendo disso, construa uma query que retorne, para cada produto, a
    # porcentagem de desconto atualmente aplicada ao produto. O resultado deve
    # ser como abaixo:
    #
    # +----+----------------+----------+
    # | id | original_price | discount |
    # +----+----------------+----------+
    # |  1 |            299 |   0.7324 |
    # |  2 |            299 |   0.7324 |
    # |  3 |            349 |   0.9427 |
    # +----+----------------+----------+

    <<-SQL
      SELECT ..........
    SQL
  end

  def q_products_for_sale_half_price
    # [PERGUNTA] Quais são os produtos que estão com desconto de mais que 50%?
    #
    # A query deve retornar um resultado com o seguinte formato, com as linhas
    # ordenadas do maior desconto para o menor:
    #
    # DICA: para aplicar uma restrição em uma coluna que não existe na tabela,
    # como é o caso da coluna "discount", é necessário usar o HAVING ao invés
    # do WHERE, como temos feito quando usamos GROUP BY.
    #
    # +--------+----------------+----------+
    # | id     | original_price | discount |
    # +--------+----------------+----------+
    # |  65489 |             33 |   0.9999 |
    # |    ... |            ... |      ... |
    # |    ... |            ... |      ... |
    # |     22 |           4500 |   0.5001 |
    # +--------+----------------+----------+

    <<-SQL
      SELECT ............
    SQL
  end

  def q_sales_count
    # [PERGUNTA] Quantas vendas existem (tabela `sales`)?
    # Retornar o resultado em uma coluna chamada "num_sales".

    <<-SQL
      SELECT ............
    SQL
  end

  def q_sales_average_amount
    # [PERGUNTA] Qual o valor médio das vendas? Para calcular este valor, você
    # pode usar alguma função de agregação do MySQL, como o COUNT, que
    # você já conhece.
    #
    # Uma lista das funções disponíveis está aqui:
    # http://dev.mysql.com/doc/refman/5.7/en/group-by-functions.html
    #
    # Formato da resposta:
    # +-------------+
    # | average_amt |
    # +-------------+
    # |   111.11111 |
    # +-------------+

    <<-SQL
      SELECT ............
    SQL
  end

  def q_sales_popular_payment_methods
    # [PERGUNTA] Qual a forma de pagamento mais popular entre os compradores?
    # A forma de pagamento de cada compra fica registrada na coluna
    # `payment_method` da tabela `sales`.
    #
    # A ideia é agrupar as vendas pelo método de pagamento e listar
    # estes métodos de pagamento pelo número de vezes que eles já
    # foram usados.
    #
    # Elabore esta query, que deverá retornar cada método de pagamento
    # com seu respectivo número de ocorrências, ordenado do mais
    # popular para o menos popular. O resultado deve ser parecido com:
    #
    # +----------------+-------+
    # | payment_method | count |
    # +----------------+-------+
    # | DOC/TED        |   999 |
    # | Dinheiro       |   111 |
    # | ...            |   ... |
    # | ...            |   ... |
    # | PayPal         |     0 |
    # +----------------+-------+

    <<-SQL
      SELECT ............
    SQL
  end

  def q_sales_count_for_product
    # [PERGUNTA] Quantas vezes o produto "Mochila Puma Training" já foi vendido?
    # Construa uma query que retorna duas colunas:
    # - `title`: o título do produto em que estamos interessados.
    # - `sale_id`: o id de cada venda em que o produto foi vendido.
    #
    # A ideia aqui é fazer um JOIN entre as tabelas `products` e `sales_products`
    # e filtrar o resultado pelo título do produto que estamos buscando.
    #
    # O resultado deverá ser algo como:
    #
    # +-----------------------+---------+
    # | title                 | sale_id |
    # +-----------------------+---------+
    # | Mochila Puma Training |      25 |
    # | Mochila Puma Training |     ... |
    # | Mochila Puma Training |     ... |
    # | Mochila Puma Training |     ... |
    # | Mochila Puma Training |      84 |
    # +-----------------------+---------+

    <<-SQL
      SELECT .....
      FROM   .....
      JOIN   ..... ON .....
      WHERE  .....
    SQL
  end

  def q_products_by_popularity

    # [PERGUNTA] Quais os produtos mais populares, i.e, os mais vendidos?
    #
    # Para responder, precisaremos consultar as tabelas:
    # -`sales_products`: contém uma linha para cada vez que o produto foi vendido.
    # -`products`: contém os dados do produto que foi vendido
    #
    # Ao final, queremos obter uma lista com os ids e títulos dos produtos e o número
    # de vezes que ele já foi vendido, ordenados dos mais vendidos para os menos
    # vendidos e, em caso de empate, ordenar pelo título em ordem alfabética e,
    # em case de empate novamente, pelo id em ordem crescente.
    #
    # Exemplo:
    #
    # +-----------+-----------------------+-----------+
    # | id        | title                 | num_sales |
    # +-----------+-----------------------+-----------+
    # |         1 | Boné                  |        10 |
    # |         2 | Camiseta              |        10 |
    # |         3 | Mochila               |         8 |
    # |         4 | Camisa                |         2 |
    # +-----------+-----------------------+-----------+

    <<-SQL
      SELECT    .....
      FROM      .....
      JOIN      ..... ON .....
      GROUP BY  .....
      ORDER BY  .....
    SQL
  end

  def q_products_without_category
    # A coluna `category_id`, da tabela `products`, contém o id da categoria
    # a que o produto pertence. Por exemplo: o produto 'Minecraft Xbox 360'
    # pertence à categoria 'Jogos', cujo id é 1248.
    #
    # [PERGUNTA] Quantos produtos não pertencem a nenhuma categoria?
    #
    # Formato da resposta:
    # +---------------+
    # | uncategorized |
    # +---------------+
    # |          2048 |
    # +---------------+

    <<-SQL
      SELECT .....
    SQL
  end

end

#!/usr/bin/env ruby

# Carrega as bibliotecas (gems) usadas no script.
require 'byebug'
require 'mysql2'
require 'pry'

class MySQLExercises2

  attr_reader :client

  def initialize
    @client = Mysql2::Client.new(
      host:     'localhost',
      database: 'ecommerce_sample',
      username: 'root'
    )
  end

  def q_categories_with_parent
    # O nosso e-commerce trabalha com o conceito de categoria e sub-categoria.
    # Por exemplo: a categoria "Roupas pra Surfar" é uma sub-categoria da
    # categoria "Surf". Toda sub-categoria tem uma categoria-pai, e portanto,
    # toda sub-categoria tem um valor não-nulo na coluna `parent_category_id`.
    #
    # [PERGUNTA] Quais são os nomes de todas as sub-categorias, juntamente com
    # o nome da sua categoria-pai? Ordenar o resultado pelo nome da categoria-pai
    # e, em caso de empate, pelo nome da categoria-filha.
    #
    # Dica: faça um JOIN da tabela `categories` com ela mesma!
    #
    # Formato da resposta:
    # +-------------------------+------------------------+
    # | parent_name             | category_name          |
    # +-------------------------+------------------------+
    # | Artes Marciais          | Luvas                  |
    # | Artes Marciais          | Kimonos                |
    # | ...                     | ....                   |
    # | ...                     | ....                   |
    # | Tennis e Squash         | Antivibradores         |
    # | Tennis e Squash         | Grip e Overgrip        |
    # +-------------------------+------------------------+

    <<-SQL
      SELECT .....
    SQL
  end

  def q_avg_stars_per_user
    # Usuários podem fazer avaliação dos produtos, fornecendo um número de
    # estrelas (0 a 5) e uma avaliação em texto para um produto. Estas avaliações
    # ficam armazenadas na tabela `reviews`.
    #
    # [PERGUNTA] Quais são os usuários mais 'bonzinhos', isto é, usuários para
    # os quais a média de estrelas que ele/ela dá é maior que 4?
    #
    # Retornar id, nome e média de estrelas para cada usuário com média > 4,
    # conforme exemplo abaixo.
    #
    # O resultado deve vir ordenado em ordem decrescente de avg_stars e, em
    # caso de empate, em ordem crescente de nome.
    #
    # +------+----------------------------+-----------+
    # | id   | name                       | avg_stars |
    # +------+----------------------------+-----------+
    # | 1987 | Eduarda Enzo Soares        |    4.1667 |
    # | 1224 | Helena Lopes               |    4.1667 |
    # | 1660 | Yasmin Paes Paiva          |    4.1538 |
    # +------+----------------------------+-----------+

    <<-SQL
      SELECT .....
    SQL
  end

  def q_buyers_that_are_also_sellers

    # [PERGUNTA] Quantos vendedores também já foram compradores? Em outras
    # palavras: quais valores de sales.seller_id também aparecem como valores
    # na coluna sales.buyer_id? Retorne os ids em uma coluna chamada
    # "buyer_seller_id", ordenada em ordem crescente, como abaixo:
    #
    # +-----------------+
    # | buyer_seller_id |
    # +-----------------+
    # |            1113 |
    # |            1114 |
    # |             ... |
    # |               9 |
    # +-----------------+

    <<-SQL
      SELECT .....
    SQL
  end

  def q_recently_sold_products_categories
    #
    # [PERGUNTA] Quais são as categorias (id e nome) de todos os produtos
    # vendidos em vendas com payment_method='Dinheiro'? Retorne um resultado
    # ordenado pelo nome da categoria, como abaixo:
    #
    # +------+-----------------------------------+
    # | id   | name                              |
    # +------+-----------------------------------+
    # | NULL | NULL                              |
    # | 1300 | Acessório                         |
    # | 1270 | Agasalhos                         |
    # | .... | ......                            |
    # | 1309 | Viseiras                          |
    # | 1373 | Waxy Maize                        |
    # | 1291 | Yoga e Pilates                    |
    # +------+-----------------------------------+
    #
    # Dica 1: lembre-se de que a categoria de um produto pode ser nula! JOINs com
    # em que as colunas podem ser nulas normalmente geram respostas inesperadas.
    # Lembre-se dos OUTER JOINs.
    #
    # Dica 2: não tente montar a query de uma única vez. Vá montando aos poucos
    # e sempre executando no MySQL para ver o que está acontecendo.

    <<-SQL
      SELECT .....
    SQL
  end

end

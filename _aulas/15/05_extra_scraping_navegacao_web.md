---
layout: conteudo_geral
modulo: 15
numero: 5
nome: "Scraping - Navegação Web"
title: "15.5 [Extra] Scraping | Estágio em Programação"
description: "Aprenda sobre Scraping do curso online
  gratuito Estágio em Programação."
---

Uma importante atividade desempenhada por um scraper é a navegação web.
A navegação consiste em abrir diferentes páginas de um site com o objetivo de
coletar dados ou executar consultas.

Para alguns sites, a navegação pode ser realizada utilizando a biblioteca
Net::HTTP. Com ela, um fluxo de execução do scraper poderia ser: abrir uma URL,
coletar links relevantes nesta URL e abrir estes links. Para muitos sites, este
fluxo é comum (pense, por exemplo, na navegação pelas categorias de um site de
uma loja online).

Para alguns sites, esse fluxo só pode ser executado se a sessão do usuário for
mantida durante as requisições. As técnicas mais comuns para reconhecer a sessão
do usuário são: leitura de cookies ou passagem de identificador de sessão na URL.
Para o primeiro caso, o cliente HTTP da sua linguagem deve implementar
gerenciamento de cookies.

É possível gerenciar cookies utilizando a Net::HTTP, mas esta seria uma tarefa
muito trabalhosa. Quando ela é necessária, é recomendado utilizar alguma
biblioteca que implementa este gerenciamento e outras funcionalidades
encontradas em um navegador. Este é o caso da biblioteca Mechanize.

Mechanize é uma biblioteca em ruby bastante usada quando é necessário o
gerenciamento automático de cookies, mantém salvo os sites que visitou em um
histórico e preenche formulários.

Para instalar o Mechanize, basta executar o seguinte comando no terminal:

```
  gem install mechanize
```

Abaixo são apresentados dois exemplos didáticos. O primeiro é a tentativa de
implementar navegação em um site que armazena sessão, porém sem gerenciar
cookies. O segundo é esta tentativa implementada com o Mechanize, que realiza
gerenciamento de cookies automaticamente.

**Navegação sem gerenciamento de cookies**

```ruby
  require 'net/http'

  # Add a product to the shopping cart
  uri = URI.parse 'https://www.goldentoys.com.br/carrinho/produto/9742497/adicionar'
  Net::HTTP.get(uri)

  # Open the shopping cart
  uri  = URI.parse 'https://www.goldentoys.com.br/carrinho/index'
  body = Net::HTTP.get(uri)

  # Write output to html file
  File.open('cart-no-cookies.html', 'w') { |f| f.write(body) }
```

**Navegação com gerenciamento de cookies**

```ruby
require 'mechanize'

# Create a new Mechanize user agent (it's like a web browser instance)
agent = Mechanize.new

# Add a product to the shopping cart
agent.get 'https://www.goldentoys.com.br/carrinho/produto/9742497/adicionar'

# Open the shopping cart

agent.get 'https://www.goldentoys.com.br/carrinho/index'

# Write output to html file
File.open('cart-with-cookies.html', 'w') { |f| f.write(agent.page.body) }
```

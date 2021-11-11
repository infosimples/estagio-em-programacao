---
layout: exercicio
modulo: 15
numero: 9
nome: "Exercício M15-E03"
title: "15.09 [Extra] Scraping | Estágio em Programação"
description: "Aprenda sobre Scraping do curso online
  gratuito Estágio em Programação."
---

## Scrapers dependentes de sessão

O próximo tipo de scraper é aquele que depende da sessão do agente, isto é, o
agente precisa armazenar os cookies enviados pelo servidor e trocar esses
cookies com o servidor a cada requisição.

Normalmente, se uma das etapas da extração envolve fazer login em um site,
este é um indicativo de que será necessário manter uma sessão. Contudo, existem
outros casos em que não é necessário fazer login, mas é necessário manter uma
sessão. Um destes casos é o gerenciamento de carrinhos em sites de compras que
permitem adicionar produtos ao carrinho sem estar logado.

Por padrão, o Mechanize automaticamente já realiza o gerenciamento dos cookies
e os envia para o servidor a cada requisição.

### Exemplo

Um exemplo deste tipo de scraper é um programa que adiciona produtos ao
carrinho de compras e depois imprime o valor total do carrinho. Veja um
exemplo no código abaixo:

```ruby
  require 'mechanize'

  # Create a Mechanize browser
  agent = Mechanize.new

  # Open an online store
  agent.get 'http://www.meugameusado.com.br/'

  # Take 3 products URLs
  products_urls = []
  agent.page.parser.css('a.nome-produto')[0,3].each do |link|
    products_urls << link.attr(:href)
  end

  # Add each product to the shopping cart
  products_urls.each do |url|
    agent.get url
    add_item_url = agent.page.parser.css('a.botao-comprar').first.attr(:href)
    agent.get add_item_url # opening this URL will add the product to the cart
  end

  # Open shopping cart
  agent.get 'https://www.meugameusado.com.br/carrinho/index'

  # Print the shopping cart's value
  puts agent.page.parser.css('strong.valor-total').first.text
```

Analise o código deste exemplo e tente reproduzi-lo passo-a-passo no console
(IRB), para ver como ele funciona, conhecer melhor os métodos que foram usados
e qual é a lógica que foi implementada.

O que aconteceria se adicionássemos um item ao carrinho usando um agente do
Mechanize e, depois, para adicionar o segundo item, criássemos um novo agente
do Mechanize? Faça testes com o IRB para ver se você acertou!

### Exercício

Crie um scraper que faz login no Twitter e imprime os tweets mais recentes da
timeline do usuário.

---
layout: exercicio
modulo: 15
numero: 8
nome: "Exercício M15-E02"
title: "15.08 [Extra] Scraping | Estágio em Programação"
description: "Aprenda sobre Scraping do curso online
  gratuito Estágio em Programação."
---

## Scraper que interagem com formulários

O segundo tipo de scraper, um pouco mais complexo do que o anterior,
é aquele que interage com o site através do preenchimento e envio de formulários.
Isso pode acontecer, por exemplo, quando houver a necessidade de preencher
formulários de pesquisa, de cadastro ou de login. Geralmente, o envio de dados
na internet é feito através de requisições POST.

### Exemplo

Um exemplo deste tipo de scraper é um programa que busca produtos no Ebay usando
a interface Web. Veja um exemplo no código abaixo:

```ruby
  require 'mechanize'

  term = 'Macbook'

  # Create a Mechanize browser
  agent = Mechanize.new

  # Open the Ebay advanced search form
  agent.get 'https://www.ebay.com/sch/ebayadvsearch'

  # Access the form
  form = agent.page.forms.first

  # You can also access the form from some attributes, like id and name
  # <form id="example-html-id"> could be accessed with the following code:
  # form = agent.page.form_with(id: 'example-html-id')

  form['_nkw'] = term

  # Submit the form
  form.submit

  doc = agent.page.parser

  # Print products
  doc.css('li.s-item').each do |product|
    name  = product.css('.s-item__title').text.gsub(/\s+/, ' ').strip
    price = product.css('.s-item__price').text.gsub(/\s+/, ' ').strip
    puts "#{name}: #{price}"
  end
```

Analise o código deste exemplo e tente reproduzi-lo passo-a-passo no
console (IRB), para ver como ele funciona, conhecer melhor os métodos que foram
usados e qual é a lógica que foi implementada.

### Exercício

Crie um scraper que imprime os títulos e endereços URL da busca “Brasil” no
site do Google:

<https://www.google.com.br/advanced_search>

Busque apenas por documentos pdf, em português.

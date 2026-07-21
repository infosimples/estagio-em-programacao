---
layout: conteudo_geral
modulo: 15
numero: 6
nome: "Scraping - Parsing"
title: "15.6 [Extra] Scraping | Estágio em Programação"
description: "Aprenda sobre Scraping do curso online
  gratuito Estágio em Programação."
---

A tarefa de processar um HTML em busca de certos conteúdos é difícil de se
executar utilizando apenas funções básicas de processamento de texto como
buscas de palavras, substituições ou loops de leitura de caracteres.

Dois recursos são muito importantes no parsing de documentos HTML:
**seletores CSS** e **expressões regulares**.

### Seletor CSS

Para fazer parsing de HTML utilizando seletores CSS, utiliza-se um parser para
Ruby chamado Nokogiri. Sua instalação pode ser realizada com o seguinte comando:

```
  gem install nokogiri
```

Veja no exemplo abaixo como seria o uso de seletores CSS usando o Nokogiri:

```ruby
  require 'net/http'
  require 'nokogiri'

  # Baixa a página de um produto (usamos o books.toscrape.com, um site feito
  # justamente para praticar scraping)
  url = 'https://books.toscrape.com/catalogue/a-light-in-the-attic_1000/index.html'
  body = Net::HTTP.get(URI.parse(url))

  # Faz o parsing do html com o Nokogiri
  doc = Nokogiri::HTML(body)

  # Imprime o preço do produto usando um seletor CSS
  puts doc.css('p.price_color').first.text
```

### Expressões regulares (regex)

Expressões regulares são úteis para extrair conteúdos que seguem um certo
padrão em um texto.

Ferramenta online para testar expressão regular em Ruby:
[rubular](https://rubular.com/).

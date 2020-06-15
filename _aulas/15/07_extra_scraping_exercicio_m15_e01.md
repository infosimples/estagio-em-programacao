---
layout: conteudo_geral
modulo: 15
numero: 07
nome: "Exercício M15-E01"
title: "15.07 [Extra] Scraping | Estágio em Programação"
description: "Aprenda sobre Scraping do curso online
  gratuito Estágio em Programação."
---

## Scraper sem interação

O tipo mais simples de scraper é aquele que extrai informações de páginas da internet sem precisar realizar nenhum tipo de interação com o site. Isto é, o scraper não preenche e envia formulários, apenas realiza requisições GET para fazer o download do conteúdo de páginas web (estáticas ou dinâmicas) e, posteriormente, analisa o conteúdo destas páginas em busca das informações que precisam ser extraídas.

Assim, a sequência de passos que é executada por um scraper deste tipo normalmente é muito simples, da seguinte forma:

  1. Abrir e baixar a página que possui o conteúdo;
  2. Extrair informações da página.

### Exemplo

Um exemplo deste tipo de scraper é um programa que imprime as manchetes da página inicial de algum site de notícia. Como no código abaixo:

```ruby
  require 'mechanize'

  # Create a Mechanize browser
  agent = Mechanize.new

  # Open a news site
  agent.get 'http://g1.globo.com/ultimas-noticias.html'

  # Mechanize uses Nokogiri internally and we can have access to its instance
  doc = agent.page.parser

  # Print headlines
  doc.css('.feed-post-body-title').each do |element|
    puts element.text # headline
  end
```

Analise o código deste exemplo e tente reproduzi-lo passo-a-passo no console (IRB), para ver como ele funciona, conhecer melhor os métodos que foram usados e qual é a lógica que foi implementada.

### Exercício

Crie um scraper que imprime as manchetes mais recentes do UOL! (<http://noticias.uol.com.br/ultimas/>).
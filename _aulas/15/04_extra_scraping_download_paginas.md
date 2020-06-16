---
layout: conteudo_geral
modulo: 15
numero: 4
nome: "Scraping - Download de páginas"
title: "15.4 [Extra] Scraping | Estágio em Programação"
description: "Aprenda sobre Scraping do curso online
  gratuito Estágio em Programação."
---

Para qualquer scraper, é fundamental a habilidade de realizar download de
páginas web da internet. Os "downloads" de páginas, documentos, imagens ou
qualquer tipo de arquivo que realizamos frequentemente na internet são simples
requisições HTTP; por isso, é importante conhecer os principais métodos de
requisição definidos no protocolo HTTP.

### GET

O método GET é usado para recuperar qualquer informação referenciadapor uma URL.

### POST

O método POST é usado para enviar um conjunto de dados para um serviço
especificado por uma URL e recuperar a informação resultante do processamento
desses dados.

### HEAD

O método HEAD é idêntico ao GET, mas o servidor não retorna o conteúdo do
corpo da página referenciada pela URL requisitada. Este método é utilizado,
principalmente, para recuperar metainformações presentes no header da resposta
da requisição HTTP.

### Exemplo com NET::HTTP

Para ilustrar o download de conteúdo da Internet, utilizaremos a biblioteca
Net::HTTP para a linguagem de programação Ruby. Ela oferece os métodos GET,POST
e HEAD apresentados acima.

Execute o código abaixo no interpretador interativo de Ruby:

```ruby
  require 'net/http'

  #
  # GET
  #

  uri  = URI.parse('http://www.google.com.br/')
  body = Net::HTTP.get(uri)

  # write the output to a file
  File.open('get.html', 'w') { |f| f.write(body) }


  #
  # POST
  #

  # you should use developer tools to sniff the traffic that is being transferred
  # through your browser.
  uri = URI.parse('http://www.buscacep.correios.com.br/sistemas/buscacep/resultadoBuscaCepEndereco.cfm')

  data = {
    'relaxation'          => '05050000',
    'tipoCEP'       => 'ALL',
    'semelhante'       => 'N',
  }

  response  = Net::HTTP.post_form(uri, data)
  body = response.body

  # write the output to a file
  File.open('post.html', 'w') { |f| f.write(body) }


  #
  # HEAD
  #

  uri = URI.parse('http://www.google.com/')
  response = Net::HTTP.start(uri.host, uri.port) do |http|
    http.head '/about/'
  end

  headers = response.each_header.map { |h, i| "#{h} = #{i}" }

  # write the output to a file
  File.open('head.html', 'w') do |f|
    f.write(headers.join("\n"))
  end
```

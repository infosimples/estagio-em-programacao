---
layout: exercicio
modulo: 15
numero: 10
nome: "Exercício M15-E04"
title: "15.10 [Extra] Scraping | Estágio em Programação"
description: "Aprenda sobre Scraping do curso online
  gratuito Estágio em Programação."
---

## Scrapers que utilizam APIs

Muitas vezes, é necessário extrair alguma informação de algum site que já
disponibiliza estas informações através de alguma API.

Por exemplo, digamos que o problema seja obter a distância entre duas
localidades utilizando o Google Maps. O aplicativo web do Google Maps
(<https://www.google.com.br/maps>) é bastante carregado de JavaScript, o que
torna bastante complicado escrever um scraper para realizar esta tarefa.

Felizmente, o Google disponibiliza a
[API do Google Maps](https://developers.google.com/maps/), que contém diversos
[web services](https://developers.google.com/maps/web-services/overview),
sendo que um deles permite exatamente esse tipo de pesquisa.

### Exemplo

Muitas vezes, é necessário extrair alguma informação de algum site que já
disponibiliza estas informações através de alguma API.

Como exemplo, foi construído um programa que retorna a latitude e longitude de
um determinado endereço (escrito por extenso). Por exemplo, o endereço
"Avenida Paulista, 807 - Bela Vista" será convertido para as coordenadas
[-23.5666085, -46.6508916]. Como exemplo o código abaixo:

```ruby
  require 'mechanize'
  require 'json'

  # Create a Mechanize browser
  agent = Mechanize.new

  # Access the Google Maps' Geolocation API
  args = {
    'address' => 'Avenida Paulista, 807 - Bela Vista'
  }
  agent.get 'http://maps.googleapis.com/maps/api/geocode/json', args

  # Convert JSON to Ruby Hash
  response = JSON.parse(agent.page.body)
  formatted_address = response['results'].first['formatted_address']
  coordinates       = response['results'].first['geometry']['location']

  # Print the address lat/lon
  puts "The address is #{formatted_address}"
  puts "The coordinates are: latitude -> #{coordinates['lat']}, longitude -> #{coordinates['lng']}\n\n"
```
A API do Google Maps, assim como muitas APIs atualmente, retorna os resultados
nos formatos XML ou JSON. Em Ruby, lidar com resultados no formato JSON é
muito simples. Por isso, o exemplo, que está no código acima foi desenvolvido
utilizando JSON.

Pesquise um pouco mais sobre JSON e veja a documentação da API para entender
como o programa funciona. Escreva um programa que utiliza essa API da forma
inversa: recebe um par de coordenadas e imprime o endereço encontrado.

### Exercício

Escreva um programa que utiliza a API de rotas do Google Maps
([Google Directions API](https://developers.google.com/maps/documentation/directions/)).
O seu programa deve receber como entrada dois endereços
(uma origem e um destino) e imprimir as distâncias e tempos das rotas retornadas.

Por exemplo, considere as seguintes entradas:

```ruby
  origin      = "Rua Suíça, São Paulo"
  destination = "Avenida Paulista, 800, São Paulo"
```

Pesquisando este trajeto no Google Maps, a aplicação web retorna três sugestões
de rotas, como destacado na imagem abaixo:

<img src="{{ '/assets/images/aulas/m15_e04_google_maps.png' | absolute_url }}" alt="Google Maps exemplo" style="width: 1230px;">

Portanto, neste exemplo, a saída do seu programa deve ser as informações de
distâncias e tempos relativas a essas três rotas:

```
  1) 4.8km - 12 mins
  2) 5.9km - 13 mins
  3) 4.9km - 14 mins
```

Mais especificações:

  1. A pesquisa deve considerar rotas de carro;
  2. A pesquisa deve ser feita utilizando JSON como formato de retorno.

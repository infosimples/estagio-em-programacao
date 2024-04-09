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

Foi construído um programa que retorna a latitude e longitude de um determinado local, a partir de um endereço de IP.
Por exemplo, o endereço de IP "8.8.8.8" (Google)

[37.751, -97.822]. Como exemplo o código abaixo:

```ruby
  require 'mechanize'
  require 'json'

  # Create a Mechanize browser
  agent = Mechanize.new

  # Access the GeoPlugin's Geolocation API
  args = {'ip' => '8.8.8.8'}
  agent.get 'http://www.geoplugin.net/json.gp', args

  # Convert JSON to Ruby Hash
  response = JSON.parse(agent.page.body)

  country   = response['geoplugin_countryName']
  latitude  = response['geoplugin_latitude']
  longitude = response['geoplugin_longitude']

  # Print the address lat/lon
  puts "The country is: #{country}"
  puts "The coordinates are:\nlatitude  -> #{latitude}\nlongitude -> #{longitude}\n\n"
```

A API do GeoPlugin, assim como muitas APIs atualmente, retorna os resultados
nos formatos XML ou JSON. Em Ruby, lidar com resultados no formato JSON é
muito simples. Por isso, o exemplo, que está no código acima foi desenvolvido
utilizando JSON.

Pesquise um pouco mais sobre JSON e veja a documentação da API para entender
como o programa funciona. Escreva um programa que utiliza essa API da forma
inversa: recebe um par de coordenadas e imprime o endereço encontrado.

### Exercício

Escreva um programa que utiliza a API de CEP do ([ViaCEP](https://viacep.com.br/)).
O seu programa deve receber como entrada um CEP com 8 dígitos no formato "00000000" e deve retornar uma string formatada com o logradouro, bairro, localidade e UF.

Por exemplo, considere a seguinte entrada:

```ruby
  cep = "01310930"
```

Pesquisando este CEP, o webservice retorna os dados abaixo:

```json
{
  "cep": "01310-930",
  "logradouro": "Avenida Paulista",
  "complemento": "2100",
  "bairro": "Bela Vista",
  "localidade": "São Paulo",
  "uf": "SP",
  "ibge": "3550308",
  "gia": "1004",
  "ddd": "11",
  "siafi": "7107"
}
```

Portanto, neste exemplo, a saída do seu programa deve ser a seguinte string:

```ruby
"Avenida Paulista, Bela Vista - São Paulo, SP"
```

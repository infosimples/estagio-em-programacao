---
layout: video
modulo: 7
numero: 6
nome: "Produtor/consumidor"
title: "7.6 Aula de Threads: Produtor/consumidor | Estágio em Programação"
description: "Conheça o Design Pattern (Padrão de Projeto) Produtor/Consumidor e
  como ele é útil em processamentos concorrentes."
youtube_id: "cIaiW393ur8"
---

### find_calling_codes.rb

```ruby
require 'net/http'

queue = Queue.new

class Producer
  def initialize(queue)
    @queue = queue
  end

  def run
    @queue.push('https://en.wikipedia.org/wiki/Brazil')
    @queue.push('https://en.wikipedia.org/wiki/Argentina')
    @queue.push('https://en.wikipedia.org/wiki/France')
    @queue.push('https://en.wikipedia.org/wiki/Italy')
    @queue.push('https://en.wikipedia.org/wiki/Japan')
    @queue.push('https://en.wikipedia.org/wiki/Mexico')
    @queue.push('https://en.wikipedia.org/wiki/Portugal')
    @queue.push('https://en.wikipedia.org/wiki/South_Africa')
    @queue.push('https://en.wikipedia.org/wiki/Spain')
    @queue.push('https://en.wikipedia.org/wiki/Venezuela')
    @queue.push('https://en.wikipedia.org/wiki/United_Kingdom')
    @queue.push('https://en.wikipedia.org/wiki/United_States')
    @queue.push('end')
  end
end

class Consumer
  def initialize(queue)
    @queue = queue
  end

  def run
    while (job = @queue.pop)
      if job == 'end'
        @queue.push('end')
        break
      end
      consume(job)
    end
  end

  def consume(job)
    body = Net::HTTP.get(URI(job))
    country = body.match(/<h1[^>]+>(.+)</)[1]
    calling_code = body.match(/Calling code[^+]+([0-9+]+)/)[1]
    puts "#{country}: #{calling_code}"
  end
end

threads = []
5.times do
  threads << Thread.new do
    Consumer.new(queue).run
  end
end

threads << Thread.new do
  Producer.new(queue).run
end

threads.each(&:join)
```

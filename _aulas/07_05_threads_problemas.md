---
layout: video
modulo: 7
numero: 5
nome: "Problemas com programação concorrente"
title: "7.5 Aula de Threads: Problemas com programação concorrente | Estágio em Programação"
description: "Conheça os problemas mais comuns com programação concorrente.
  Vamos apresentar e discutir o Jantar dos Filósofos."
youtube_id: "mY5gHYnDPlI"
---

### deadlock.rb

```ruby
queue = Queue.new # an empty queue with no jobs
Thread.new do
  job = queue.pop # it’ll never pop a job
  puts 'Job is finished'
end.join
```

### starvation.rb

```ruby
i = 10
threads = []
threads << Thread.new do
  while i == 10
    puts "waiting for \"i != 10\"..."
    sleep(1)
  end
  puts 'The thread can finish when "i != 10"'
end
sleep(5)
i = 5
threads.each(&:join)
```

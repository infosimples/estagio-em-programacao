---
layout: exercicio
modulo: 8
numero: 11
nome: "Exercício M08-E02"
title: "8.11 Aula de Frontend: Exercício M08-E02 | Estágio em Programação"
description: "Exercício M08-E02 de Frontend (HTML, CSS e JavaScript) do curso
  online gratuito Estágio em Programação."
---

## Objetivos

- Praticar conceitos de HTML, CSS e JavaScript através da alteração de uma página simples de cadastro de usuário.

## Configuração

1. Ao subir o container Docker do `ep`, exponha a porta `8000`, onde nosso servidor web vai rodar.

    ```bash
    docker run -it -p 8000:8000 -v ~/ep:/root/ep ep bash
    ```

2. Faça download e disponibilize o projeto web que será usado nos exercícios:


    ```bash
    mkdir -p ~/ep/exercicios/m8/

    curl https://infosimples.github.io/estagio-em-programacao/assets/supplies/m08/form.zip -o ~/ep/exercicios/m8/form.zip

    unzip ~/ep/exercicios/m8/form.zip -d ~/ep/exercicios/m8/

    rm ~/ep/exercicios/m8/form.zip
    ```

3. Inicie o servidor web:

    ```bash
    ruby -r webrick -e 'WEBrick::HTTPServer.new(:Port => 8000, :DocumentRoot => "~/ep/exercicios/m8").start'
    ```

    > Esse comando inicia um servidor web simples na porta 8000 que renderiza os conteúdos do
    > diretório `~/ep/exercicios/m8`.

4. Abra o site em seu navegador web.

    [http://localhost:8000/form.html](http://localhost:8000/form.html)

    > Recomendamos usar o **Google Chrome**, pois é o navegador que foi usado nos vídeos e no
    > desenvolvimento dos scripts de correção.


5. Abra o _Developer Tools_ clicando em uma área qualquer da página do formulário e, em seguida, na opção **Inspecionar** (ou **Inspect**, dependendo do idioma do seu navegador). Outra forma de abrir o _Developer Tools_ é usando o atalho `Ctrl + Shift + i` (Windows ou Linux) ou `Cmd + Shift + i` (Mac).

## Instruções

Ao longo dos exercícios descritos no próximo item, você precisará alterar os arquivos que recebeu (`form.html`, `form.css` e `form.js`) de acordo com o que o exercício pede que seja feito.

Sempre que você alterar algum destes arquivos, não se esqueça de reiniciar o servidor web.

**Atenção:** não modifique o arquivo **form-test.js**, pois ele é usado para a correção.

## Exercícios

### 1) Mudar a cor das mensagens de erro para vermelho

Se você não preencher nenhum campo do formulário e clicar no botão **Enviar**, verá que são exibidas diversas mensagens de erro (mensagens de validação). Elas estão em azul e, neste exercício, você deve alterar o CSS da página (arquivo `form.css`) para que as mensagens de erros de validação apareça em vermelho.

### 2) Deixar todos os `<p>` em negrito

Alterar o CSS para que todos os elementos de parágrafo (`<p>`) apareçam em
negrito. Um bom lugar para começar é consultando a lista de propriedades relacionadas a fontes, listadas
[aqui](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Fonts) (olhe a lista **Properties**).

### 3) Implementar a validação de data de nascimento

Atualmente, a única verificação associada ao campo `birthday` é a validação de
presença (isto é, o campo é considerado inválido se estiver em branco), mas também é necessário verificar se o valor informado pelo
usuário é válido.

O valor será considerado válido se for uma string que obedece ao formato
clássico `dd/mm/yyyy`. Por exemplo, `25/04/1979` é uma data válida. Já os valores `25-04-1979` ou `25041979` não são válidos e não deveriam ser aceitos pelo validador, que está escrito em JavaScript.

Para completar este exercício, veja a função `validateBirthday` do arquivo `form.js`.
Também é uma boa ideia olhar outros métodos que fazem validação e que já estão
implementados, para ter uma ideia de como implementar.

### 4) Implementar a validação de confirmação de senha

Atualmente, a única verificação associada ao campo `password-confirmation` é a validação de
presença, mas também é necessário verificar se o valor informado é igual ao valor
informado no campo `password`.

Para completar este item, veja a função `validatePasswordConfirmation` do arquivo `form.js`.

### 5) Exibir mensagem de confirmação quando o usuário clicar no botão "Limpar"

Atualmente, quando o usuário clica no botão "Limpar", o formulário inteiro é apagado (faça o teste para verificar!). Este é,
de fato, o comportamento esperado, mas queremos exibir uma mensagem de confirmação antes. Dessa
forma, se o usuário clicar no botão sem querer, não perderá todos os dados que já preencheu até
o momento.

Altere a função `cleanUp` do JavaScript, que é responsável por esconder as mensagens de erro do formulário, para implementar este
comportamento.

Você deve usar o método `window.confirm()`(documentação [aqui](https://developer.mozilla.org/en-US/docs/Web/API/Window/confirm)) para
exibir a mensagem "Tem certeza que deseja apagar o formulário?".

Se o usuário clicar em "Cancelar", a ação deve ser cancelada, ou seja, o formulário deve **permanecer inalterado**.

**Observação:** Note que apagar os campos do formulário é um comportamento padrão do evento `click` de elementos `<input>` que tem o atributo `type="reset"`. Ou seja, esse comportamento nem aparece na função `cleanUp`, mas você precisará impedi-lo caso o usuário clique em "Cancelar".

### 6) Quando um checkbox estiver selecionado, o rótulo associado deve aparecer em itálico

Implemente o seguinte comportamento: sempre que um _checkbox_ for
selecionado, o rótulo associado a ele ("Algoritmos", "Hardware", etc) deve ficar em itálico.
Se o usuário cancelar a seleção, o rótulo deve voltar ao normal.

Algumas dicas:

- Você pode definir uma regra no CSS para um seletor de classe, por exemplo, `.selected`, que deixa um texto em itálico. A ideia é que, quando um elemento qualquer do HTML tiver essa classe, vai ficar com o seu conteúdo em itálico. Assim, o JavaScript só precisa se encarregar de adicionar/remover esta classe ao elemento apropriado. Esta implementação é parecida com a forma que está sendo usada para mostrar/esconder as mensagens de erro.
- Se o objeto `elem` é um objeto que representa um checkbox, o atributo `elem.checked`
pode ser usado para descobrir se o checkbox está selecionado.
- Se `elem` é um objeto do DOM, `elem.parentElement` pode ser usado para obter o elemento-pai
deste objeto.
- Sempre que um _checkbox_ é marcado ou desmarcado, o evento [`change`](https://developer.mozilla.org/en-US/docs/Web/Events/change) é disparado para aquele elemento.

### 7) Adicionar campo de telefone, com validações apropriadas

Altere o HTML para adicionar um novo campo, "Telefone", logo abaixo do campo "Data de nascimento".

Em seguida, altere o JavaScript para adicionar validações de presença e de formato neste novo campo.
Para um telefone ser válido, ele deve conter apenas dígitos, no mínimo 10 (DDD + 8 dígitos) e no
máximo 11 (DDD + 9 dígitos), sem espaços ou sinais de pontuação. Por exemplo, um telefone válido seria "11999926644", enquanto "(11) 99992-6644" seria inválido.

- No HTML e no JavaScript, use o termo `phone` para o telefone. Por exemplo, a classe da div deve ser `group-for-phone`, o `<input>` deve ter atributo `name="phone"`, etc.
- Observe a implementação do campo "Data de nascimento" (`birthday`) para ter ideias.

## Correção do exercício

1. Use o comando `ep 8.2` para corrigir a sua solução.

---
layout: exercicio
modulo: 5
numero: 10
nome: "Exercício M05-E02"
title: "5.10 Aula de Ruby: Exercício M05-E02 | Estágio em Programação"
description: "Exercício M05-E02 de Expressões Regulares (REGEX) do curso online
  gratuito Estágio em Programação."
---

## Objetivos

- Utilizar expressões regulares como forma de validacão e manipulação de dados.

## Instruções

1. Crie o diretório para a resolução deste exercício:

    ```bash
      mkdir -p ~/ep/exercicios/m5/e2
    ```

2. No diretório do exercício (`~/ep/exercicios/m5/e2`), crie um arquivo com o nome `m5-e2.rb`.

3. Abra o arquivo criado no passo anterior e defina uma classe com o nome `M5E2`. Seguindo os passos abaixo, você fará definições de constantes e métodos no escopo desta classe.

4. Defina o método de instância `cpf_validation`, de acordo com as instruções abaixo:
    - O método deve receber um único parâmetro (String) de entrada.
    - O retorno do método deve ser `true`, se o formato for aceito, ou `false`, caso contrário.
    - O método deve **utilizar uma expressão regular** para validar se o formato do parâmetro recebido é um CPF;
    - O formato completo de um CPF é `XXX.XXX.XXX-XX`, em que `X` é um dígito (0 a 9);
    - O método deve aceitar que os caracteres `.` e `-` estejam ausentes, mas não deve aceitar esses caracteres presentes em posições inesperadas.

5. Defina o método de instância `email_validation`, de acordo com as instruções abaixo:
    - Será utilizado um formato simplificado de definição de email.
    - O método deve receber um único parâmetro (String) de entrada.
    - O retorno do método deve ser `true`, se o formato for aceito, ou `false`, caso contrário.
    - O método deve **utilizar uma expressão regular** para validar se o formato do parâmetro recebido é um email.
    - O formato esperado de um email é `_NAME_@_DOMAIN_`.
    - `_NAME_` pode conter letras, números, . (ponto) e \_ (*underscore*).
    - `_DOMAIN_` pode conter letras, números e . (ponto).

6. Defina o método de instância `price_validation`, de acordo com as instruções abaixo:
    - O método deve receber um único parâmetro (String) de entrada.
    - O retorno do método deve ser `true`, se o formato for aceito, ou `false`, caso contrário.
    - O método deve **utilizar expressões regulares** para validar se o formato do parâmetro recebido é um preço **em Real ou Dólar**.
    - Preços em Real:
        - devem começar com `R$`.
        - podem ter um único espaço entre o símbolo da moeda e o valor.
        - devem ter duas casas decimais.
        - devem utilizar `.` como separador de milhar.
        - devem utilizar `,` como separador decimal.
    - Preços em Dólar:
        - devem começar com `U$`.
        - podem ter um único espaço entre o símbolo da moeda e o valor.
        - devem ter duas casas decimais.
        - devem utilizar `,` como separador de milhar.
        - devem utilizar `.` como separador decimal.

7. Utilize a ferramenta de correção automática do `ep` para verificar se está tudo certo.

    ```bash
      ep 5.2
    ```

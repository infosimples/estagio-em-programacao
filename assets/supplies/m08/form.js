/**
 * form.js: Comportamento da página de cadastro.
 */

/**
 * Este objeto contém uma entrada para cada campo do formulário que deve ser
 * validado. O valor de cada entrada é um outro objeto, que contém uma entrada
 * para cada tipo de validação, e o método usado para validar.
 *
 * Por exemplo: o campo "email" possui dois tipos de validação:
 * - "blank", que verifica se o campo não está em branco; e
 * - "valid", que verifica se o email informado é válido.
 */
var validations = {
  name: {
    blank: validatePresence
  },
  email: {
    blank: validatePresence,
    valid: validateEmail
  },
  password: {
    blank: validatePresence,
  },
  "password-confirmation": {
    blank: validatePresence,
    valid: validatePasswordConfirmation
  },
  birthday: {
    blank: validatePresence,
    valid: validateBirthday
  },
  interests: {
    blank: validatePresence
  },
  frequency: {
    blank: validatePresence
  }
};

/**
 * Verifica se um campo do formulário está preenchido e, se não
 * estiver, exibe a mensagem de erro apropriada.
 *
 * @param  {String}  inputName Nome do campo que será validado.
 * @param  {Object}  inputName Campo que será validado (<input>).
 * @return {Boolean} Verdadeiro se o campo é válido, falso caso contrário.
 */
function validatePresence(inputName, input) {
  // Obtém o tipo do <input>.
  var inputType = input.getAttribute('type');

  // No caso de checkboxes e radio buttons, "presença" significa que pelo menos
  // um item foi selecionado, i.e., a validação é feita no grupo todo.
  if (inputType === "checkbox" || inputType === "radio") {
    return validateGroupPresence(inputName);
  }
  // No caso de campos de texto, "presença" significa simplesmente que o campo
  // não é vazio.
  else {
    return showOrHideErrorMessage(inputName, !isEmpty(input.value));
  }
}

/**
 * Verifica se pelo menos um <input> de um mesmo grupo foi selecionado. Se
 * nenhum <input> tiver sido selecionado, exibe a mensagem de erro apropriada.
 *
 * @param  {String}  groupName Nome do grupo.
 * @return {Boolean} Verdadeiro se o grupo é válido, falso caso contrário.
 */
function validateGroupPresence(groupName) {
  var inputs = document.querySelectorAll("input[name=" + groupName + "]");
  var anyChecked = false;

  for (var i = 0; i < inputs.length; i++) {
    if (inputs[i].checked) {
      anyChecked = true;
    }
  }

  return showOrHideErrorMessage(groupName, anyChecked);
}

/**
 * Verifica se o email informado é válido.
 *
 * @param  {String}  inputName Nome do campo que será validado.
 * @param  {Object}  inputName Campo que será validado (<input>).
 * @return {Boolean}           Verdadeiro se o campo for válido.
 */
function validateEmail(inputName, input) {
  var isValid = isEmpty(input.value) || /@/.test(input.value);
  return showOrHideErrorMessage(inputName, isValid, 'invalid');
}

function validatePasswordConfirmation(inputName, input) {
  // TODO: Verificar se o campo de confirmação de senha é igual
  // à senha informada. Se não for, o campo é inválido. Se o campo for
  // vazio, ele deve ser considerado válido, pois a outra mensagem de erro
  // (sobre ausência/presença) já será exibida.

  return true;
}

function validateBirthday(inputName, input) {
  // TODO: Verificar se o campo da data de nascimento obedece ao formato
  // "dd/mm/yyyy". Qualquer outro formato é inválido mas, se o campo for
  // vazio, ele deve ser considerado válido, pois a outra mensagem de erro
  // (sobre ausência/presença) já será exibida.

  return true;
}

function validatePhone(inputName, input) {
  // TODO: Verificar se o campo de telefone contém apenas dígitos. Se o campo
  // estiver vazio, ele deve ser considerado válido, pois a outra mensagem
  // de erro (sobre ausência/presença) já será exibida.

  return true;
}

/**
 * Dado o nome de um <input>, um booleano indicando se este campo é válido ou
 * não e o tipo de validação que foi realizada, exibe ou esconde a mensagem
 * de erro correspondente.
 *
 * @param  {String}  inputName  Nome do <input>
 * @param  {Boolean} isValid    Indica se o <input> é válido ou não.
 * @param  {String}  errorType  Tipo de validação.
 * @return {Boolean}            Retorna o parâmetro isValid.
 */
function showOrHideErrorMessage(inputName, isValid, errorType) {

  // Se o tipo de validação não foi informado, assumimos que é o tipo mais
  // básico: validação de ausência/presença.
  if (errorType === undefined) {
    errorType = "blank";
  }

  // Encontra, no HTML, o <span> que corresponde à mensagem de erro que
  // deve ser exibida/escondida.
  var errorMessage = document.querySelector(".group-for-" + inputName +
    " .error-" + errorType);

  if (isValid) {
    // Se o campo é válido, esconde a mensagem de erro, caso estivesse sendo
    // exibida.
    errorMessage.classList.add("hidden");
  }
  else {
    // Se o campo não é válido, exibe a mensagem de erro.
    errorMessage.classList.remove("hidden");
  }

  return isValid;
}

/**
 * Verifica se o formulário é válido e pode ser enviado. O formulário é
 * considerado válido se todos os seus <input>s forem válidos.
 *
 * @param  {Object}  event  Objeto que representa o evento "submit".
 * @return {Boolean}        Verdadeiro se o formulário for válido.
 */
function validateForm(event) {
  var isFormValid = true;

  // Para cada campo que possui validações...
  forEach(validations, function(fieldName, fieldValidations) {
    var field = document.querySelector("input[name=" + fieldName + "]");
    // Para cada tipo de validação associada a este campo...
    forEach(fieldValidations, function(validationType, validationMethod) {
      // Chama o método de validação. Se o método retornar falso, o campo é
      // inválido e, portanto, o formulário inteiro é invalidado.
      if (!validationMethod(fieldName, field)) {
        isFormValid = false;
      }
    })
  });

  if (isFormValid) {
    window.alert("Todos os campos foram preenchidos corretamente. " +
      "Clique em OK para continuar.");
  }
  else {
    // Se o formulário não é válido, ele não deve ser enviado. Esta chamada
    // é usada para suspender a ação de envio.
    event.preventDefault();
  }
}

/**
 * Função auxiliar, usada para iterar sobre um objeto.
 */
function forEach(obj, fn) {
  for (var prop in obj) {
    if (obj.hasOwnProperty(prop)) {
      fn(prop, obj[prop]);
    }
  }
}

/**
 * Função auxiliar: verifica se uma string é vazia.
 * @param  {String}  value String que será validada.
 * @return {Boolean}       Verdadeiro se é vazia.
 */
function isEmpty(value) {
  return /^$/.test(value);
}

/**
 * Esconde todas as mensagens de erro.
 */
function cleanUp(event) {
  var errors = document.querySelectorAll(".error");
  for (var i = 0; i < errors.length; i++) {
    errors[i].classList.add("hidden");
  }
}

/**
 * Configuração de "event listeners" para os elementos do HTML cujos eventos
 * queremos interceptar.
 */

// Interceptação do evento de submissão do formulário.
document.querySelector("form#sign-up").addEventListener("submit", validateForm);

// Interceptação do evento de click no botão "Limpar".
document.querySelector("input[type=reset]").addEventListener("click", cleanUp);

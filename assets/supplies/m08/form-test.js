var fs = require('fs');

var FORM_FILE = fs.workingDirectory + "/form.html";

casper.test.begin('(1) Mensagens de erro aparecem em vermelho', 7, function suite(test) {
  casper.start("file://" + FORM_FILE, function() {
    var colorRed = "rgb(255, 0, 0)";
    var colors = this.evaluate(function() {
      var errors = document.querySelectorAll(".error");
      var obj = {};
      for (var i = 0; i < errors.length; i++) {

        var key = undefined;
        if (/^group/.test(errors[i].parentElement.classList[1])) {
          key = errors[i].parentElement.classList[1];
        }
        else {
          key = errors[i].innerText;
        }

        obj[key] = window.getComputedStyle(errors[i])['color'];
      }
      return obj;
    });

    for (var key in colors) {
      if (colors.hasOwnProperty(key)) {
        test.assertEquals(colors[key], colorRed, "Mensagem(ns) \"" + key + "\" aparece(m) em vermelho");
      }
    }
  });

  casper.run(function() {
    test.done();
  })
});

casper.test.begin('(2) Parágrafos em negrito', 3, function suite(test) {
  casper.start("file://" + FORM_FILE, function() {
    var bold = "bold";
    var elements = this.evaluate(function() {
      var elems = document.querySelectorAll("p");
      var obj = {};
      for (var i = 0; i < elems.length; i++) {
        var key = elems[i].innerText;
        obj[key] = window.getComputedStyle(elems[i])["font-weight"];
      }
      return obj;
    });

    for (var key in elements) {
      if (elements.hasOwnProperty(key)) {
        test.assertEquals(elements[key], bold, "Parágrafo \"" + key + "\" aparece em negrito");
      }
    }
  });

  casper.run(function() {
    test.done();
  })
});

casper.test.begin('(3) Validação da data de nascimento', 7, function suite(test) {

  casper.start("file://" + FORM_FILE);

  casper.then(function() {
    this.fill("form#sign-up", { "birthday": "abcdef" }, true);
  });

  casper.then(function() {
    test.assertVisible(".group-for-birthday .error-invalid", "Data 'abcdef' é inválida");
  });

  /* ------------------------------------------------------------- */

  casper.then(function() {
    this.fill("form#sign-up", { "birthday": "01011970" }, true);
  });

  casper.then(function() {
    test.assertVisible(".group-for-birthday .error-invalid", "Data '01011970' é inválida");
  });

  /* ------------------------------------------------------------- */

  casper.then(function() {
    this.fill("form#sign-up", { "birthday": "01/011970" }, true);
  });

  casper.then(function() {
    test.assertVisible(".group-for-birthday .error-invalid", "Data '01/011970' é inválida");
  });

  /* ------------------------------------------------------------- */

  casper.then(function() {
    this.fill("form#sign-up", { "birthday": "01/01/1970 Hey!" }, true);
  });

  casper.then(function() {
    test.assertVisible(".group-for-birthday .error-invalid", "Data '01/01/1970 Hey!' é inválida");
  });

  /* ------------------------------------------------------------- */

  casper.then(function() {
    this.fill("form#sign-up", { "birthday": "???!21/04/2016" }, true);
  });

  casper.then(function() {
    test.assertVisible(".group-for-birthday .error-invalid", "Data '???!21/04/2016' é inválida");
  });

  /* ------------------------------------------------------------- */

  casper.then(function() {
    this.fill("form#sign-up", { "birthday": "01/01/1970" }, true);
  });

  casper.then(function() {
    test.assertNotVisible(".group-for-birthday .error-invalid", "Data '01/01/1970' é válida");
  });

  /* ------------------------------------------------------------- */

  casper.then(function() {
    this.fill("form#sign-up", { "birthday": "00/00/0000" }, true);
  });

  casper.then(function() {
    test.assertNotVisible(".group-for-birthday .error-invalid", "Data '00/00/0000' é válida");
  });

  casper.run(function() { test.done(); });

});

casper.test.begin('(4) Validação da confirmação de senha', 4, function suite(test) {

  casper.start("file://" + FORM_FILE);

  casper.then(function() {
    this.fill("form#sign-up", {
      "password": "abcdef",
      "password-confirmation": "123456"
    }, true);
  });

  casper.then(function() {
    test.assertVisible(".group-for-password-confirmation .error-invalid", "'abcdef' != '123456'");
  });

  /* ------------------------------------------------------------- */

  casper.then(function() {
    this.fill("form#sign-up", {
      "password": "1 1",
      "password-confirmation": "1 "
    }, true);
  });

  casper.then(function() {
    test.assertVisible(".group-for-password-confirmation .error-invalid", "'1 1' != '1 '");
  });

  /* ------------------------------------------------------------- */

  casper.then(function() {
    this.fill("form#sign-up", {
      "password": "abcdef",
      "password-confirmation": "abcdef"
    }, true);
  });

  casper.then(function() {
    test.assertNotVisible(".group-for-password-confirmation .error", "'abcdef' != 'abcdef'");
  });

  /* ------------------------------------------------------------- */

  casper.then(function() {
    this.fill("form#sign-up", {
      "password": "   ",
      "password-confirmation": "   "
    }, true);
  });

  casper.then(function() {
    test.assertNotVisible(".group-for-password-confirmation .error", "'   ' != '   '");
  });

  casper.run(function() { test.done(); });

});

casper.test.begin('(5) Confirmação no botão "Limpar"', 15, function suite(test) {

  var confirmChoice = false;

  casper.setFilter('page.confirm', function(msg) {
    test.assertEquals(msg, "Tem certeza que deseja apagar o formulário?",
      "Mensagem de confirmação está correta");
    return confirmChoice;
  });

  casper.start("file://" + FORM_FILE);

  casper.then(function() {
    this.fill("form#sign-up", {
      "email": "123",
      "frequency": "weekly"
    }, true);

    test.assertField("email", '123', "Form preenchido com email='123'");
    test.assertField("frequency", 'weekly', "Form preenchido com frequency='weekly'");
    test.assertVisible(".group-for-name .error-blank", "Nome é vazio");
    test.assertVisible(".group-for-email .error-invalid", "Email é inválido");
    test.assertVisible(".group-for-interests .error-blank", "Nenhum interesse selecionado");

    this.click("input[type=reset]");
  });

  casper.then(function() {
    test.assertField("email", '123', "Form preenchido com email='123'");
    test.assertField("frequency", 'weekly', "Form preenchido com frequency='weekly'");
    test.assertVisible(".group-for-name .error-blank", "Nome é vazio");
    test.assertVisible(".group-for-email .error-invalid", "Email é inválido");
    test.assertVisible(".group-for-interests .error-blank", "Nenhum interesse selecionado");
  });

  casper.then(function() {
    confirmChoice = true;
    this.click("input[type=reset]");

    test.assertField("email", "", "Email vazio");
    test.assertField("frequency", null, "Nenhuma frequência selecionada");
    test.assertNotVisible(".error", "Nenhum erro visível");
  });

  casper.run(function() {
    test.done();
  });

});

casper.test.begin('(6) Checkboxes selecionados em itálico', 24, function suite(test) {

  casper.start("file://" + FORM_FILE);

  /**
   * Início: nenhum checkbox selecionado, nada em itálico.
   */

  casper.then(function() {
    var italic = "italic";

    var fontStyles = this.evaluate(function() {
      var checkboxes = document.querySelectorAll("input[type=checkbox]");
      var obj = {};
      for (var i = 0; i < checkboxes.length; i++) {

        var label = checkboxes[i].parentElement;
        obj[label.innerText] = window.getComputedStyle(label)["font-style"];
      }
      return obj;
    });

    for (var key in fontStyles) {
      if (fontStyles.hasOwnProperty(key)) {
        test.assertEquals(fontStyles[key], "normal", "'" + key + "' não aparece em itálico");
      }
    }
  });

  casper.then(function() {
    this.evaluate(function() {
      document.querySelectorAll("input[name=interests][value='2']")[0].click();
      document.querySelectorAll("input[name=interests][value='9']")[0].click();
    });
  });

  casper.then(function() {
    var fontStyles = this.evaluate(function() {
      var checkboxes = document.querySelectorAll("input[type=checkbox]");
      var obj = {};
      for (var i = 0; i < checkboxes.length; i++) {
        var label = checkboxes[i].parentElement;
        obj[label.innerText] = window.getComputedStyle(label)["font-style"];
      }
      return obj;
    });

    for (var key in fontStyles) {
      if (fontStyles.hasOwnProperty(key)) {
        if (key === "Banco de dados" || key === "Redes de computadores") {
          test.assertEquals(fontStyles[key], "italic", "'" + key + "' aparece em itálico");
        }
        else {
          test.assertEquals(fontStyles[key], "normal", "'" + key + "' não aparece em itálico");
        }
      }
    }
  });

  casper.run(function() { test.done(); });

});

casper.test.begin('(7) Campo de telefone', 10, function suite(test) {

  casper.start("file://" + FORM_FILE);

  casper.then(function() {
    test.assertExists(".row.group-for-phone", "<div> para o campo Telefone existe");
    test.assertExists("label[for=phone]", "<label> para o campo Telefone existe");
    test.assertExists("input[name=phone]", "<input> para o campo Telefone existe");
    test.assertExists(".group-for-phone .error-blank", "Erro de ausência para o campo Telefone existe");
    test.assertExists(".group-for-phone .error-invalid", "Erro de formato para o campo Telefone existe");
  });

  /* ------------------------------------------------------------- */

  casper.then(function() {
    this.fill("form#sign-up", {
      "name": "teste",
    }, true);
  });

  casper.then(function() {
    test.assertVisible(".group-for-phone .error-blank", "'' não é um telefone válido");
  });


  /* ------------------------------------------------------------- */

  casper.then(function() {
    this.fill("form#sign-up", {
      "phone": "ab0123456789",
    }, true);
  });

  casper.then(function() {
    test.assertVisible(".group-for-phone .error-invalid", "'ab0123456789' não é um telefone válido");
  });

  /* ------------------------------------------------------------- */

  casper.then(function() {
    this.fill("form#sign-up", {
      "phone": "0123456789xy",
    }, true);
  });

  casper.then(function() {
    test.assertVisible(".group-for-phone .error-invalid", "'0123456789xy' não é um telefone válido");
  });

  /* ------------------------------------------------------------- */

  casper.then(function() {
    this.fill("form#sign-up", {
      "phone": "11987456231",
    }, true);
  });

  casper.then(function() {
    test.assertNotVisible(".group-for-phone .error", "'11987456231' é um telefone válido");
  });

  /* ------------------------------------------------------------- */

  casper.then(function() {
    this.fill("form#sign-up", {
      "phone": "1135984621",
    }, true);
  });

  casper.then(function() {
    test.assertNotVisible(".group-for-phone .error", "'1135984621' é um telefone válido");
  });

  /* ------------------------------------------------------------- */

  casper.run(function() { test.done(); });

});

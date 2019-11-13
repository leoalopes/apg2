<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <!-- Standard Meta -->
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

  <!-- Site Properties -->
  <title>Cadastro</title>

  <link rel="stylesheet" type="text/css" href="assets/libraries/semantic/semantic.min.css">
  <script src="assets/libraries/jquery.min.js"></script>
  <script src="assets/libraries/semantic/semantic.min.js"></script>

  <style type="text/css">
    body {
      background-color: #EEEEEE;
    }
    body > .grid {
      height: 100%;
    }
    .image {
      margin-top: -100px;
    }
    .column {
      max-width: 450px;
    }
    .menu {
      height: 50px;
      border-bottom: 2px solid #1EB3FD !important;
    }
    .errorMessage {
      padding: 0 !important;
      color: #9F3A38 !important;
    }
  </style>
</head>

<script>
function validateForm() {
  let password = document.querySelector('#password')
  let confirmPassword = document.querySelector('#confirmPassword')
  if(password.value != confirmPassword.value) {
    password.parentElement.parentElement.classList.add('error')
    confirmPassword.parentElement.parentElement.classList.add('error')
    return false
  }
}

window.onload = function() {
  document.querySelector('#name').value = '<s:property value="name"/>'
  document.querySelector('#email').value = '<s:property value="email"/>'
}
</script>

<body>
    <div class="ui fixed inverted first menu">
      <div class="item">
      </div>
      <a href="home" class="item">
        Imobiliária
      </a>
      <div class="right menu">
        <div class="item">
          <a href="register" style="margin-left: 5px">
            <i class="user plus icon"></i>
          </a>
        </div>
        <div class="item">
          <s:property value="%{#session.loggedEmail}" />
          <a href="logout" style="margin-left: 10px">
            <i class="user times icon"></i>
          </a>
        </div>
        <div class="item" style="margin-left: 5px;"></div>
      </div>
    </div>
    <div class="ui middle aligned center aligned grid">
    <div class="column">
        <h2 class="ui image header" style="color: #1EB3FD">
            <div class="content">
                Cadastrar nova conta
            </div>
        </h2>
        <form id="#form" class="ui large form" action="registerAction" method="post" onsubmit="return validateForm()">
        <div class="ui stacked segment">
            <div class="field">
                <div class="ui left icon input">
                    <i class="user icon"></i>
                    <input id="name" type="text" name="name" placeholder="Nome" />
                </div>
            </div>
            <div class="field">
                <div class="ui left icon input">
                    <i class="envelope icon"></i>
                    <input id="email" type="email" name="email" placeholder="E-mail" />
                </div>
            </div>
            <div class="field">
                <div class="ui left icon input">
                    <i class="lock icon"></i>
                    <input id="password" type="password" name="password" placeholder="Senha" />
                </div>
            </div>
            <div class="field">
                <div class="ui left icon input">
                    <i class="lock icon"></i>
                    <input id="confirmPassword" type="password" name="confirmPassword" placeholder="Confirmar senha">
                </div>
            </div>
            <s:fielderror />
            <button class="ui fluid large submit button" type="submit" style="background-color: #1EB3FD; color: white">Cadastrar</button>
        </div>

        </form>
    </div>
    </div>
</body>

</html>
<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
  <!-- Standard Meta -->
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

  <!-- Site Properties -->
  <title>Login</title>

  <link rel="stylesheet" type="text/css" href="assets/libraries/semantic/semantic.min.css">
  <script src="assets/libraries/semantic/semantic.min.js"></script>
  <script src="assets/libraries/jquery.min.js"></script>

  <style type="text/css">
    body {
      background-color: #151517;
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
  </style>
</head>
<body>
    <div class="ui middle aligned center aligned grid">
    <div class="column">
        <h2 class="ui image header" style="color: #1EB3FD">
            <div class="content">
                Acesse sua conta
            </div>
        </h2>
        <form class="ui large form">
        <div class="ui stacked segment">
            <div class="field">
                <div class="ui left icon input">
                    <i class="envelope icon"></i>
                    <input type="text" name="email" placeholder="E-mail">
                </div>
            </div>
            <div class="field">
                <div class="ui left icon input">
                    <i class="lock icon"></i>
                    <input type="password" name="password" placeholder="Senha">
                </div>
            </div>
            <a href="home"><div class="ui fluid large submit button" style="background-color: #1EB3FD; color: white">Login</div></a>
        </div>

        <div class="ui error message"></div>

        </form>

        <div class="ui message">
        Não possui uma conta?  <a href="register">Cadastrar-se</a>
        </div>
    </div>
    </div>
</body>
</html>
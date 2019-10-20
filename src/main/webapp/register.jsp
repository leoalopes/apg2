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
      background-color: #FFFFFF;
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
    <div class="ui fixed inverted first menu">
      <div class="item">
      </div>
      <a href="home" class="item">
        Imobiliária
      </a>
    </div>
    <div class="ui middle aligned center aligned grid">
    <div class="column">
        <h2 class="ui image header" style="color: #1EB3FD">
            <div class="content">
                Cadastrar nova conta
            </div>
        </h2>
        <form class="ui large form" action="registerAction" method="post">
        <div class="ui stacked segment">
            <div class="field">
                <div class="ui left icon input">
                    <i class="user icon"></i>
                    <input type="text" name="name" placeholder="Nome" />
                </div>
            </div>
            <div class="field">
                <div class="ui left icon input">
                    <i class="envelope icon"></i>
                    <input type="email" name="email" placeholder="E-mail" />
                </div>
            </div>
            <div class="field">
                <div class="ui left icon input">
                    <i class="lock icon"></i>
                    <input type="password" name="password" placeholder="Senha" />
                </div>
            </div>
            <%-- <div class="field">
                <div class="ui left icon input">
                    <i class="lock icon"></i>
                    <input type="password" name="password" placeholder="Confirmar senha">
                </div>
            </div> --%>
            <button class="ui fluid large submit button" type="submit" style="background-color: #1EB3FD; color: white">Cadastrar</button>
        </div>

        <div class="ui error message"></div>

        </form>
    </div>
    </div>
</body>
</html>
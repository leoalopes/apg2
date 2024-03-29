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
  <title>Login</title>

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
    .errorMessage {
      padding: 0 !important;
      color: #9F3A38 !important;
    }
  </style>
</head>

<script>
window.onload = function() {
  document.querySelector('#email').value = '<s:property value="email"/>'
}
</script>

<body>
    <div class="ui middle aligned center aligned grid">
    <div class="column">
        <h2 class="ui image header" style="color: #1EB3FD">
            <div class="content">
                Acesse sua conta
            </div>
        </h2>
        <form id="form" class="ui large form" action="loginAction" method="post">
        <div class="ui stacked segment">
            <div class="field">
                <div class="ui left icon input">
                    <i class="envelope icon"></i>
                    <input id="email" type="email" name="email" placeholder="E-mail">
                </div>
            </div>
            <div class="field">
                <div class="ui left icon input">
                    <i class="lock icon"></i>
                    <input id="password" type="password" name="password" placeholder="Senha">
                </div>
            </div>
            <s:fielderror />
            <button type="submit" class="ui fluid large submit button" style="background-color: #1EB3FD; color: white">Login</button>
        </div>

        </form>
    </div>
    </div>
</body>
</html>
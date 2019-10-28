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
  <title>Propriedade</title>

  <link rel="stylesheet" type="text/css" href="assets/libraries/semantic/semantic.min.css">
  <script src="assets/libraries/jquery.min.js"></script>
  <script src="assets/libraries/semantic/semantic.min.js"></script>

  <style type="text/css">
  body {
    background-color: #FFFFFF;
  }
  .ui.menu .item img.logo {
    margin-right: 1.5em;
  }
  .main.container {
    margin-top: 7em;
  }
  .wireframe {
    margin-top: 2em;
  }
  .ui.footer.segment {
    margin: 5em 0em 0em;
    padding: 5em 0em;
  }
  .menu {
    height: 50px;
    border-bottom: 2px solid #1EB3FD !important;
  }
  .container {
    width: 90%;
    display: block;
    margin: auto;
    margin-top: 100px;
  }
  .grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, 230px);
    justify-content: center;
  }
  .location {
    margin-bottom: 15px;
  }
  </style>

</head>

<script>
  function openSidebar() {
    $('.ui.sidebar').sidebar('toggle')
  }
</script>

<body>

    <div class="ui fixed inverted first menu">
      <div class="item" style="margin-left: 5px; cursor: pointer;">
      </div>
      <a href="home" class="item">
        Imobiliária
      </a>
      <div class="item">
        <s:property value="%{#session.loggedEmail}" />
      </div>
    </div>

    <div class="container">
        <h1 class="ui center aligned header">Criando nova propriedade</h1>

        <div class="container" style="margin-top: 10px">
            <form class="ui form">
                <h4 class="ui dividing header">Informações básicas</h4>
                <div class="field">
                    <label>Nome</label>
                    <div class="field">
                        <input type="text" name="name">
                    </div>
                </div>
                <div class="three fields">
                    <div class="field">
                        <label>Bairro</label>
                        <div class="field">
                            <input type="text" name="neighborhood">
                        </div>
                    </div>
                    <div class="field">
                        <label>Estado</label>
                        <div class="field">
                            <input type="text" name="state">
                        </div>
                    </div>
                    <div class="field">
                        <label>País</label>
                        <div class="field">
                            <input type="text" name="country">
                        </div>
                    </div>
                </div>
                <div class="fields">
                    <div class="twelve wide field">
                        <label>Endereço</label>
                        <input type="text" name="address">
                    </div>
                    <div class="four wide field">
                        <label>Preço</label>
                        <input type="number" name="price">
                    </div>
                </div>
                <h4 class="ui dividing header">Informações do dono</h4>
                <div class="ui segment">
                    <div class="field">
                    <div class="ui toggle checkbox">
                        <input type="checkbox" name="gift" tabindex="0" class="hidden">
                        <label>Do not include a receipt in the package</label>
                    </div>
                    </div>
                </div>
                <div class="ui button" tabindex="0">Submit Order</div>
            </form>
        </div>
    </div>

</body>
</html>
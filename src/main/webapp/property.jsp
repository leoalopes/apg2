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
  .errorMessage {
    padding: 0 !important;
    color: #9F3A38 !important;
  }
  </style>

</head>

<script>
  function openSidebar() {
    $('.ui.sidebar').sidebar('toggle')
  }
  window.onload = function() {
	  $('.ui.checkbox').checkbox()
    document.querySelector('#title').value = '<s:property value="title"/>'
    document.querySelector('#neighborhood').value = '<s:property value="neighborhood"/>'
    document.querySelector('#state').value = '<s:property value="state"/>'
    document.querySelector('#country').value = '<s:property value="country"/>'
    document.querySelector('#city').value = '<s:property value="city"/>'
    document.querySelector('#address').value = '<s:property value="address"/>'
    document.querySelector('#price').value = '<s:property value="price"/>'
    document.querySelector('#owner').value = '<s:property value="owner"/>'
    document.querySelector('#ownerEmail').value = '<s:property value="ownerEmail"/>'
    document.querySelector('#ownerPhone').value = '<s:property value="ownerPhone"/>'
    document.querySelector('#realtor').value = '<s:property value="realtor"/>'
    // document.querySelector('#funded').checked = '<s:property value="funded"/>'
    // document.querySelector('#trade').checked = '<s:property value="trade"/>'
    // document.querySelector('#owns').checked = '<s:property value="owns"/>'
  }
</script>

<body>

    <div class="ui fixed inverted first menu">
      <div class="item" style="margin-left: 5px;">
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

    <div class="container">
        <h1 class="ui center aligned header">Criando nova propriedade</h1>

        <div class="container" style="margin-top: 10px">
            <form class="ui form" method="POST" action="createPropertyAction">
                <h4 class="ui dividing header">Informações básicas</h4>
                <div class="field">
                    <label>Nome</label>
                    <div class="field">
                        <input type="text" id="title" name="title">
                    </div>
                </div>
                <div class="three fields">
                    <div class="field">
                        <label>Bairro</label>
                        <div class="field">
                            <input type="text" id="neighborhood" name="neighborhood">
                        </div>
                    </div>
                    <div class="field">
                        <label>Estado</label>
                        <div class="field">
                            <input type="text" id="state" name="state">
                        </div>
                    </div>
                    <div class="field">
                        <label>País</label>
                        <div class="field">
                            <input type="text" id="country" name="country">
                        </div>
                    </div>
                </div>
                <div class="three fields">
					          <div class="field">
                        <label>Cidade</label>
                        <input type="text" id="city" name="city">
                    </div>
                    <div class="field">
                        <label>Rua e número</label>
                        <input type="text" id="address" name="address">
                    </div>
                    <div class="field">
                        <label>Preço</label>
                        <input type="text" id="price" name="price">
                    </div>
                </div>
                <h4 class="ui dividing header">Informações do proprietário</h4>
				<div class="field">
					<label>Nome</label>
					<input type="text" id="owner" name="owner">
				</div>
				<div class="two fields">
					<div class="field">
						<label>Email</label>
						<input type="text" id="ownerEmail" name="ownerEmail">
					</div>
					<div class="field">
						<label>Telefone</label>
						<input type="text" id="ownerPhone" name="ownerPhone">
					</div>
				</div>
				<h4 class="ui dividing header">Informações do imóvel</h4>
        <div class="field">
					<label>URL da imagem</label>
					<input type="text" id="image" name="image">
				</div>
				<div class="field">
					<label>Nome do corretor</label>
					<input type="text" id="realtor" name="realtor">
				</div>
				<div class="ui segment">
					<div class="field">
						<div class="ui toggle checkbox">
							<input type="checkbox" id="funded" name="funded">
							<label>Imóvel é financiado</label>
						</div>
					</div>
					<div class="field">
						<div class="ui toggle checkbox">
							<input type="checkbox" id="owns" name="owns">
							<label>Imóvel está no nome do dono</label>
						</div>
					</div>
					<div class="field">
						<div class="ui toggle checkbox">
							<input type="checkbox" id="trade" name="trade">
							<label>Proprietário aceita negociação</label>
						</div>
					</div>
				</div>
        <s:fielderror />
        <br>
				<button class="ui submit button" style="background-color: #2185D0; color: white; margin-bottom: 50px">Criar propriedade</button>
            </form>
        </div>
    </div>

</body>
</html>

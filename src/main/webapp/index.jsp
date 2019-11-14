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
  <title>Home</title>

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
  .p-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, 230px);
    justify-content: center;
  }
  .location {
    margin-bottom: 15px;
  }
  .filter-btn {
    background-color: #1EB3FD !important;
    color: white !important;
    width: 227px !important;
    left: 16px;
    top: 7px;
  }
  .floating-button {
    background-color: #1EB3FD !important;
    color: white !important;
    position: fixed;
    bottom: 25px;
    right: 100px;
    box-shadow: 0;
    transition: all 2s !important;
  }
  .floating-button:hover{
    box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24) !important;
  }
  .not_updated {
    color: #FB0335 !important;
  }
  </style>

</head>

<script>
  function openSidebar() {
    $('.ui.sidebar').sidebar('toggle')
  }
  function openModal(e) {
    var id = e.currentTarget.id.substring(9)
    $('#modal-'+id).modal('show')
  }
  function editProperty(e) {
    e.stopPropagation();
    $("#dynamic").empty()
    $("#dynamic").html('<form id="dynamic-form" method="POST" action="edit-property" style="position: absolute; top: 1000000000000000000px"><input type="number" name="id" value="' + e.target.id + '" /></form>')
    $("#dynamic-form").submit()
  }
  function deleteProperty(e) {
    e.stopPropagation();
    $('.loader').addClass("active")
    $.ajax({
      url: "deletePropertyAction",
      type: "post",
      data: {
        id: Number(e.target.id)
      }
    })
    .done(function() {
      $('.loader').removeClass("active")
      $('#location-' + e.target.id).remove()
    })
  }
  function searchByTitle(e) {
    $("#dynamic").empty()
    $("#dynamic").html('<form id="dynamic-form" method="POST" action="home" style="position: absolute; top: 1000000000000000000px"><input type="text" name="title" value="' + $("#search-title").val() + '" /></form>')
    $("#dynamic-form").submit()
  }
  function searchWithFilter(e) {
    $("#dynamic").empty()
    $("#dynamic").html(`
    <form id="dynamic-filter" method="POST" action="home" style="position: absolute; top: 1000000000000000000px">
      <input type="text" name="title" value="` + $("#search-title").val() + `" />
      <input type="text" name="address" value="` + $("#filter-address").val() + `" />
      <input type="number" name="minPrice" value="` + $("#filter-minPrice").val() + `" />
      <input type="number" name="maxPrice" value="` + $("#filter-maxPrice").val() + `" />
      <input type="text" name="realtor" value="` + $("#filter-realtor").val() + `" />
      <input type="text" name="owner" value="` + $("#filter-owner").val() + `" />
      <input type="checkbox" name="filtering" checked/>
      ` + ($("#filter-funded").is(":checked") ?  `<input type="checkbox" name="funded" checked />` : `<input type="checkbox" name="funded"/>`) + `
      ` + ($("#filter-owns").is(":checked") ?  `<input type="checkbox" name="owns" checked />` : `<input type="checkbox" name="owns"/>`) + `
      ` + ($("#filter-trade").is(":checked") ?  `<input type="checkbox" name="trade" checked />` : `<input type="checkbox" name="trade"/>`) + `
    </form>
    `)
    $("#dynamic-filter").submit()
  }
  window.onload = function() {
	  $('.ui.checkbox').checkbox()
  }
</script>

<body>

  <div class="ui sidebar inverted vertical menu">
    <button class="ui right labeled icon button filter-btn" onclick="searchWithFilter(event)">
      <i class="right search icon"></i>
      Filtrar
    </button>
    <div class="item" style="margin-top: 20px">
      <div style="color: #1EB3FD" class="ui center aligned">Endereço</div><br>
      <div class="ui input">
        <input type="text" id="filter-address">
      </div>
    </div>
    <div class="item">
      <div class="ui input" style="display: flex; align-items: center;">
        <span style="color: #1eb3fd">Preço mínimo</span> <input type="number" id="filter-minPrice" placeholder="R$">
      </div>
    </div>
    <div class="item">
      <div class="ui input" style="display: flex; align-items: center;">
        <span style="color: #1eb3fd">Preço máximo</span> <input type="number" id="filter-maxPrice" placeholder="R$">
      </div>
    </div>
    <div class="item">
      <div style="color: #1EB3FD" class="ui center aligned">Corretor</div><br>
      <div class="ui input">
        <input type="text" id="filter-realtor">
      </div>
    </div>
    <div class="item">
      <div style="color: #1EB3FD" class="ui center aligned">Dono</div><br>
      <div class="ui input">
        <input type="text" id="filter-owner">
      </div>
    </div>
    <div class="item">
      <div class="ui segment">
        <div class="ui toggle checkbox">
          <input type="checkbox" id="filter-funded">
          <label>Financiado</label>
        </div>
        <div class="ui toggle checkbox" style="margin-top: 10px">
          <input type="checkbox" id="filter-owns">
          <label>No nome do dono</label>
        </div>
        <div class="ui toggle checkbox" style="margin-top: 10px">
          <input type="checkbox" id="filter-trade">
          <label>Negociável</label>
        </div>
      </div>
    </div>
  </div>
  <div class="dimmed pusher">
    <div class="ui loader"></div>
    <div class="ui fixed inverted first menu">
      <div class="item" onclick="openSidebar()" style="margin-left: 5px; cursor: pointer;">
        <i class="bars icon"></i>
      </div>
      <a href="home" class="item">
        Imobiliária
      </a>
      <div class="item">
        <div class="ui transparent icon input">
          <input id="search-title" type="text" style="color: white" placeholder="Pesquisar...">
          <i style="color: white" class="search link icon" onclick="searchByTitle(event)"></i>
        </div>
      </div>
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
      <h1 class="ui center aligned header">Explore os imóveis</h1>

      <div class="p-grid">

        <!-- <s:fielderror /> -->

        <s:iterator  value="result">  
          <div id="location-<s:property value='id' />" class="location" style="width: 220px" onclick="openModal(event)">
            <div class="ui link card">
              <div class="image">
                <%-- <img src="https://a0.muscache.com/im/pictures/15273358/d7329e9a_original.jpg?aki_policy=xx_large"> --%>
                <img src="<s:property value='image' />">
              </div>
              <div class="content">
                <a class="header <s:property value='not_updated' />"><s:property value="title" /></a>
                <div class="meta">
                  <span class="date">R$ <s:property value="price" /></span>
                </div>
              </div>
              <div class="extra content" style="padding-bottom: 0">
                <s:property value="owner" /><br>
                <s:property value="owner_phone" />
                <div class="ui two buttons">
                  <div id="<s:property value='id' />" class="ui basic button" style="color: #1EB3FD !important;" onclick="editProperty(event)">Editar</div>
                  <div id="<s:property value='id' />" class="ui basic button" style="color: #9F3A38 !important;" onclick="deleteProperty(event)">Remover</div>
                </div>
              </div>
            </div>
          </div>
          <div id="modal-<s:property value='id' />" class="ui modal">
            <div class="header"><s:property value="title" /></div>
            <div class="content">
              <form class="ui form">
              <div class="three fields">
                  <div class="field">
                      <label>Bairro</label>
                      <div class="field">
                          <input type="text" disabled value="<s:property value='neighborhood' />">
                      </div>
                  </div>
                  <div class="field">
                      <label>Estado</label>
                      <div class="field">
                          <input type="text" disabled value="<s:property value='state' />">
                      </div>
                  </div>
                  <div class="field">
                      <label>País</label>
                      <div class="field">
                          <input type="text" disabled value="<s:property value='country' />">
                      </div>
                  </div>
              </div>
              <div class="three fields">
                  <div class="field">
                      <label>Cidade</label>
                      <input type="text" disabled value="<s:property value='city' />">
                  </div>
                  <div class="field">
                      <label>Rua e número</label>
                      <input type="text" disabled value="<s:property value='address' />">
                  </div>
                  <div class="field">
                      <label>Preço</label>
                      <input type="text" disabled value="<s:property value='price' />">
                  </div>
              </div>
              <h4 class="ui dividing header">Informações do proprietário</h4>
              <div class="field">
                <label>Nome</label>
                <input type="text" disabled value="<s:property value='owner' />">
              </div>
              <div class="two fields">
                <div class="field">
                  <label>Email</label>
                  <input type="text" disabled value="<s:property value='owner_email' />">
                </div>
                <div class="field">
                  <label>Telefone</label>
                  <input type="text" disabled value="<s:property value='owner_phone' />">
                </div>
              </div>
              <h4 class="ui dividing header">Informações do imóvel</h4>
              <div class="field">
                <label>Nome do corretor</label>
                <input type="text" disabled value="<s:property value='realtor' />">
              </div>
              <div class="ui segment">
                <div class="field">
                  <div class="ui toggle checkbox">
                    <input type="checkbox" id="funded-<s:property value='id' />" disabled>
                    <label>Imóvel é financiado</label>
                  </div>
                </div>
                <div class="field">
                  <div class="ui toggle checkbox">
                    <input type="checkbox" id="owns-<s:property value='id' />" disabled>
                    <label>Imóvel está no nome do dono</label>
                  </div>
                </div>
                <div class="field">
                  <div class="ui toggle checkbox">
                    <input type="checkbox" id="trade-<s:property value='id' />" disabled>
                    <label>Proprietário aceita negociação</label>
                  </div>
                </div>
              </div>
              <script>
                $('#funded-<s:property value="id" />').prop('<s:property value="funded" />', true)
                $('#owns-<s:property value="id" />').prop('<s:property value="owns" />', true)
                $('#trade-<s:property value="id" />').prop('<s:property value="trade" />', true)
              </script>
              </form>
            </div>
          </div>
        </s:iterator>  

      </div>
    </div>
    <a href="property"><button class="circular ui icon big button floating-button">
      <i class="icon plus"></i>
    </button></a>
    <div id="dynamic" style="display: hidden"></div>
  </div>

</body>
</html>

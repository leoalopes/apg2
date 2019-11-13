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
  .grid {
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
    top: 15px;
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
  </style>

</head>

<script>
  function openSidebar() {
    $('.ui.sidebar').sidebar('toggle')
  }
  window.onload = function() {
	  $('.ui.checkbox').checkbox()
  }
</script>

<body>

  <div class="ui sidebar inverted vertical menu">
    <h2 class="ui center aligned header" style="margin-top: 10px; color: #1EB3FD;"><b>Filtros</b></h2>
    <div class="item">
      <div style="color: #1EB3FD" class="ui center aligned">Endereço</div><br>
      <div class="ui input">
        <input type="text">
      </div>
    </div>
    <div class="item">
      <div class="ui input" style="display: flex; align-items: center;">
        <span style="color: #1eb3fd">Preço mínimo</span> <input type="number" placeholder="R$">
      </div>
    </div>
    <div class="item">
      <div class="ui input" style="display: flex; align-items: center;">
        <span style="color: #1eb3fd">Preço máximo</span> <input type="number" placeholder="R$">
      </div>
    </div>
    <div class="item">
      <div style="color: #1EB3FD" class="ui center aligned">Corretor</div><br>
      <div class="ui input">
        <input type="text">
      </div>
    </div>
    <div class="item">
      <div style="color: #1EB3FD" class="ui center aligned">Dono</div><br>
      <div class="ui input">
        <input type="text">
      </div>
    </div>
    <div class="item">
      <div class="ui segment">
        <div class="ui toggle checkbox">
          <input type="checkbox" id="funded" name="funded">
          <label>Financiado</label>
        </div>
        <div class="ui toggle checkbox" style="margin-top: 10px">
          <input type="checkbox" id="owns" name="owns">
          <label>No nome do dono</label>
        </div>
        <div class="ui toggle checkbox" style="margin-top: 10px">
          <input type="checkbox" id="trade" name="trade">
          <label>Negociável</label>
        </div>
      </div>
    </div>
    <button class="ui right labeled icon button filter-btn">
      <i class="right search icon"></i>
      Filtrar
    </button>
  </div>
  <div class="dimmed pusher">
    <div class="ui fixed inverted first menu">
      <div class="item" onclick="openSidebar()" style="margin-left: 5px; cursor: pointer;">
        <i class="bars icon"></i>
      </div>
      <a href="home" class="item">
        Imobiliária
      </a>
      <div class="item">
        <div class="ui transparent icon input">
          <input type="text" style="color: white" placeholder="Search...">
          <i style="color: white" class="search link icon"></i>
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

      <div class="grid">

        <div class="location" style="width: 220px">
          <div class="ui link card">
            <div class="image">
              <img src="https://a0.muscache.com/im/pictures/15273358/d7329e9a_original.jpg?aki_policy=xx_large">
            </div>
            <div class="content">
              <a class="header">Lugar daora</a>
              <div class="meta">
                <span class="date">R$ 250</span>
              </div>
            </div>
            <div class="extra content">
              Leonardo Lopes<br>
              (51) 99999-9999
            </div>
          </div>
        </div>

        <div class="location" style="width: 220px">
          <div class="ui link card">
            <div class="image">
              <img src="https://a0.muscache.com/im/pictures/15273358/d7329e9a_original.jpg?aki_policy=xx_large">
            </div>
            <div class="content">
              <a class="header">Lugar daora</a>
              <div class="meta">
                <span class="date">R$ 250</span>
              </div>
            </div>
            <div class="extra content">
              Leonardo Lopes<br>
              (51) 99999-9999
            </div>
          </div>
        </div>

        <div class="location" style="width: 220px">
          <div class="ui link card">
            <div class="image">
              <img src="https://a0.muscache.com/im/pictures/15273358/d7329e9a_original.jpg?aki_policy=xx_large">
            </div>
            <div class="content">
              <a class="header">Lugar daora</a>
              <div class="meta">
                <span class="date">R$ 250</span>
              </div>
            </div>
            <div class="extra content">
              Leonardo Lopes<br>
              (51) 99999-9999
            </div>
          </div>
        </div>

        <div class="location" style="width: 220px">
          <div class="ui link card">
            <div class="image">
              <img src="https://a0.muscache.com/im/pictures/15273358/d7329e9a_original.jpg?aki_policy=xx_large">
            </div>
            <div class="content">
              <a class="header">Lugar daora</a>
              <div class="meta">
                <span class="date">R$ 250</span>
              </div>
            </div>
            <div class="extra content">
              Leonardo Lopes<br>
              (51) 99999-9999
            </div>
          </div>
        </div>

        <div class="location" style="width: 220px">
          <div class="ui link card">
            <div class="image">
              <img src="https://a0.muscache.com/im/pictures/15273358/d7329e9a_original.jpg?aki_policy=xx_large">
            </div>
            <div class="content">
              <a class="header">Lugar daora</a>
              <div class="meta">
                <span class="date">R$ 250</span>
              </div>
            </div>
            <div class="extra content">
              Leonardo Lopes<br>
              (51) 99999-9999
            </div>
          </div>
        </div>

        <div class="location" style="width: 220px">
          <div class="ui link card">
            <div class="image">
              <img src="https://a0.muscache.com/im/pictures/15273358/d7329e9a_original.jpg?aki_policy=xx_large">
            </div>
            <div class="content">
              <a class="header">Lugar daora</a>
              <div class="meta">
                <span class="date">R$ 250</span>
              </div>
            </div>
            <div class="extra content">
              Leonardo Lopes<br>
              (51) 99999-9999
            </div>
          </div>
        </div>

        <div class="location" style="width: 220px">
          <div class="ui link card">
            <div class="image">
              <img src="https://a0.muscache.com/im/pictures/15273358/d7329e9a_original.jpg?aki_policy=xx_large">
            </div>
            <div class="content">
              <a class="header">Lugar daora</a>
              <div class="meta">
                <span class="date">R$ 250</span>
              </div>
            </div>
            <div class="extra content">
              Leonardo Lopes<br>
              (51) 99999-9999
            </div>
          </div>
        </div>
        
      </div>
    </div>
    <a href="property"><button class="circular ui icon big button floating-button">
      <i class="icon plus"></i>
    </button></a>
  </div>

</body>
</html>
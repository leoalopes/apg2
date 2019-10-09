<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
  </style>

</head>

<script>
  function openSidebar() {
    $('.ui.sidebar').sidebar('toggle')
  }
</script>

<body>

  <div class="ui sidebar inverted vertical menu">
    <h2 class="ui center aligned header" style="margin-top: 10px; color: #1BE3FD">Filtros</h1>
    <a class="item">
      1
    </a>
    <a class="item">
      2
    </a>
    <a class="item">
      3
    </a>
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
    </div>

    <div class="container">
      <h1 class="ui center aligned header">Explore os imóveis próximos de você</h1>

      <div class="grid">

        <div class="location" style="width: 220px">
          <div class="ui card">
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
          <div class="ui card">
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
          <div class="ui card">
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
          <div class="ui card">
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
          <div class="ui card">
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
          <div class="ui card">
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
          <div class="ui card">
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
  </div>

</body>
</html>
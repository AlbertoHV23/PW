<%-- 
    Document   : login
    Created on : 6/11/2020, 09:02:24 PM
    Author     : alber
--%>

<%@page import="com.pw.dbconnection.models.tbl_categoria"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="https://kit.fontawesome.com/64d58efce2.js"crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="assets/CSS/LoginRes.css">
    <title>Nuevo Login</title>
  </head>
  <body>
    <div class="container">
      <div class="forms-container">
        <div class="signin-signup">
            <!-- INICIO DE SESION -->
          <form action="./UsuarioController" method="GET" enctype="multipart/form-data" class="sign-in-form">
            <h2 class="title">Inicia sesión</h2>
            <label for="tipo">Tipo:</label>
              <select name="tipo" id="tipo"  class="selector">
                <option value="Normal" selected>Normal</option>
                <option value="Creador">Creador de contenido</option>
                <option value="Moderador">Moderador</option>
                <option value="Editor">Editor</option>
              </select>
            <div class="input-field">
              <i class="fas fa-user"></i>
              <input type="text" name="usuario" id="usuario" placeholder="Nombre de usuario" />
            </div>
            <div class="input-field">
              <i class="fas fa-lock"></i>
              <input type="password" name="contra" id="contra" placeholder="Contraseña" />
            </div>
            <input type="submit" value="Inicia sesión" class="btn solid" />
            <p class="social-text">o inicia sesión con una red social.</p>
            <div class="social-media">
              <a href="#" class="social-icon">
                <i class="fab fa-facebook-f"></i>
              </a>
              <a href="#" class="social-icon">
                <i class="fab fa-twitter"></i>
              </a>
              <a href="#" class="social-icon">
                <i class="fab fa-google"></i>
              </a>
              <a href="#" class="social-icon">
                <i class="fab fa-linkedin-in"></i>
              </a>
            </div>
          </form>


          <!-- REGISTRO -->
          <form action="./UsuarioController" method="POST" enctype="multipart/form-data" class="sign-up-form">
            <h2 class="title">Registro</h2>
            <label for="tipo">Tipo:</label>
              <select class="selector" name="rol" id="rol">
                <option value="Normal" selected>Normal</option>
                <option value="Creador">Creador de contenido</option>
                <option value="Moderador">Moderador</option>
                <option value="Editor">Editor</option>
              </select>
            <div class="input-field">
              <i class="fas fa-user"></i>
              <input type="text" name="username" id="username" placeholder="Nombre de usuario" />
            </div>
            <div class="input-field">
              <i class="fas fa-envelope"></i>
              <input type="email" name="email" id="email" placeholder="Email" />
            </div>
            <div class="input-field">
              <i class="fas fa-lock"></i>
              <input type="password" name="password" id="password" placeholder="Contraseña" />
            </div>
            <input type="submit" class="btn" value="Registrarse" />
            <p class="social-text">o regístrate con una red social.</p>
            <div class="social-media">
              <a href="#" class="social-icon">
                <i class="fab fa-facebook-f"></i>
              </a>
              <a href="#" class="social-icon">
                <i class="fab fa-twitter"></i>
              </a>
              <a href="#" class="social-icon">
                <i class="fab fa-google"></i>
              </a>
              <a href="#" class="social-icon">
                <i class="fab fa-linkedin-in"></i>
              </a>
            </div>
          </form>
        </div>
      </div>

      <div class="panels-container">
        <div class="panel left-panel">
          <div class="content">
            <h3>¿Eres nuevo?</h3>
            <p>
              Crea una cuenta y comienza a disfrutar de las mejores noticias y contenido sobre videojuegos,
              !Hecho por Gamers para Gamers;)¡
            </p>
            <button class="btn transparent" id="sign-up-btn">
              Registrate
            </button>
          </div>
          <img src="assets/IMG/LoginSVG/Register.svg" class="image" alt="" />
        </div>
        <div class="panel right-panel">
          <div class="content">
            <h3>¿Eres uno de nosotros?</h3>
            <p>
              Hola Gamer, ¿Qué hay de nuevo?, ¿no sabes?, miralo tu mismo Inicia sesión:D
            </p>
            <button class="btn transparent" id="sign-in-btn">
              Inicia Sesión
            </button>
          </div>
          <img src="assets/IMG/LoginSVG/verificar.svg" class="image" alt="" />
        </div>
      </div>
    </div>

    <script src="assets/Js/move.js"></script>
  </body>
</html>

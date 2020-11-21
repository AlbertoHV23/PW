<%-- 
    Document   : noticia
    Created on : 7/11/2020, 05:42:16 PM
    Author     : geraj
--%>
<%@page import="com.pw.dbconnection.models.tbl_categoria"%>
<%@page import="com.pw.dbconnection.models.tbl_comentario_a_comentario"%>
<%@page import="com.pw.dbconnection.models.tbl_comentarios"%>
<%@page import="java.util.List"%>
<%@page import="com.pw.dbconnection.models.tbl_usuarios"%>
<%@page import="com.pw.dbconnection.models.tbl_noticia"%>
<%
    List<tbl_comentarios> comentarios = (List<tbl_comentarios>)request.getAttribute("comentarios");
    List<tbl_categoria> categoria = (List<tbl_categoria>)request.getAttribute("categoria");
%>
<%
    tbl_noticia noticia = (tbl_noticia)request.getAttribute("noticia");
    tbl_usuarios usuario = (tbl_usuarios)request.getAttribute("datos");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
    integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
  <script src="https://kit.fontawesome.com/64d58efce2.js" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="assets/CSS/Noticia.css">
  <title>Time to play</title>
  <link rel="shortcut icon" href="assets/IMG/Optimizadas/ico.ico" />
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
</head>

<body>
    <nav class="navbar navbar-expand-sm navbar-dark bg-dark">
            <a class="navbar-brand" href="PrincipalController"><img src="assets/IMG/Optimizadas/logo.png" width="100px" alt="Logo"></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
          
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
              <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                  <a class="nav-link" href="PrincipalController"><i class="fas fa-home"></i> Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item dropdown">
                  <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <i class="fas fa-list"></i> Category
                  </a>
                  <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                       <%for(tbl_categoria cat : categoria){%>
                        <a class="dropdown-item" href="Buscar?ID=<%=cat.getNombre()%>"><%= cat.getNombre() %></a>
                        <%}%>
                  </div>
                </li>
                 <%if(usuario.getUsername().equals("Anonimo")) {%>
                <li class="nav-item">
                    <a class="nav-link" href="UsuarioController"><i class="fas fa-sign-in-alt"></i> Login</a>
                </li>
                  <%}%>
                <li class="nav-item dropdown">
                   
                      <%if(usuario.getUsername().equals("Anonimo")) {%>
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <img src="assets/IMG/Avatars/anonimo.jpg" alt="" class="rounded-circle" style="height: 30px;">  <%= usuario.getUsername() %>
                    </a>
                     <%} else{ %>
                     <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <img src="<%= usuario.getImagen()%>" alt="" class="rounded-circle" style="height: 30px;">  <%= usuario.getUsername() %>
                    </a>
                    <%}%>
                     
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                      <%if(!usuario.getRol().equals("Anonimo")) {%>
                      <a class="dropdown-item" href="EditarUsuario">Profile</a>
                      <%}%>
                      
                      <%if(usuario.getRol().equals("Creador")) {%>
                      <a class="dropdown-item" href="PublicarNoticia">Create News</a>
                      <a class="dropdown-item" href="AceptadasRechazadas">View News</a>
                      <a class="dropdown-item" href="Noticias_marcadas">Marked</a>
                      <a class="dropdown-item" href="#">Notifications<span class="badge badge-light">9</span></a>
                      <div class="dropdown-divider"></div>
                      <%}%>
                      
                        <%if(usuario.getRol().equals("Normal")) {%>
                      <a class="dropdown-item" href="Noticias_marcadas">Marked</a>
                      <a class="dropdown-item" href="#">Notifications<span class="badge badge-light">9</span></a>
                      <div class="dropdown-divider"></div>
                      <%}%>
                      
                       <%if(usuario.getRol().equals("Editor")) {%>
                       <a class="dropdown-item" href="EditarNoticia">Published</a>
                       <a class="dropdown-item" href="Noticias_marcadas">Marked</a>
                       <a class="dropdown-item" href="#">Notifications<span class="badge badge-light">9</span></a>
                       <div class="dropdown-divider"></div>
                       <%}%>
                       
                       <%if(usuario.getRol().equals("Moderador")) {%>
                       <a class="dropdown-item" href="PublicarNoticia">Create News</a>
                      <a class="dropdown-item" href="AceptadasRechazadas">View News</a>
                       <a class="dropdown-item" href="EditarNoticia">Published</a>
                       <a class="dropdown-item" href="Noticias_marcadas">Marked</a>
                       <a class="dropdown-item" href="#">Notifications<span class="badge badge-light">9</span></a>
                       <div class="dropdown-divider"></div>
                       <%}%>
                       
                          <%if(usuario.getRol().equals("Administrador")) {%>
                       <a class="dropdown-item" href="PublicarNoticia">Create News</a>
                      <a class="dropdown-item" href="AceptadasRechazadas">View News</a>
                       <a class="dropdown-item" href="EditarNoticia">Published</a>
                       <a class="dropdown-item" href="Noticias_marcadas">Marked</a>
                       <a class="dropdown-item" href="#">Notifications<span class="badge badge-light">9</span></a>
                       <div class="dropdown-divider"></div>
                       <%}%>
                       
                       
                     
                      <a class="dropdown-item" href="UsuarioController">Sign off</a>
                    </div>
                  </li>
              </ul>
              <form class="form-inline my-2 my-lg-0" action="Buscar" method="POST">
                <input class="form-control mr-sm-2" name ="palabra" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-info my-2 my-sm-0" type="submit">Search</button>
              </form>
            </div>
        </nav>

  <main>
    <div class="container">
      <section class="imagenes">
        <div class="col-md-3 mx-auto mb-4 separador-imagenes">
          <h6 class="text-uppercase text-center text-white mt-3 font-weight-bold"><%= noticia.getTitulo() %></h6>
          <hr class="bg-info text-center mt-0 mx-auto">
        </div>

        <div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
          <ol class="carousel-indicators">
            <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
            <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
          </ol>
          <div class="carousel-inner mb-3 mt-3">
            <div class="carousel-item active">
              <img src="<%= noticia.imagenes.get(0).getExtencion()%>" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
              <img src="<%=noticia.imagenes.get(1).getExtencion()%>" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
              <img src="<%= noticia.imagenes.get(2).getExtencion()%>" class="d-block w-100" alt="...">
            </div>
          </div>
          <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
        </div>
      </section>

      <section class="videos">
        <div class="col-md-3 mx-auto mb-4 separador-videos">
          <h6 class="text-uppercase text-center text-white mt-3 font-weight-bold">videos</h6>
          <hr class="bg-info text-center mt-0 mx-auto">
        </div>

        <iframe class="d-block w-100 mb-3" width="560" height="315" src="<%=noticia.video%>" frameborder="0"
          allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
          allowfullscreen></iframe>
      </section>

      <section class="Informacion">
        <div class="col-md-3 mx-auto mb-4 separador-info">
          <h6 class="text-uppercase text-center text-white mt-3 font-weight-bold">information</h6>
          <hr class="bg-info text-center mt-0 mx-auto">
        </div>

        <div class="card w-100 mb-3" style="width: 18rem;">
          <div class="card-body">
            <h5 class="card-title"><%= noticia.getTitulo() %></h5>
          </div>
          <ul class="list-group list-group-flush">
            <li class="list-group-item">
              <h6 class="card-title">Short description:</h6>
              <p class="card-text"><%= noticia.getDescripcion_corta()%></p>
            </li>
            <li class="list-group-item">
              <h6 class="card-title">Long description:</h6>
              <p class="card-text"><%= noticia.getDescripcion_larga()%></p>
            </li>
            <li class="list-group-item">
              <h6 class="card-title">Category:</h6>
              <p class="card-text"><%=noticia.getCategoria()%></p>
            </li>
            <li class="list-group-item text-center">
              <a href="PaginaNoticia?Si=<%=noticia.getId_noticia()%>" class="btn btn-primary">Mark</a>
            </li>
            <li class="list-group-item">
              <div class="card-body">
                <div class="votating">
                  <button id="like">
                    <i class="fas fa-thumbs-up"></i>
                  </button>
                  <input type="number" id="input1" value="0" name="">
                  <button id="dislike">
                    <i class="fas fa-thumbs-down"></i>
                  </button>
                  <input type="number" id="input2" value="0" name="">
                </div>
              </div>
            </li>
          </ul>
        </div>

        <div class="col-md-3 mx-auto mb-4 separador-comentarios">
          <h6 class="text-uppercase text-center text-white mt-3 font-weight-bold">Comments</h6>
          <hr class="bg-info text-center mt-0 mx-auto">
        </div>

        <div class="row justify-content-center">
          <div class="col">
            <%if(usuario.isActivo() == true){%>
            <form action="./PaginaNoticia" method="POST">
              <div class="form-group d-flex justify-content-end flex-wrap">
                <input type="password" name="password" id="password" value="<%=noticia.getId_noticia()%>"
                  style="display: none" />
                <textarea class="form-control" id="comentario" name="comentario" rows="3"></textarea>
                <input type="submit" class="btn btn-primary" value="Comentar" />
              </div>
            </form>
           
            <%if(comentarios != null){%>  
                 <%for(tbl_comentarios comen : comentarios){%>
            <div class="media">
              <img src="<%=comen.getImagen()%>" width="64" height="64" alt="">
              <div class="media-body">
                <p class="nombre"><%=comen.getUsername()%> <span>1:00</span></p>
                <p class="comentario"><%=comen.getComentario()%>
                </p>
                <div class="botones text-right">
                  <p>
                    <a data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false"
                      aria-controls="collapseExample">
                      Responder
                    </a>
                  </p>
                  <form action="./ComentariosComentarios" method="">
                  <div class="collapse" id="collapseExample">
                    <input type="password" name="password" id="password" value="<%=comen.getId_comentario()%>"
                    style="display: none"/>
                     <input type="password" name="id_noti" id="password" value="<%=noticia.getId_noticia()%>"
                    style="display: none"/>
                    <textarea class="form-control" id="comentario" name="comentario" rows="3"></textarea>
                    <input type="submit" class="btn btn-primary" value="Comentar" />
                  </div>
                  </form>
                     <%if(usuario.getRol().equals("Moderador")){%>
                  <form action="./Bloquear" method="GET">
                      <input type="password" name="id_comentario" id="id_comentario" value="<%=comen.getId_comentario()%>"
                        style="display: none"/>
                      <input type="password" name="id_noticia" id="id_noticia" value="<%=noticia.getId_noticia()%>"
                        style="display: none"/>
                       <input type="password" name="id_usuario" id="id_noticia" value="<%=comen.getFk_usuario()%>"
                        style="display: none"/>
                      <button href="" style="background: transparent; color: white;border: none !important; font-size: 15px">Bloquear</button>
                  </form>
                        <%}%>
                  <!-- AQUI LA RESPUESTA -->
                         <%if(comen.respuestas != null){%>  
                              <%for(tbl_comentario_a_comentario res : comen.respuestas){%>
                              <div class="media">
                                        <img src="<%=res.getImagen()%>" width="24" height="24" alt="">
                                        <div class="media-body text-left">
                                        
                                          <p class="nombre" ><%=res.getUsername()%> <span>1:00</span></p>
                                          <p class="comentario"><%=res.getComentario()%> </p>

                                        </div>
                               </div>
                                <%}%>
                         <%}%>
                </div>
              </div>
            </div>
                <%}%>
            <%}%>
            <%}%>
          </div>
        </div>
      </section>
    </div>
  </main>

      <footer class="footer-page bg-dark">
                  <div class="bg-info">
                      <div class="container">
                          <div class="row py-4 d-flex align-items-center">

                              <div class="col-md-12 text-center font-weight=10px">
                                  <a href="https://www.facebook.com/SoyalbertoHdz/" target="_blank"><i class="fab fa-facebook text-white mr-4"></i></a>
                                  <a href="https://www.instagram.com/_albertohv/" target="_blank"><i class="fab fa-instagram text-white mr-4"></i></a>
                                  <a href="https://twitter.com/" target="_blank"><i class="fab fa-twitter text-white mr-4"></i></a>
                                  <a href="https://api.whatsapp.com/send?phone=811902450" target="_blank"><i class="fab fa-whatsapp text-white mr-4"></i></a>
                                  <a href="mailto:albertho0.hdzv@gmail.com" target="_blank"><i class="fab fa-google-plus-g text-white mr-4"></i></a>
                              </div>
                          </div>
                      </div>
                  </div>
                  <div class="container text-center text-md-left mt-5">
                      <div class="row">

                        <div class="col-md-3 mx-auto mb-4 pagina">
                            <h6 class="text-uppercase font-weight-bold" style="color: black">Time to play</h6>
                            <hr class="bg-info mb-4 mt-0 d-inline-block mx-auto" >
                            <p class="mt-2" style="color: gainsboro">This page was made by Alberto Daniel Hernandez Villanueva & Luis Gerardo Becerra Jiménez from LMAD for the <i class="fas fa-globe-americas text-info"></i>.</p>
                        </div>

                        <div class="col-md-3 mx-auto mb-4 contact">
                            <h6 class="text-uppercase font-weight-bold" style="color: black">Contact</h6>
                            <hr class="bg-info mb-4 mt-0 d-inline-block mx-auto">
                            <ul class="list-unstyled">
                                <li class="my-2"style="color: gainsboro" ><i class="fas fa-home text-info" ></i> Monterrey,Nuevo León</li>
                                <li class="my-2" style="color: gainsboro"><i class="fas fa-envelope text-info"></i> timetoplay@gmail.com</li>
                                <li class="my-2"style="color: gainsboro"><i class="fas fa-phone text-info" ></i> +528119024150</li>
                            </ul>
                        </div>

                      </div>
                  </div>
                  <div class="footer-copyright text-center py-3">
                    <p style="color: gainsboro">&copy;Copyright
                        <a href="#">timetoplay.com</a>
                    </p>
                    <p style="color: black">Designed By Time To Play</p>
                </div>
        </footer>

  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
    integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
    crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
    crossorigin="anonymous"></script>
  <script src="assets/Js/noticia.js"></script>
</body>

</html>
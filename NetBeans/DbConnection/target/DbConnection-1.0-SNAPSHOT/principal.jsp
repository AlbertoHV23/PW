<%-- 
    Document   : principal
    Created on : 6/11/2020, 08:40:01 PM
    Author     : alber
--%>

<%@page import="com.pw.dbconnection.models.tbl_noticia"%>
<%@page import="com.pw.dbconnection.models.tbl_usuarios"%>
<%@page import="java.util.List"%>
<%@page import="com.pw.dbconnection.models.tbl_categoria"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List<tbl_categoria> categoria = (List<tbl_categoria>)request.getAttribute("categoria");
    List<tbl_noticia> noticias = (List<tbl_noticia>)request.getAttribute("noticias");
%>
<%
    tbl_usuarios usuario = (tbl_usuarios)request.getAttribute("datos");
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/64d58efce2.js"crossorigin="anonymous"></script>
    <link rel="stylesheet" href="assets/CSS/Principal.css">
    <title>Time to play</title>
  </head>
  <body>
        <nav class="navbar navbar-expand-sm navbar-dark bg-dark">
            <a class="navbar-brand" href="principal.jsp"><img src="assets/IMG/Optimizadas/logo.png" width="100px" alt="Logo"></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
          
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
              <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                  <a class="nav-link" href="principal.jsp"><i class="fas fa-home"></i> Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item dropdown">
                  <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <i class="fas fa-list"></i> Category
                  </a>
                  <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                       <%for(tbl_categoria cat : categoria){%>
                        <div class="dropdown-divider"></div>
                        <a><%= cat.getNombre() %></a>
                        <%}%>
                  </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="login.jsp"><i class="fas fa-sign-in-alt"></i> Login</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class="fas fa-user-circle"></i> <%= usuario.getUsername() %>
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                      <a class="dropdown-item" href="perfil.jsp">Profile</a>
                      <a class="dropdown-item" href="crear.jsp">Create News</a>
                      <a class="dropdown-item" href="publicadas.jsp">Published</a>
                      <a class="dropdown-item" href="marcados.jsp">Marked</a>
                      <a class="dropdown-item" href="#">Notifications<span class="badge badge-light">9</span></a>
                      <div class="dropdown-divider"></div>
                      <a class="dropdown-item" href="#">Sign off</a>
                    </div>
                  </li>
              </ul>
              <form class="form-inline my-2 my-lg-0">
                <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-info my-2 my-sm-0" type="submit">Search</button>
              </form>
            </div>
        </nav>

        <main>

            <div class="col-md-3 mx-auto mb-4 separador-featured">
                <h6 class="text-uppercase text-center text-white mt-0 font-weight-bold">featured</h6>
                <hr class="bg-info text-center mt-0 mx-auto">
            </div>

            <div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                  <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
                  <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
                  <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
                </ol>
                <div class="carousel-inner">
                  <div class="carousel-item active">
                    <a href="noticia.jsp"><img src="assets/IMG/Optimizadas/ratched.jpg" class="d-block w-100" alt="..."></a>
                    <div class="carousel-caption d-none d-md-block">
                        <a href="f"><h5>Title of the news</h5></a>
                      <p>Nulla vitae elit libero, a pharetra augue mollis interdum.</p>
                    </div>
                  </div>
                  <div class="carousel-item">
                    <a href="noticia.jsp"><img src="assets/IMG/Optimizadas/fornite.png" class="d-block w-100" alt="..."></a>
                    <div class="carousel-caption d-none d-md-block">
                        <a href="noticia.jsp"><h5>Title of the news</h5></a>
                      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                    </div>
                  </div>
                  <div class="carousel-item">
                    <a href="noticia.jsp"><img src="assets/IMG/Optimizadas/odessey.jpg" class="d-block w-100" alt="..."></a>
                    <div class="carousel-caption d-none d-md-block">
                        <a href="noticia.jsp"><h5>Title of the news</h5></a>
                      <p>Praesent commodo cursus magna, vel scelerisque nisl consectetur.</p>
                    </div>
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

            <div class="container noticias">
                
                <div class="col-md-3 mx-auto mb-4 mt-4 separador-news">
                    <h6 class="text-uppercase text-center  text-white font-weight-bold">news</h6>
                    <hr class="bg-info text-center mt-0 mx-auto">
                </div>

                    <section class="todas">
                     
                      <section class="aventura">
                        <div class="col-md-3 mx-auto mb-4 separador-aventura">
                          <h6 class="text-uppercase text-center  text-white font-weight-bold">adventure</h6>
                          <hr class="bg-info text-center mt-0 mx-auto">
                      </div>
                        <div class="row">
                          <%for(tbl_noticia noti : noticias){%>
                          <div class="col-sm-4">
                            <div class="card bg-dark mb-2" style="width: 18rem;">
                              <a href="noticia.jsp"><img src="assets/IMG/image1605164565585.jpg" class="card-img-top" alt="..."></a>
                              <div class="card-body">
                                <h5 class="card-title"><%= noti.getTitulo()%></h5>
                                <p class="card-text"><%= noti.getDescripcion_corta()%></p>
                                <a href="noticia.jsp" class="btn btn-primary">See news</a>
                              </div>
                            </div>
                          </div>  
                          <%}%>                   
                        </div>
                      </section>
                       
                     
                      <section class="fps">
                        <div class="col-md-3 mx-auto mb-4 separador-fps">
                          <h6 class="text-uppercase text-center  text-white font-weight-bold">fps</h6>
                          <hr class="bg-info text-center mt-0 mx-auto">
                      </div>
                        <div class="row">
                          <div class="col-sm-4">
                            <div class="card bg-dark mb-2" style="width: 18rem;">
                              <a href="noticia.jsp"><img src="assets/IMG/Optimizadas/fornite.png" class="card-img-top" alt="..."></a>
                              <div class="card-body">
                                <h5 class="card-title">Title of the news</h5>
                                <p class="card-text">Short description: Here is the short description of the news.</p>
                                <a href="noticia.jsp" class="btn btn-primary">See news</a>
                              </div>
                            </div>
                          </div>
                          <div class="col-sm-4">
                            <div class="card bg-dark mb-2" style="width: 18rem;">
                              <a href="noticia.jsp"><img src="assets/IMG/Optimizadas/fornite.png" class="card-img-top" alt="..."></a>
                              <div class="card-body">
                                <h5 class="card-title">Title of the news</h5>
                                <p class="card-text">Short description: Here is the short description of the news.</p>
                                <a href="noticia.jsp" class="btn btn-primary">See news</a>
                              </div>
                            </div>
                          </div>
                          <div class="col-sm-4">
                            <div class="card bg-dark mb-2" style="width: 18rem;">
                              <a href="noticia.jsp"><img src="assets/IMG/Optimizadas/fornite.png" class="card-img-top" alt="..."></a>
                              <div class="card-body">
                                <h5 class="card-title">Title of the news</h5>
                                <p class="card-text">Short description: Here is the short description of the news.</p>
                                <a href="noticia.jsp" class="btn btn-primary">See news</a>
                              </div>
                            </div>
                          </div>
                        </div>
                      </section>

                     
                      <section class="accion">
                        <div class="col-md-3 mx-auto mb-4 separador-accion">
                          <h6 class="text-uppercase text-center  text-white font-weight-bold">action</h6>
                          <hr class="bg-info text-center mt-0 mx-auto">
                      </div>
                        <div class="row">
                          <div class="col-sm-4">
                            <div class="card bg-dark mb-2" style="width: 18rem;">
                              <a href="noticia.jsp"><img src="assets/IMG/Optimizadas/odessey.jpg" class="card-img-top" alt="..."></a>
                              <div class="card-body">
                                <h5 class="card-title">Title of the news</h5>
                                <p class="card-text">Short description: Here is the short description of the news.</p>
                                <a href="noticia.jsp" class="btn btn-primary">See news</a>
                              </div>
                            </div>
                          </div>
                          <div class="col-sm-4">
                            <div class="card bg-dark mb-2" style="width: 18rem;">
                              <a href="noticia.jsp"><img src="assets/IMG/Optimizadas/odessey.jpg" class="card-img-top" alt="..."></a>
                              <div class="card-body">
                                <h5 class="card-title">Title of the news</h5>
                                <p class="card-text">Short description: Here is the short description of the news.</p>
                                <a href="noticia.jsp" class="btn btn-primary">See news</a>
                              </div>
                            </div>
                          </div>
                          <div class="col-sm-4">
                            <div class="card bg-dark mb-2" style="width: 18rem;">
                              <a href="noticia.jsp"><img src="assets/IMG/Optimizadas/odessey.jpg" class="card-img-top" alt="..."></a>
                              <div class="card-body">
                                <h5 class="card-title">Title of the news</h5>
                                <p class="card-text">Short description: Here is the short description of the news.</p>
                                <a href="noticia.jsp" class="btn btn-primary">See news</a>
                              </div>
                            </div>
                          </div>
                        </div>
                      </section>
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
                            <h6 class="text-uppercase font-weight-bold">Time to play</h6>
                            <hr class="bg-info mb-4 mt-0 d-inline-block mx-auto">
                            <p class="mt-2">This page was made by Alberto Daniel Hernandez Villanueva & Luis Gerardo Becerra Jiménez from LMAD for the <i class="fas fa-globe-americas text-info"></i>.</p>
                        </div>

                        <div class="col-md-3 mx-auto mb-4 contact">
                            <h6 class="text-uppercase font-weight-bold">Contact</h6>
                            <hr class="bg-info mb-4 mt-0 d-inline-block mx-auto">
                            <ul class="list-unstyled">
                                <li class="my-2"><i class="fas fa-home text-info"></i> Monterrey,Nuevo León</li>
                                <li class="my-2"><i class="fas fa-envelope text-info"></i> timetoplay@gmail.com</li>
                                <li class="my-2"><i class="fas fa-phone text-info"></i> +528119024150</li>
                            </ul>
                        </div>

                      </div>
                  </div>
                  <div class="footer-copyright text-center py-3">
                    <p>&copy;Copyright
                        <a href="#">timetoplay.com</a>
                    </p>
                    <p>Designed By Time To Play</p>
                </div>
        </footer>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
  </body>
</html>
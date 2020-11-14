<%-- 
    Document   : noticia
    Created on : 7/11/2020, 05:42:16 PM
    Author     : geraj
--%>
<%@page import="com.pw.dbconnection.models.tbl_noticia"%>
<%
    tbl_noticia noticia = (tbl_noticia)request.getAttribute("noticia");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/64d58efce2.js"crossorigin="anonymous"></script>
    <link rel="stylesheet" href="assets/CSS/Noticia.css">
    <title>Time to play</title>
  </head>
  <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
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
                    <a class="dropdown-item" href="#">Action</a>
                    <a class="dropdown-item" href="#">Adventure</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#">Arcade</a>
                  </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="login.jsp"><i class="fas fa-sign-in-alt"></i> Login</a>
                </li>
                <li class="nav-item dropdown">
                  <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      <i class="fas fa-user-circle"></i> Profile
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
    
                    <iframe  class="d-block w-100 mb-3" width="560" height="315" src="<%=noticia.video%>" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
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
                                <a href="" class="btn btn-primary">Mark</a>
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
                        <form>
                          <div class="form-group d-flex justify-content-end flex-wrap">
                            <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
                            <button class="btn btn-primary mt-3" type="button">Comentar</button>
                          </div>
                        </form>
                        <div class="media">
                          <img src="/IMG/logox.png" width="64" height="64" alt="">
                          <div class="media-body">
                            <p class="nombre">Nombre de usuario <span>1:00</span></p>
                            <p class="comentario">Lorem ipsum dolor sit, amet consectetur adipisicing elit. 
                              Ipsa illo atque delectus perspiciatis libero quae neque, odit, aperiam, omnis 
                              necessitatibus officia placeat labore? Saepe consectetur nisi fugiat enim totam 
                              inventore.
                            </p>
                            <div class="botones text-right">
                              <p>
                                <a data-toggle="collapse" href="#collapse" role="button" aria-expanded="false" aria-controls="collapse">
                                  Responder
                                </a>
                              </p>
                              <div class="collapse" id="collapse">
                                <textarea class="form-control" id="FormControlTextarea" rows="3"></textarea>
                                <button class="btn btn-primary mt-3" type="button">Comentar</button>
                              </div>
                              <a href="#">Bloquear</a>
                            </div>
                            <div class="media">
                              <img src="/IMG/logox.png" width="64" height="64" alt="">
                              <div class="media-body">
                                <p class="nombre">Nombre de usuario <span>1:00</span></p>
                                <p class="comentario">Lorem ipsum dolor sit, amet consectetur adipisicing elit. 
                                  Ipsa illo atque delectus perspiciatis libero quae neque, odit, aperiam, omnis 
                                  necessitatibus officia placeat labore? Saepe consectetur nisi fugiat enim totam 
                                  inventore.
                                </p>
                                <div class="botones text-right">
                                  <p>
                                    <a data-toggle="collapse" href="#collapse2" role="button" aria-expanded="false" aria-controls="collapse">
                                      Responder
                                    </a>
                                  </p>
                                  <div class="collapse" id="collapse2">
                                    <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
                                    <button class="btn btn-primary mt-3" type="button">Comentar</button>
                                  </div>
                                  <a href="#">Bloquear</a>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                        <div class="media">
                          <img src="/IMG/logox.png" width="64" height="64" alt="">
                          <div class="media-body">
                            <p class="nombre">Nombre de usuario <span>1:00</span></p>
                            <p class="comentario">Lorem ipsum dolor sit, amet consectetur adipisicing elit. 
                              Ipsa illo atque delectus perspiciatis libero quae neque, odit, aperiam, omnis 
                              necessitatibus officia placeat labore? Saepe consectetur nisi fugiat enim totam 
                              inventore.
                            </p>
                            <div class="botones text-right">
                              <p>
                                <a data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
                                  Responder
                                </a>
                              </p>
                              <div class="collapse" id="collapseExample">
                                <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
                                <button class="btn btn-primary mt-3" type="button">Comentar</button>
                              </div>
                              <a href="#">Bloquear</a>
                            </div>
                          </div>
                        </div>
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
    <script src="assets/Js/noticia.js"></script>
  </body>
</html>

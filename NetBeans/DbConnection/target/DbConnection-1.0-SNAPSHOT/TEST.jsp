<%-- 
    Document   : TEST
    Created on : 7/11/2020, 04:14:20 PM
    Author     : alber
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/64d58efce2.js"crossorigin="anonymous"></script>
    <link rel="stylesheet" href="assets/CSS/Crear.css">
    <title>Time to play</title>
  </head>
  <body>
        <nav class="navbar navbar-expand-sm navbar-dark bg-dark">
            <a class="navbar-brand" href="/HTML/Principal.html"><img src="/IMG/Optimizadas/logo.png" width="100px" alt="Logo"></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
          
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
              <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                  <a class="nav-link" href="/HTML/Principal.html"><i class="fas fa-home"></i> Home <span class="sr-only">(current)</span></a>
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
                    <a class="nav-link" href="/HTML/LoginRes.html"><i class="fas fa-sign-in-alt"></i> Login</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class="fas fa-user-circle"></i> Profile
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                      <a class="dropdown-item" href="/HTML//Perfil.html">Profile</a>
                      <a class="dropdown-item" href="/HTML/Crear.html">Create News</a>
                      <a class="dropdown-item" href="/HTML/Publicadas.html">Published</a>
                      <a class="dropdown-item" href="/HTML/Marcados.html">Marked</a>
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
        <div class="container crear">
          
          <div class="col-md-3 mx-auto mb-3 mt-3 separador-create">
            <h6 class="text-uppercase text-center text-white mt-0 font-weight-bold">create news</h6>
            <hr class="bg-info text-center mt-0 mx-auto">
        </div>

          <form class="mb-3 mt-3">
            <div class="imagenes mt-3 mb-3">
              <input type="file" id="real-file" hidden="hidden" />
              <button type="button" id="custom-button">CHOOSE A FILE</button>
              <span id="custom-text">No file chosen, yet.</span>
  
              <input type="file" id="real-fileTwo" hidden="hidden" />
              <button type="button" id="custom-buttonTwo">CHOOSE A FILE</button>
              <span id="custom-textTwo">No file chosen, yet.</span>
  
              <input type="file" id="real-fileThree" hidden="hidden" />
              <button type="button" id="custom-buttonThree">CHOOSE A FILE</button>
              <span id="custom-textThree">No file chosen, yet.</span>
            </div>
           
            <div class="form-group">
              <label for="exampleFormControlInput1">Enter the url of the video:</label>
              <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="Example: https://www.youtube.com/watch?v=-au1ZG2BnyU">
            </div>
            <div class="form-group">
              <label for="exampleFormControlInput1">Title of the news:</label>
              <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="Title">
            </div>
            <div class="form-group">
              <label for="exampleFormControlSelect1">Category:</label>
              <select class="form-control" id="exampleFormControlSelect1">
                <option>Shooter</option>
                <option>Adventure</option>
                <option>FPS</option>
                <option>ROL</option>
                <option>Horror</option>
              </select>
            </div>
            <div class="form-group">
              <label for="FormControlTextarea1">Short description:</label>
              <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
            </div>
            <div class="form-group">
              <label for="FormControlTextarea2">Long description:</label>
              <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
            </div>
            <button type="submit" class="btn btn-primary">Published</button>
          </form>
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
    <script src="/JS/file.js"></script>
  </body>
</html>
<%-- 
    Document   : headerguest
    Created on : 28-mar-2013, 2:05:29
    Author     : IsmiKin
    Description:  Cabecera para la vista del invitado, sin loguear
--%>

<%@tag description="put the tag description here" pageEncoding="UTF-8"%>


<!-- Importamos los css para que funcione el carousel -->
<link rel="stylesheet" href="css/pages/carousel.css">
<link rel="stylesheet" href="css/pages/index.css">

<!-- NAVBAR
    ================================================== -->
    <div class="navbar-wrapper">
      <!-- Wrap the .navbar in .container to center it within the absolutely positioned parent. -->
      <div class="container">

        <div class="navbar navbar-inverse">
          <div class="navbar-inner">
            <!-- Responsive Navbar Part 1: Button for triggering responsive navbar (not covered in tutorial). Include responsive CSS to utilize. -->
            <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
            <a class="brand" href="index.jsp">Proyecto Hermes</a>
            <!-- Responsive Navbar Part 2: Place all navbar contents you want collapsed withing .navbar-collapse.collapse. -->
            <div class="nav-collapse collapse">
              <ul class="nav">
                <li class="active"><a href="index.jsp">Inicio</a></li>
                <li><a href="http://www.malaga.es">La Diputación</a></li>
                <li><a href="contacto.jsp">Contacto</a></li>
                <!-- Read about Bootstrap dropdowns at http://twitter.github.com/bootstrap/javascript.html#dropdowns -->
                <li class="dropdown">
                  <a href="servicios.jsp" class="dropdown-toggle" data-toggle="dropdown">Servicios <b class="caret"></b></a>
                  <ul class="dropdown-menu">
                      <li class="nav-header">Llamar</li>
                    <li><a href="servicios.jsp#Fija">Telefonía Fija</a></li>
                    <li><a href="servicios.jsp#Movil">Telefonía Movil</a></li>
                    <li class="divider"></li>
                    <li class="nav-header">Navegar</li>
                    <li><a href="servicios.jsp#Linea">Linea de Internet</a></li>
                    <li><a href="servicios.jsp#TDatos">Tarifa de Datos</a></li>                                        
                  </ul>
                </li>
              </ul>
                
                       <form class="navbar-form pull-right">                           
                            <button id="btnIniciar" type="submit" class="btn btn-success"data-toggle="modal" data-target="#modalLogin">Iniciar Sesion</button>
                        </form>
              
                
                
            </div><!--/.nav-collapse -->
          </div><!-- /.navbar-inner -->
        </div><!-- /.navbar -->

      </div> <!-- /.container -->
    </div><!-- /.navbar-wrapper -->



    <!-- Carousel
    ================================================== -->
    <div id="myCarousel" class="carousel slide">
      <div class="carousel-inner">
        <div class="item active">
          <img src="./img/slide01.png" alt="">
          <div class="container">
            <div class="carousel-caption">
                
                    <h1 class="claro">Por y para Málaga.</h1>
                    <p class="lead claro">Todos nuestros servicios estan disponibles a todos los Municipios de la provincia de Málaga. Estamos aqui para ayudar a todos los malagueños.</p>
                    <a class="btn btn-large btn-primary" href="contacto.jsp">Contacta</a>
               
            </div>
          </div>
        </div>
        <div class="item">
          <img src="./img/slide02.png" alt="">
          <div class="container">
            <div class="carousel-caption">
              <h1 class="claro">La última tecnología.</h1>
              <p class="lead claro">Queremos que Málaga sea una provincia líder y moderna y por ello ofrecemos las últimas novedades del mercado con una financiación más que competitiva.</p>
              <a class="btn btn-large btn-primary" href="servicios.jsp">Nuestros servicios</a>
            </div>
          </div>
        </div>
        <div class="item">
          <img src="./img/slide03.png" alt="">
          <div class="container">
            <div class="carousel-caption">
              <h1>La Diputación.</h1>
              <p class="lead claro">La Diputación de Málaga es un organismo que esta por y para los malagueños. Ofrecemos diversos servicios y este mismo portal es una prueba de ella.</p>
              <a class="btn btn-large btn-primary" href="diputacion.jsp">La Diputación</a>
            </div>
          </div>
        </div>
      </div>
      <a class="left carousel-control" href="index.jsp#myCarousel" data-slide="prev">‹</a>
      <a class="right carousel-control" href="index.jsp#myCarousel" data-slide="next">›</a>
    </div><!-- /.carousel -->
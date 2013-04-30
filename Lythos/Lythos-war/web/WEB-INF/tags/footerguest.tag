<%-- 
    Document   : footer
    Created on : 23-mar-2013, 19:16:13
    Author     : IsmiKin
--%>

<%@tag description="footer de todas las paginas" pageEncoding="UTF-8"%>

<footer>
    <div id="footer">
        <div class="container">
            <div class="row-fluid">
                <div class="span4">
                   <!-- <h4><strong><center>Mapa del sitio</center></strong></h4><br>-->
                    <div id="list4">
                        <ul>
                            <li><a href="index.jsp">Inicio</a></li>
                            <li><a href="http://www.malaga.es/">La Diputacion</a></li>
                            <li><a href="contacto.jsp">Contacto</a></li>
                            <li><a href="servicios.jsp">Servicios</a></li>
                        </ul>
                    </div>
                    
                </div>
                <div class="span4 meteor-footer">
                    <center> by Meteor Systems<br>
                    <a href="http://www.meteor.ameh.es"><img src="img/meteorlogo1.png"></a></center>
                </div>
                <div class="span4">
                    <a href="http://www.malaga.es"> <img src="img/diputacion.gif" height="100"></a>
                </div>
            </div>
        </div>
    
    </div>    
    
<%
        String Nickname = request.getParameter("nickname");
%>
       
     <!-- VENTANA DE LOGIN -->
            <div id="modalLogin" class="modal hide fade" tabindex="-1" role="dialog">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h3>Iniciar Sesion</h3>
                </div>
                <div class="modal-body">
                  <center>
                    <form id="loginForm" action="login" method="POST">
                      
                      <!--<div id="control-user" class="control-group">
                        <!--<label class="control-label" for="user">Nombre de Usuario </label>-->
                        <input type="text" id="user" name="nickname" class="input-block-levelt" placeholder="Nombre de Usuario" title="Nombre de usuario" required></input>

                      <!--</div>                  -->
                      <br>
                      
                     <!-- <div id="control-pass" class="control-group">
                       <!-- <label class="control-label" for="pass">Contraseña </label>-->
                        <input id="pass" name="pass" type="password" class="input-block-levelt" placeholder="Contraseña" title="Tu contraseña" required></input><br>
                                <button id="btnIniciarSesion" type="submit" class="btn btn-success" >Iniciar Sesion</button>
                    </div> 
                      <!--</div>-->

                        <div class="modal-footer">
                        Proyecto Hermes - 2013
                      </div>
                   
                    </div>
                    </form> 
                  </center>                              

            </div>
    
</footer>


</body>
</html>
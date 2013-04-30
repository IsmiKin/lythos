<%-- 
    Document   : index
    Created on : 23-mar-2013, 18:32:04
    Author     : IsmiKin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="shared" tagdir="/WEB-INF/tags" %>

<!-- http://www.kendoui.com/jsp/tags -->
<%@taglib prefix="kendo" uri="http://www.kendoui.com/jsp/tags"%>

<%@page import="entidades.Linea, java.util.List" %>

<shared:headerlibs></shared:headerlibs>
<shared:headerguest></shared:headerguest>

    
<script src="js/pages/index.js"></script>

<div id="wrap">

    <div class="row  info-index">
           
        <div  class="span12">
            <center><p class="text-center welcome-title"><h1>¡Ups! Parece que ha ocurrido un error</h1></p></center>
        </div>
        
            <div class="row-fluid">
        
                <div class="span4">
                    <img class="img-rounded" src="img/dead_smile.png"  >
                </div>


                <div class="span8 textospan">
                    <strong>¡Ha habido un problema al entrar en la plataforma  !</strong><br><br>
                   Pruebe a escribir de nuevo su cuenta de usuario y contraseña      <br><br>
                                                         
                   
                   <form id="loginForm" action="login" method="POST">
                        <input type="text" id="user" name="nickname" class="input-block-levelt" placeholder="Nombre de Usuario" title="Nombre de usuario" required
                              value="${nickname}">
                        <br>
                        <input id="pass" name="pass" type="password" class="input-block-levelt" placeholder="Contraseña" title="Tu contraseña" required>
                        <br>
                        <button id="btnIniciarSesion" type="submit" class="btn btn-success" >Iniciar Sesion</button>
                   </form>
                   
                   <ul>
                       <li>Si tienes un <b>problema tecnico</b> ponte en contacto con nosotros a través de la Oficina de Soporte Técnico o envienos un correo
                            <a href="contacto.jsp" class="btn btn-warning">Contactar</a>
                       </li>                       
                                             
                   </ul>
                   
                </div>

            </div>
        
        </div>
    
</div>

<shared:footerguest></shared:footerguest>
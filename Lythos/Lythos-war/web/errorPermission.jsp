<%-- 
    Document   : errorPermission
    Created on : 04-may-2013, 0:40:55
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
                    
                </div>


                <div class="span12 textospan">
                    <img class="img-rounded" src="img/you_shall_not_pass.png" height="100"  >
                    <strong>¡No puedes pasar  !</strong><br><br>
                    No tienes permisos suficientes  <br><br>
                                                                         
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
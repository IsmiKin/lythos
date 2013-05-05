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

<%
        List<Linea>lista = (List<Linea>)request.getAttribute("listaClientes");        
%>
       
    
<script src="js/pages/index.js"></script>

<div id="wrap">

    <div class="row  info-index">
           <kendo:datePicker name="datePicker"></kendo:datePicker>
        <div  class="span12">
            <center><p class="text-center welcome-title"><h1>¡Bienvenido!</h1></p></center>
        </div>
        
            <div class="row-fluid">
        
                <div class="span4">
                    <img class="img-rounded" src="img/business-people-2_s.png"  >
                </div>


                <div class="span8 textospan">
                    <strong>¡Bienvenido al Proyecto !</strong><br><br>
                   A través de esta plataforma podra organizar y ver sus facturas.       <br><br>
                   
                   <ul>
                       <li>Si tienes un <b>problema tecnico</b> ponte en contacto con nosotros a través de la Oficina de Soporte Técnico o envienos un correo
                            <a href="contacto.jsp" class="btn btn-warning">Contactar</a>
                       </li>
                       <li> 
                           Si aun no tienes plan contratado con nosotros te invitamos a que te pases por nuestros servicios
                           <a href="servicios.jsp" class="btn btn-info">Servicios</a>
                       </li>
                       <li>
                           Si ya disfrutas de nuestros Servicios, ¡Inicia Sesion!
                           <a href="servicios.jsp" class="btn btn-success">Iniciar Sesion</a>
                       </li>
                        
                   </ul>
                   
                </div>

            </div>
        
        </div>
    
</div>

<shared:footerguest></shared:footerguest>
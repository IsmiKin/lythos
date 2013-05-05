<%-- 
    Document   : home
    Created on : 23-abr-2013, 12:58:52
    Author     : IsmiKin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="shared" tagdir="/WEB-INF/tags" %>

<%@taglib prefix="kendo" uri="http://www.kendoui.com/jsp/tags"%>
    
    <!-- LIBRERIAS ESENCIALES -->
    <shared:headerlibs></shared:headerlibs>  
        
    <!--   La variable nivelSeguridad es requerida en menuBarRol.jsp para verificar que tipo de Rol puede acceder a esta pagina 
            Si la pagina es publica debes usar el nivel de Seguridad 4 (invitado) 
            Dependiendo del rol lanzara un menubar u otro
       -->
    
    <% int nivelSeguridad = 3; %>
    
    <%@include  file="menuBarRol.jsp" %>
               
     <!-- Este script es para sombrear la opción en la que estamos sin tener que cambiar la cabecera... enjoy it baby 
           Debes ir a "header-rol" y mirar las clases que tienen los li de menu-up -->
     
     <script>$(".menu-home").addClass("active");</script>
     
    
    <div class="content-main row-fluid">
            <div class="content-main-left span8 column">
            </div>
  
    
    <%@include  file="menuRightRol.jsp" %>  

    </div>
    
    <shared:footeruser></shared:footeruser>
    
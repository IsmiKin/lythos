<%-- 
    Document   : home
    Created on : 23-abr-2013, 12:58:52
    Author     : IsmiKin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="shared" tagdir="/WEB-INF/tags" %>

<!-- http://www.kendoui.com/jsp/tags -->
<%@taglib prefix="kendo" uri="http://www.kendoui.com/jsp/tags"%>

    

    <shared:headerlibs></shared:headerlibs>
    <shared:headeradmin></shared:headeradmin>

    
    <% 
           String checking = request.getParameter("checkUser");           
           System.out.println("Se ha logueado? :"+checking);
     %>
 
     <!-- Este script es para sombrear la opción en la que estamos sin tener que cambiar la cabecera... enjoy it baby -->
     <!-- Debes ir a "header-rol" y mirar las clases que tienen los li de menu-up -->
     
     <script>$(".menu-home").addClass("active");</script>
     
    
    <div class="content-main row-fluid">
            <div class="span8 column">
            </div>


    <shared:menuuser></shared:menuuser>

    </div>
    
    <shared:footeruser></shared:footeruser>
    
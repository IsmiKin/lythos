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
  <%--  <shared:headeradmin></shared:headeradmin> --%>
        
             
    <% 
          int nivelSeguridad = 3;
          // La variable de nivelSeguridad la ponemos a mano para decidir hasta que rol puede entrar en esta pagina
         // String nivelSeguridad = [0-3], Administrador = 0, Controlador = 1, JefeServicio = 2, Usuario = 3
          HttpSession sesion = request.getSession(false);
          String rol = (String)sesion.getAttribute("rol");
          Integer rolNumber = (Integer)sesion.getAttribute("rolNumber");
          if (session == null) {
                // Not created yet. Now do so yourself.
                response.sendRedirect("errorLogin.jsp");
            } else {
                // Already created. 
                if(nivelSeguridad>rolNumber){                    
                    
                if(rol.equals("Administrador")){ %>
                        <shared:headeradmin></shared:headeradmin>
                  <%  }               
                
                }
                else
                    response.sendRedirect("errorLogin.jsp");
                
                
            }
     %>
     <%= rol %>
     <!-- Este script es para sombrear la opción en la que estamos sin tener que cambiar la cabecera... enjoy it baby -->
     <!-- Debes ir a "header-rol" y mirar las clases que tienen los li de menu-up -->
     
     <script>$(".menu-home").addClass("active");</script>
     
    
    <div class="content-main row-fluid">
            <div class="span8 column">
            </div>


    <shared:menuuser></shared:menuuser>

    </div>
    
    <shared:footeruser></shared:footeruser>
    
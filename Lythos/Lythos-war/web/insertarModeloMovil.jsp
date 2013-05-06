<%-- 
    Document   : insertarModeloMovil
    Created on : 01-may-2013, 21:25:39
    Author     : kuku
--%>


<%@page import="java.util.Iterator"%>
<%@page import="java.util.Collection"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="shared" tagdir="/WEB-INF/tags" %>

<!-- http://www.kendoui.com/jsp/tags -->
<%@taglib prefix="kendo" uri="http://www.kendoui.com/jsp/tags"%>

    <shared:headerlibs></shared:headerlibs>
    
    <!-- Anotacion : Esta vista puede verla el Controlador y el Administrador, pero para el Controlador es solo de vista ,
                            asi que las acciones las "filtrarermos" en vivo -->
    
    <% int nivelSeguridad = 0; %>
    
    <%@include  file="menuBarRol.jsp" %>    
    
  <%    Collection modelos = (Collection)request.getAttribute("modelos");	   %>
 
     <script>$(".menu-terminales").addClass("active");</script>
     
    
    
    <div class="content-main row-fluid">
            <div class="span8 column">
                
                <center><img src="img/ModelosMoviles.jpg"></center><br>
                
                <form class="form-insertar" action="insertModelo" method="post">
                    <label for="Marca"><strong>Marca</strong></label><input name="Marca" type="text" class="input-large" placeholder="Marca" required><br>
                    <label for="Modelo"><strong>Modelo</strong></label><input name="Modelo" type="text" class="input-large" placeholder="Modelo" required><br>
                    <label for="Lanzamiento"><strong>Fecha Lanzamiento</strong></label><input name="Lanzamiento" type="date" class="input-large"  ><br>
                    <label for="Detalles"><strong>Detalles</strong></label><input name="Detalles" type="text" class="input-large" placeholder="Detalles" ><br>
                    
                    
                    <button type="submit" class="btn btn-info" >Aceptar</button>
                    <a href="adminModeloTelMovil"><button type="button" class="btn btn-danger" >Cancelar</button></a>
                        
                    <br>
             
                </form>
                
                
            </div>


    <%@include  file="menuRightRol.jsp" %>  

    </div>
    
    <shared:footeruser></shared:footeruser>
    
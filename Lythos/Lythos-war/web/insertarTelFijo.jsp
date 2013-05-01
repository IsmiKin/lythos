<%-- 
    Document   : home
    Created on : 23-abr-2013, 12:58:52
    Author     : IsmiKin
--%>

<%@page import="entidades.Terminalfijo"%>
<%@page import="entidades.Terminalfijo"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Collection"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="shared" tagdir="/WEB-INF/tags" %>

<!-- http://www.kendoui.com/jsp/tags -->
<%@taglib prefix="kendo" uri="http://www.kendoui.com/jsp/tags"%>

    <shared:headerlibs></shared:headerlibs>
    <shared:headeradmin></shared:headeradmin>
    
    
  <%    Collection collection = (Collection)request.getAttribute("todosTerminales");	   %>
 
     <!-- Este script es para sombrear la opción en la que estamos sin tener que cambiar la cabecera... enjoy it baby -->
     <!-- Debes ir a "header-rol" y mirar las clases que tienen los li de menu-up -->
     
     <script>$(".menu-terminales").addClass("active");</script>
     
    
    
    <div class="content-main row-fluid">
            <div class="span8 column">
                
                <center><img src="img/admintelfijos.png"></center><br>
                
                <form class="form-insertar">
                    <label for="Codigo"><strong>Codigo</strong></label><input name="Codigo" type="text" class="input-large" placeholder="Codigo" required><br>
                    <label for="Modelo"><strong>Modelo</strong></label>
                    <select name="Modelo">
                        <option></option>
                        <option>Prueba</option>
                        <option>Prueba2</option>
                    </select>
                    <br>
                    <select name="Modelo">
                        <option></option>
                        <option>Prueba</option>
                        <option>Prueba2</option>
                    </select>
                    
                </form>
                
            </div>


    <shared:menuuser></shared:menuuser>

    </div>
    
    <shared:footeruser></shared:footeruser>
    
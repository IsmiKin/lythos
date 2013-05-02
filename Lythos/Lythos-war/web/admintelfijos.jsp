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
     
     <script>
         $(".menu-terminales").addClass("active");
     </script>
     
    
    
    <div class="content-main row-fluid">
            <div class="content-main-left span8 column">
                
                <center><img src="img/admintelfijos.png"></center><br>
                
                <table class="table table-hover">
                    <caption>Tabla para administración de Terminales Fijos</caption>
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Codigo</th>
                            <th>Modelo</th>
                            <th>Usuario</th>                            
                            <th>Linea</th>
                            <th>Acciones <a href="telfijos/formTelFijos"><button class="btn btn-info" >Insertar</button></a> </th>                            
                        </tr>
                    </thead>
                    <tbody>
                            
                        
                            <% for (Iterator iter = collection.iterator(); iter.hasNext();) {
                                                               Terminalfijo element = (Terminalfijo) iter.next(); %>
                                            
                                        <tr>
                                            <td><%= element.getIdTerminalFijo() %></td>
                                            <td><%= element.getCodigo() %></td>
                                            <td><%= element.getModeloFijoidModeloFijo() %></td>
                                            <td><%= element.getUsuarioidUsuario() %></td>
                                            <td><%= element.getLineaidLinea() %></td>
                                            <td>
                                                <button class="btn" >Editar</button>
                                                <button class="btn btn-danger" >Eliminar</button>                                                
                                            </td>
                                        </tr>
                              
                              <% } %>
                      </tbody>
                 </table>
                
            </div>


    <shared:menuuser></shared:menuuser>

    </div>
    
    <shared:footeruser></shared:footeruser>
    
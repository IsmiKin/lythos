<%-- 
    Document   : mistelfijos
    Created on : 23-abr-2013, 12:58:52
    Author     : IsmiKin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    
    <!-- Anotacion : Esta vista puede verla el Controlador y el Administrador, pero para el Controlador es solo de vista ,
                            asi que las acciones las "filtrarermos" en vivo -->
    
    <% int nivelSeguridad = 1; %>
    
    <%@include  file="menuBarRol.jsp" %>
    
    
    
  <%    
        // Si ha pasado el menuBarRol quiere decir que ya tenemos Sesion
        
        Integer rolNumberUsuario = (Integer)sesion.getAttribute("rolNumber");
        Collection collection = (Collection)request.getAttribute("misTerminales");	   
  
  %>
 
     <!-- Este script es para sombrear la opción en la que estamos sin tener que cambiar la cabecera... enjoy it baby -->
     <!-- Debes ir a "header-rol" y mirar las clases que tienen los li de menu-up -->
     
     <script>
         $(document).ready(function(){
             $(".menu-terminales").addClass("active");
             
             // jQuery Time Beaches
             
             $(".eliminarEnTabla").click(function(){                 
                 $("#idAEliminar").val($(this).attr("idterminal"));
                 $(".elimCodigo").text($(this).attr("codigoterminal"));
                 $("#codigoAEliminar").val($(this).attr("codigoterminal"));
             });
             
         });
         
     </script>
     
    
    
    <div class="content-main row-fluid">
            <div class="content-main-left span8 column">
                
                <center><img src="img/admintelfijos.png"></center><br>
                
                <br>                                                
                
                <table  class="admin-table table table-hover">
                    <caption>Tabla para administración de Terminales Fijos</caption>
                    <thead>
                        <tr>
                            
                            <th>Codigo</th>
                            <th>Modelo</th>
                           
                            <th>Linea</th>
                            
                        </tr>
                    </thead>
                    <tbody>
                            
                            <% for (Iterator iter = collection.iterator(); iter.hasNext();) {
                                                               Terminalfijo element = (Terminalfijo) iter.next(); %>
                                                               
                                        <tr>
                                           
                                            <td><%= element.getCodigo() %></td>
                                            <td> 
                                                <%    if(element.getModeloFijoidModeloFijo()!=null){                                %>
                                                    <%= element.getModeloFijoidModeloFijo().getModelo() %>
                                                <% } else{ %> Sin asignar <% } %>
                                            </td>
                                           
                                            <td>
                                                 <% if(element.getLineaidLinea()!=null){ %>
                                                    <%= element.getLineaidLinea().getNumero() %>
                                                 <% }else{ %> Sin asignar <% } %>
                                            </td>
                                           
                                        </tr>
                              
                              <% } %>
                      </tbody>
                 </table>
                
            </div>
          
                       
    <%@include  file="menuRightRol.jsp" %>  

    </div>
    
    <shared:footeruser></shared:footeruser>
    
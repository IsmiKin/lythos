<%-- 
    Document   : home
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
        Collection collection = (Collection)request.getAttribute("todosTerminales");	   
  
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
             });
             
         });
         
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
                            <th>Acciones <% if( rolNumberUsuario==0){ %><a href="telfijos/formTelFijos"><button class="btn btn-info" >Insertar</button></a> </th> <% } %>                            
                        </tr>
                    </thead>
                    <tbody>
                            
                            <% for (Iterator iter = collection.iterator(); iter.hasNext();) {
                                                               Terminalfijo element = (Terminalfijo) iter.next(); %>
                                                               
                                        <tr>
                                            <td><%= element.getIdTerminalFijo() %></td>
                                            <td><%= element.getCodigo() %></td>
                                            <td> 
                                                <%    if(element.getModeloFijoidModeloFijo()!=null){                                %>
                                                    <%= element.getModeloFijoidModeloFijo().getModelo() %>
                                                <% } else{ %> Sin asignar <% } %>
                                            </td>
                                            <td>
                                                <% if(element.getUsuarioidUsuario()!=null){ %>
                                                    <%= element.getUsuarioidUsuario().getNombre() %>
                                                 <% } else{ %> Sin asignar <% } %>
                                            </td>
                                            <td>
                                                 <% if(element.getLineaidLinea()!=null){ %>
                                                    <%= element.getLineaidLinea().getNumero() %>
                                                 <% }else{ %> Sin asignar <% } %>
                                            </td>
                                            <td> <% if( rolNumberUsuario==0){ %>
                                                <!-- AVISO AL LECTOR: NO ME GUSTA TENER QUE USAR ANLCA "A" Y METODO GET ... 
                                                        ES FEO, PERO TAMPOCO QUIERO USAR JAVASCIPT  -->
                                                <a href="telfijos/formEditar?idTerminalFijo=<%= element.getIdTerminalFijo() %>"<button class="btn" >Editar</button>
                                                <%--<a href="telfijos/formEliminar?idTerminalFijo=<%= element.getIdTerminalFijo() %>"<button class="btn btn-danger" >Eliminar</button>   --%>
                                                <a href="#advertencia-eliminar" role="button" codigoTerminal="<%= element.getCodigo() %>"  idTerminal="<%= element.getIdTerminalFijo() %>" class="btn btn-danger eliminarEnTabla" data-toggle="modal">Eliminar</a>
                                                
                                                    <% } %>
                                            </td>
                                        </tr>
                              
                              <% } %>
                      </tbody>
                 </table>
                
            </div>

            
                <div id="advertencia-eliminar" class="advertencia-eliminar modal hide fade">
                    <div class="modal-header">
                     <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                     <h3>Advertencia</h3>
                    </div>
                    <div class="modal-body">
                    <p>Esta apunto de eliminar el terminal fijo con <u>Codigo</u>:</p>
                    <font color="red"><h2><center><strong><div class="elimCodigo"></div></strong><br></center></h2></font>
                    <h4>¿Estas seguro de que quiere hacerlo?</h4>
                    </div>
                    <div class="modal-footer">
                      
                      <form id="eliminarFinal" action="telfijos/eliminar" method="POST">
                          <button class="btn" data-dismiss="modal" aria-hidden="true">Cancelar</button>
                          <input type="hidden" name="idAEliminar" id="idAEliminar" >
                          <button type="submit"  class="btn btn-danger">Eliminar</a>
                      </form>
                      
                      
                    </div>
              </div>
     
                      
    <shared:menuuser></shared:menuuser>

    </div>
    
    <shared:footeruser></shared:footeruser>
    
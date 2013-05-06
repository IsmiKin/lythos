<%-- 
    Document   : admintelmoviles
    Created on : 01-may-2013, 19:28:00
    Author     : Rocio
--%>

<%@page import="entidades.Terminalmovil"%>
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
    
  <%    Collection collection = (Collection)request.getAttribute("todosTerminalesM");	   %>
 
     <!-- Este script es para sombrear la opción en la que estamos sin tener que cambiar la cabecera... enjoy it baby -->
     <!-- Debes ir a "header-rol" y mirar las clases que tienen los li de menu-up -->
     
     <script>
         $(".menu-terminales").addClass("active");
     </script>
     <script>
         
         $(document).ready(function(){
         $(".eliminarEnTabla").click(function(){                 
             $("#idAEliminar").val($(this).attr("idterminal"));
             $(".elimCodigo").text($(this).attr("codigoterminal"));
         });
         
     });
     </script>       
     
    
    
    <div class="content-main row-fluid">
            <div class="span8 column">
                <center><font color="brown"><h4> Administracion de Terminales Moviles</h4></font></center>
                <center><img src="img/adminMoviles.png"></center><br>
                
                   <% if(request.getParameterMap().containsKey("operacionrealizada") ){ %>
                        <div class="mensaje-operacion alert-success alert-block "><button type="button" class="close" data-dismiss="alert">×</button><h4>¡Operacion realizada con exito!</h4><br>Se ha <strong> ${operacionrealizada} </strong> con exito el Terminal Fijo con codigo <strong>${codigousado}</strong></div>                    
                    <%} %>
                
                <table class="admin-table table table-hover">
                   
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Codigo</th>
                            <th>Modelo</th>
                            <th>Usuario</th>                            
                            <th>Linea</th>
                            
                             <% if(request.getSession().getAttribute("rolNumber").equals(0)){ %> <th>Acciones<a href="formTelMovil"><button class="btn btn-info" >Insertar</button></a><% } %> </th>                            
                        </tr>
                    </thead>
                    <tbody>
                            
                        
                            <% for (Iterator iter = collection.iterator(); iter.hasNext();) {
                                                               Terminalmovil element = (Terminalmovil) iter.next(); %>
                                            
                                        <tr>
                                            <td><%= element.getIdTerminalMovil()  %></td>
                                            <td><%= element.getCodigo() %></td>
                                            <%    if(element.getModeloMovilidModeloMovil()!=null){                                %>
                                                <td><%= element.getModeloMovilidModeloMovil().getModelo() %></td>
                                            <% } %>
                                            <%    if(element.getUsuarioidUsuario()!=null){                                %>
                                                <td><%= element.getUsuarioidUsuario().getNombre() %></td>
                                            <% } %>
                                            <%    if(element.getLineaidLinea()!=null){                                %>
                                                <td><%= element.getLineaidLinea().getNumero() %></td>
                                            <% } %>
                                            <% if(request.getSession().getAttribute("rolNumber").equals(0)){ %>  <td>
                                                <a href="formEditarTelMovil?idTerminalMovil=<%= element.getIdTerminalMovil() %>"<button class="btn" >Editar</button>
                                                    
                                                    <a href="#advertencia-eliminar" role="button" codigoTerminal="<%= element.getCodigo() %>"  idTerminal="<%= element.getIdTerminalMovil() %>" class="btn btn-danger eliminarEnTabla" data-toggle="modal">Eliminar</a>   
                                            </td>
                                            <% } %>
                                        </tr>
                              
                              <% } %>
                      </tbody>
                 </table>
                
            </div>
                      
                      
              <!--Ventana Modal-->       
              
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
                
                <form id="eliminarFinal" action="eliminarTelMovil" method="POST">
                    <button class="btn" data-dismiss="modal" aria-hidden="true">Cancelar</button>
                    <input type="hidden" name="idAEliminar" id="idAEliminar" >
                    <button type="submit"  class="btn btn-danger">Eliminar</a>
                </form>
                
                
              </div>
        </div>


    <%@include  file="menuRightRol.jsp" %>  

    </div>
    
    <shared:footeruser></shared:footeruser>
    
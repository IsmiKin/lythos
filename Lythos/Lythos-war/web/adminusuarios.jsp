<%-- 
    Document   : adminusuarios
    Created on : 05-may-2013, 19:50:07
    Author     : Rocio
--%>

<%@page import="entidades.Usuario"%>
<%@page import="entidades.Linea"%>
<%@page import="entidades.Terminalmovil"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Collection"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="shared" tagdir="/WEB-INF/tags" %>

<!-- http://www.kendoui.com/jsp/tags -->
<%@taglib prefix="kendo" uri="http://www.kendoui.com/jsp/tags"%>

    <shared:headerlibs></shared:headerlibs>
    <shared:headeradmin></shared:headeradmin>
    
    
  <%    Collection collection = (Collection)request.getAttribute("todosUsuarios");	   %>
 
     <!-- Este script es para sombrear la opción en la que estamos sin tener que cambiar la cabecera... enjoy it baby -->
     <!-- Debes ir a "header-rol" y mirar las clases que tienen los li de menu-up -->
     
     <script>
         $(".menu-terminales").addClass("active");
     </script>
     
     <script>
         
         $(document).ready(function(){
         
         $(".eliminarEnTabla").click(function(){             
             $("#idAEliminar").val($(this).attr("idusuario"));
             $(".elimCodigo").text($(this).attr("codigousuario"));
         });
         
     });
     </script>   
     
     <div class="content-main row-fluid">
            <div class="span8 column">
                
                <center><font color="orange"><h4> Administracion de Usuarios</h4></font></center>
                <center><img src="img/adminuser.jpg"></center><br>
                
                <% if(request.getParameterMap().containsKey("operacionrealizada") ){ %>
                        <div class="mensaje-operacion alert-success alert-block "><button type="button" class="close" data-dismiss="alert">×</button><h4>¡Operacion realizada con exito!</h4><br>Se ha <strong> ${operacionrealizada} </strong> con exito el Terminal Fijo con codigo <strong>${nombreusado}</strong></div>                    
               <%} %>
                
                <table class="admin-table table table-hover">
                    
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Nombre</th>
                            <th>Apellidos</th>
                            <th>Rol</th>                            
                            <th>Sexo</th>
                            <th><center>DNI</center></th>
                            <th>Direccion</th>
                            <th><center>Email</center></th>
                            <th>Cargo</th>
                            <th>Municipio</th>
                            <th>Grupo</th>
                            <th>Acciones <a href="formUsuario"><button class="btn btn-info" >Insertar</button></a> </th>                            
                        </tr>
                    </thead>
                    <tbody>
                            
                        
                            <% for (Iterator iter = collection.iterator(); iter.hasNext();) {
                                                               Usuario element = (Usuario) iter.next(); %>
                                            
                                        <tr>
                                            <td><%= element.getIdUsuario() %></td>
                                            <td><%= element.getNombre() %></td>
                                            <td><%= element.getApellidos() %></td>
                                            <td><%= element.getRol() %></td>
                                            <td><%= element.getSexo() %></td>
                                            <td><%= element.getDni() %></td>
                                            <td><%= element.getDireccion() %></td>
                                            <td><%= element.getEmail() %></td>
                                            <td><%= element.getCargo() %></td>
                                            <td>
                                                <%    if(element.getMunicipioidMunicipio()!=null){                                %>
                                                    <%= element.getMunicipioidMunicipio().getNombre() %>
                                                <% }%>
                                             </td>
                                            <td>
                                                <%    if(element.getGrupoRescateidGrupoRescate()!=null){                                %>
                                                    <%= element.getGrupoRescateidGrupoRescate().getNombre() %></td>
                                                <% }%>
                                            <td>
                                                <a href="formEditarUsuario?idUsuario=<%= element.getIdUsuario() %>"<button class="btn" >Editar</button>
                                                <a href="#advertencia-eliminar" role="button"  codigoUsuario="<%= element.getNombre() %>" idUsuario="<%= element.getIdUsuario() %>" class="btn btn-danger eliminarEnTabla" data-toggle="modal">Eliminar</a>   </td>
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
              <p>Esta apunto de eliminar el usuario <u>Nombre</u>:</p>
              <font color="red"><h2><center><strong><div class="elimCodigo"></div></strong><br></center></h2></font>
              <h4>¿Estas seguro de que quiere hacerlo?</h4>
              </div>
              <div class="modal-footer">
                
                <form id="eliminarFinal" action="eliminarUsuario" method="POST">
                    <button class="btn" data-dismiss="modal" aria-hidden="true">Cancelar</button>
                    <input type="hidden" name="idAEliminar" id="idAEliminar" >
                    <button type="submit"  class="btn btn-danger">Eliminar</a>
                </form>
                
                
              </div>
        </div>

                      
    <shared:menuuser></shared:menuuser>

    </div>
    
    <shared:footeruser></shared:footeruser>
     
     

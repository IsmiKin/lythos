<%-- 
    Document   : modelosfijos
    Created on : 01-may-2013, 20:59:00
    Author     : Antonio Sánchez Valadez.
--%>

<%@page import="entidades.Modelofijo"%>
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
    
    
  <%    Collection collection = (Collection)request.getAttribute("todosModelos");	   %>
 
     <!-- Este script es para sombrear la opción en la que estamos sin tener que cambiar la cabecera... enjoy it baby -->
     <!-- Debes ir a "header-rol" y mirar las clases que tienen los li de menu-up -->
     
     <script>
         $(".menu-terminales").addClass("active");
     </script>
     <script>  
 
      $(document).ready(function(){
          
          
            // jQuery Time Beaches
         
         $(".eliminarEnTabla").click(function(){                 
             $("#idAEliminar").val($(this).attr("idModeloFijo"));
             $(".elimCodigo").text($(this).attr("codigoModeloFijo"));
         });
         
     });
 
</script>
     
    
    <div class="content-main row-fluid">
            <div class="span8 column">
                
                <center><img src="img/modelofijo.jpg"></center><br>
                
               <% if(request.getParameterMap().containsKey("operacionrealizada") ){ %>
                        <div class="mensaje-operacion alert-success alert-block "><button type="button" class="close" data-dismiss="alert">×</button><h4>¡Operacion realizada con exito!</h4><br>Se ha <strong> ${operacionrealizada} </strong> con exito el Terminal Fijo con codigo <strong>${modelousado}</strong></div>                    
               <%} %>
                
                <table class="admin-table table table-hover">
                    <caption>Tabla para administración de Modelos Fijos</caption>
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Modelo</th>
                            <th>Lanzamiento</th>
                            <th>Marca</th>     
                            <th>Detalles</th> 
                            
                            <% if( request.getSession().getAttribute("rolNumber").equals(0)){ %> <th>Acciones <a href="formModelosFijos"><button class="btn btn-info" >Insertar</button></a></th><% } %>
                        </tr>
                    </thead>
                    <tbody>
                            
                        
                            <% for (Iterator iter = collection.iterator(); iter.hasNext();) {
                                                               Modelofijo element = (Modelofijo) iter.next(); %>
                                            
                                        <tr>
                                            <td><%= element.getIdModeloFijo() %></td>
                                            <td><%= element.getModelo() %></td>
                                            <td><%= element.getLanzamiento() %></td>
                                            <td><%= element.getMarca()%></td>
                                            <td><%= element.getDetalles()%></td>
                                            <% if(request.getSession().getAttribute("rolNumber").equals(0)){ %>
                                            <td>                     
                                                
                                                       <a href="formEditarModelosFijos?idModeloFijo=<%= element.getIdModeloFijo() %>"<button class="btn" >Editar</button>                                                 
                                                       <a href="#advertencia-eliminar" role="button" codigomodelofijo="<%= element.getMarca() %>"  idModeloFijo="<%= element.getIdModeloFijo() %>" class="btn btn-danger eliminarEnTabla" data-toggle="modal">Eliminar</a>                                                
                                            
                                            </td>
                                           <% } %>
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
              <p>Esta apunto de eliminar el modelo con <u>Marca</u>:</p>
              <font color="red"><h2><center><strong><div class="elimCodigo"></div></strong><br></center></h2></font>
              <h4>¿Estas seguro de que quiere hacerlo?</h4>
              </div>
              <div class="modal-footer">
                
                <form id="eliminarFinal" action="eliminarmodelofijo" method="POST">
                    <button class="btn" data-dismiss="modal" aria-hidden="true">Cancelar</button>
                    <input type="hidden" name="idAEliminar" id="idAEliminar" >
                    <button type="submit"  class="btn btn-danger">Eliminar</a>
                </form>
                
                
              </div>
        </div>


    <%@include  file="menuRightRol.jsp" %>  

    </div>
    
    <shared:footeruser></shared:footeruser>

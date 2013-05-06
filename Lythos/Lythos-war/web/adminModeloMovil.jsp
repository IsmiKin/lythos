<%-- 
    Document   : adminModeloMovil
    Created on : 01-may-2013, 19:37:01
    Author     : kuku
--%>

<%@page import="entidades.Modelomovil"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Collection"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<%@taglib prefix="shared" tagdir="/WEB-INF/tags" %>

<!-- http://www.kendoui.com/jsp/tags -->
<%@taglib prefix="kendo" uri="http://www.kendoui.com/jsp/tags"%>

    <shared:headerlibs></shared:headerlibs>
    
    <!-- Anotacion : Esta vista puede verla el Controlador y el Administrador, pero para el Controlador es solo de vista ,
                            asi que las acciones las "filtrarermos" en vivo -->
    
    <% int nivelSeguridad = 1; %>
    
    <%@include  file="menuBarRol.jsp" %>
    
  <%    Collection collection = (Collection)request.getAttribute("todosModelosMoviles");	   %>
 
     <script>
         $(".menu-terminales").addClass("active");
     </script>
     
     <script>  
 //Script para pasar datos a la ventana modal
      $(document).ready(function(){
         
         $(".eliminarEnTabla").click(function(){                 
             $("#idAEliminar").val($(this).attr("idModelomovil"));
             $(".elimModelo").text($(this).attr("modeloMovil"));
         });
         
     });
 
</script>
     
    
    
    <div class="content-main row-fluid">
            <div class="content-main-left span8 column">
                
                <center><img src="img/ModelosMoviles.jpg"></center><br>
                    
               <% if(request.getParameterMap().containsKey("operacionrealizada") ){ %>
                        <div class="mensaje-operacion alert-success alert-block "><button type="button" class="close" data-dismiss="alert">×</button><h4>¡Operacion realizada con exito!</h4><br>Se ha <strong> ${operacionrealizada} </strong> con exito el Terminal Fijo con codigo <strong>${modelousado}</strong></div>                    
               <%} %>
                
                <table class="admin-table table table-hover">
                    <caption>Tabla para administración de Modelos Moviles</caption>
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Marca</th> 
                            <th>Modelo</th>
                            <th>Lanzamiento</th>
                            <th>Detalles</th>
                            <% if(request.getSession().getAttribute("rolNumber").equals(0)){ %><th>Acciones <a href="modeloTelMovil/insertarModeloMovil"><button class="btn btn-info" >Insertar</button></a> </th> <% } %>
                        </tr>
                    </thead>
                    <tbody>
                            
                        
                            <% for (Iterator iter = collection.iterator(); iter.hasNext();) {
                                                               Modelomovil element = (Modelomovil) iter.next(); %>
                                            
                                        <tr>                                             
                                            
                                            <td><%= element.getIdModeloMovil() %></td>
                                            <td><%= element.getMarca()%></td>
                                            <td><%= element.getModelo() %></td>
                                            <% if (element.getLanzamiento()!=null) {%>
                                            <td><%= element.getLanzamiento().toString() %></td>                                        
                                            <% } else {%>
                                            <td>Sin Definir</td>
                                            <% } %>
                                            <td><%= element.getDetalles() %></td>
                                            <% if(request.getSession().getAttribute("rolNumber").equals(0)){ %><td>
                                                <a href="modificarModeloMovil?idModeloMovil=<%= element.getIdModeloMovil()%>"<button class="btn" >Editar</button></a>
                                                <a href="#advertenciaEliminar" role="button" idModeloMovil="<%= element.getIdModeloMovil()%>" modeloMovil="<%= element.getModelo()%>"class="btn btn-danger eliminarEnTabla" data-toggle="modal" >Eliminar</a>                                                
                                            </td>
                                            <% } %>
                                        </tr>
                              
                              <% } %>
                      </tbody>
                 </table>
                
            </div>
                      
                      
                      
<%-- VENTANA MODAL --%>                      
    <div id="advertenciaEliminar" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
          <h3 id="myModalLabel">Advertencia</h3>
        </div>
        <div class="modal-body">
          <p>Esta apunto de eliminar el modelo con <u>Codigo</u>:</p>
          <br>
          <font ><h3><center><strong><div class="elimModelo"></div></strong><br></center></h3></font>          
          <h4>¿Estas seguro de que quiere hacerlo?</h4>
        </div>
        <div class="modal-footer">
            <form action="deleteModelo" id="borrarModelo" method="POST">                
                <button class="btn" data-dismiss="modal" aria-hidden="true">Cancelar</button>
                <button class="btn btn-danger" type="submit">Eliminar</button>
                <input class="hidden" id="idAEliminar" name="idAEliminar">
            </form>
          
        </div>
    </div>                  

    <%@include  file="menuRightRol.jsp" %>  

    </div>
    
    <shared:footeruser></shared:footeruser>
    
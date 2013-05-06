<%-- 
    Document   : adminlineas
    Created on : 04-may-2013, 21:23:11
    Author     : Rocio
--%>

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
    
    <!-- Anotacion : Esta vista puede verla el Controlador y el Administrador, pero para el Controlador es solo de vista ,
                            asi que las acciones las "filtrarermos" en vivo -->
    
    <% int nivelSeguridad = 1; %>
    
    <%@include  file="menuBarRol.jsp" %>
    
  <%    Collection collection = (Collection)request.getAttribute("todasLineas");	   %>
 
     <!-- Este script es para sombrear la opción en la que estamos sin tener que cambiar la cabecera... enjoy it baby -->
     <!-- Debes ir a "header-rol" y mirar las clases que tienen los li de menu-up -->
     
     <script>
         $(".menu-terminales").addClass("active");
     </script>
     <script>
         
         $(document).ready(function(){
         
         $(".eliminarEnTabla").click(function(){             
             $("#idAEliminar").val($(this).attr("idlinea"));
             $(".elimCodigo").text($(this).attr("codigolinea"));
         });
         
     });
     </script>   
     
     <div class="content-main row-fluid">
            <div class="span8 column">
                
                <center><font color="orange"><h4> Administracion de Lineas</h4></font></center>
                <center><img src="img/adminLinea.jpg"></center><br>
                
                  <% if(request.getParameterMap().containsKey("operacionrealizada") ){ %>
                        <div class="mensaje-operacion alert-success alert-block "><button type="button" class="close" data-dismiss="alert">×</button><h4>¡Operacion realizada con exito!</h4><br>Se ha <strong> ${operacionrealizada} </strong> con exito el Terminal Fijo con codigo <strong>${numerousado}</strong></div>                    
               <%} %>
                
                <table class="admin-table table table-hover">
                    
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Numero</th>
                            <th>Tipo</th>
                            <th>VoIP</th>                            
                            <th>Pais</th>
                            <th>Tarifa</th>
                            <% if(request.getSession().getAttribute("rolNumber").equals(0)){ %>
                                <th>Acciones <a href="formLinea"><button class="btn btn-info" >Insertar</button></a></th>                            
                            <% } %>
                        </tr>
                    </thead>
                    <tbody>
                            
                        
                            <% for (Iterator iter = collection.iterator(); iter.hasNext();) {
                                                               Linea element = (Linea) iter.next(); %>
                                            
                                        <tr>
                                            <td><%= element.getIdLinea() %></td>
                                            <td><%= element.getNumero() %></td>
                                            <td><%= element.getTipo() %></td>
                                            <td><%= element.getVoIP() %></td>
                                            <td><%= element.getPais() %></td>
                                            
                                                <td><% if(element.getTarifaidTarifa()!=null){ %><%= element.getTarifaidTarifa() %><%} %></td>
                                            
                                            <% if(request.getSession().getAttribute("rolNumber").equals(0)){ %>
                                                <td>
                                                    <a href="formEditarLinea?idLinea=<%= element.getIdLinea() %>"<button class="btn" >Editar</button>
                                                    <a href="#advertencia-eliminar" role="button"  codigoLinea="<%= element.getNumero() %>" idLinea="<%= element.getIdLinea() %>" class="btn btn-danger eliminarEnTabla" data-toggle="modal">Eliminar</a>   
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
              <p>Esta apunto de eliminar la linea de numero <u>Numero</u>:</p>
              <font color="red"><h2><center><strong><div class="elimCodigo"></div></strong><br></center></h2></font>
              <h4>¿Estas seguro de que quiere hacerlo?</h4>
              </div>
              <div class="modal-footer">
                
                <form id="eliminarFinal" action="eliminarLinea" method="POST">
                    <button class="btn" data-dismiss="modal" aria-hidden="true">Cancelar</button>
                    <input type="hidden" name="idAEliminar" id="idAEliminar" >
                    <button type="submit"  class="btn btn-danger">Eliminar</a>
                </form>
                
                
              </div>
        </div>


        <%@include  file="menuRightRol.jsp" %>  

    </div>
    
    <shared:footeruser></shared:footeruser>
    
     

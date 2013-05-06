<%-- 
    Document   : adminMunicipios
    Created on : 02-may-2013, 10:44:58
    Author     : Pablo
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="entidades.Municipio"%>
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
    
<script>  
 
      $(document).ready(function(){
         
      
 
         // jQuery Time Beaches
         
         $(".eliminarEnTabla").click(function(){                 
             $("#idAEliminar").val($(this).attr("idMunicipio"));
             $(".elimCodigo").text($(this).attr("codigoMunicipio"));
             
         });
         
     });
 
</script>    
    
  <%    Collection collection = (Collection)request.getAttribute("todosMunicipios");	   %>
 
     <!-- Este script es para sombrear la opción en la que estamos sin tener que cambiar la cabecera... enjoy it baby -->
     <!-- Debes ir a "header-rol" y mirar las clases que tienen los li de menu-up -->
     
     <script>
         $(".menu-terminales").addClass("active");
     </script>
     
    
    
    <div class="content-main row-fluid">
            <div class="span8 column">
                
                <center><img src="img/muni_reto.jpg"></center><br>
   <% // <form  method="get">
     // <div><input name="search"></input></div>
     // <div><input type="submit" value="Search"  /></div>
     //</form> %> 
           
                <% if(request.getParameterMap().containsKey("operacionrealizada") ){ %>
                        <div class="mensaje-operacion alert-success alert-block "><button type="button" class="close" data-dismiss="alert">×</button><h4>¡Operacion realizada con exito!</h4><br>Se ha <strong> ${operacionrealizada} </strong> con exito el Terminal Fijo con codigo <strong>${nombreusado}</strong></div>                    
               <%} %>
                
                <table class="admin-table table table-hover">
                    <caption>Tabla para administración de Municipios</caption>
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>CP</th>
                            <th>Fax</th>
                            <th>Nombre</th>                            
                            <th>Numero</th>
                            <th>Acciones <%  if(request.getSession().getAttribute("rolNumber").equals(0)){ %><a href="formMunicipios"><button class="btn btn-info" >Insertar</button></a><% } %> </th>                            
                        </tr>
                    </thead>
                    <tbody>
                            
       
                            
                                <%
                                    for (Iterator iter = collection.iterator(); iter.hasNext();) {
                                                               Municipio element = (Municipio) iter.next(); %>
                                            
                                        <tr>
                                            <td><%= element.getIdMunicipio() %></td>
                                            <td><%= element.getCp() %></td>
                                            <td><%= element.getFax() %></td>
                                            <td><%= element.getNombre() %></td>
                                            <td><%= element.getNumero() %></td>
                                            <td>
                                                <%  if(request.getSession().getAttribute("rolNumber").equals(0)){ %>
                                                        <a href="formEditarMunicipio?idMunicipio=<%= element.getIdMunicipio() %>"<button class="btn" >Editar</button>
                                                       <a href="#advertencia-eliminar" role="button" codigoMunicipio="<%= element.getNombre() %>"  idMunicipio="<%= element.getIdMunicipio()  %>" class="btn btn-danger eliminarEnTabla" data-toggle="modal">Eliminar</a>
                                                <% } %>
                                               <%//<button class="btn" >Editar</button> %>
                                               <%// <button class="btn btn-danger" >Eliminar</button> %>                                                
                                            </td>
                                        </tr>
                              
                              <% } %>
                      </tbody>
                 </table>
                    
                   


        </form>
                
            </div>

<div id="advertencia-eliminar" class="advertencia-eliminar modal hide fade">
              <div class="modal-header">
               <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
               <h3>Advertencia</h3>
              </div>
              <div class="modal-body">
              <p>Esta apunto de eliminar el Municipio con <u>Nombre</u>:</p>
              <font color="red"><h2><center><strong><div class="elimCodigo"></div></strong><br></center></h2></font>
              <h4>¿Estas seguro de que quiere hacerlo?</h4>
              </div>
              <div class="modal-footer">
                
                <form id="eliminarFinal" action="eliminarMunicipio" method="POST">
                    <button class="btn" data-dismiss="modal" aria-hidden="true">Cancelar</button>
                    <input type="hidden" name="idAEliminar" id="idAEliminar" >
                    <button type="submit"  class="btn btn-danger">Eliminar</a>
                </form>
                
                
              </div>
        </div>
    <%@include  file="menuRightRol.jsp" %>  

    </div>
    
    <shared:footeruser></shared:footeruser>
    
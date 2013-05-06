<%-- 
    Document   : insertarUsuario
    Created on : 05-may-2013, 20:05:09
    Author     : Rocio
--%>

<%@page import="entidades.Gruporescate"%>
<%@page import="entidades.Municipio"%>
<%@page import="entidades.Usuario"%>
<%@page import="entidades.Linea"%>
<%@page import="entidades.Modelofijo"%>
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
    
    
  <%   
        Collection usuarios = (Collection)request.getAttribute("usuarios");
        Collection municipios = (Collection)request.getAttribute("municipios");
        Collection grupo = (Collection)request.getAttribute("grupo");
   %>
 
     <!-- Este script es para sombrear la opción en la que estamos sin tener que cambiar la cabecera... enjoy it baby -->
     <!-- Debes ir a "header-rol" y mirar las clases que tienen los li de menu-up -->
     
     <script>$(".menu-terminales").addClass("active");</script>
     
    
    
    <div class="content-main row-fluid">
            <div class="span8 column">
                
                <center><img src="img/insertaruser.jpg"></center><br>
                
                <form class="form-insertar" action="insertarUsuario" method="POST">
                    <label for="Nombre"><strong>Nombre</strong></label><input name="Nombre" type="text" class="input-large" placeholder="Nombre" required><br>
                    <label for="Apellidos"><strong>Apellidos</strong></label><input name="Apellidos" type="text" class="input-large" placeholder="Apellidos" required><br>
                    <label for="Rol"><strong>Rol</strong></label>
                    <select name="Rol"  placeholder="Rol" required>
                        <option value="Usuario">Usuario</option>
                        <option value="JefeServicio">Jefe de Servicio</option>
                        <option value="Controlador">Controlador</option>
                        <option value="Administrador">Administrador</option>
                    </select>    
                        <br> 
                    <label for="Sexo"><strong>Sexo</strong></label>
                    <select name="Sexo"placeholder="Sexo" required>
                        <option value="V">Varon</option>
                        <option value="M">Mujer</option>
                    </select>
                            <br>
                    <label for="DNI"><strong>DNI</strong></label><input name="DNI" type="text" class="input-large" placeholder="DNI" required><br>
                    <label for="Direccion"><strong>Direccion</strong></label><input name="Direccion" type="text" class="input-large" placeholder="Direccion" required><br>
                    <label for="Email"><strong>Email</strong></label><input name="Email" type="text" class="input-large" placeholder="Email" required><br>
                    <label for="Cargo"><strong>Cargo</strong></label><input name="Cargo" type="text" class="input-large" placeholder="Cargo" required><br>
                    
                    <label for="Municipio"><strong>Municipio</strong></label>
                    <select name="Municipio">
                        <option></option>
                         <% for (Iterator iter = municipios.iterator(); iter.hasNext();) {
                                                               Municipio municipio = (Municipio) iter.next(); %>
                        <option value="<%= municipio.getIdMunicipio() %>"><%= municipio.getNombre() %></option>
                        <% } %>
                    </select>
                    
                    <br>
                    
                    <label for="Grupo"><strong>Grupo</strong></label>
                    <select name="Grupo">
                        <option></option>
                         <% for (Iterator iter = grupo.iterator(); iter.hasNext();) {
                                                               Gruporescate grup = (Gruporescate) iter.next(); %>
                        <option value="<%= grup.getIdGrupoRescate() %>"><%= grup.getNombre() %></option>
                        <% } %>
                    </select>
                    
                    <br>

                    <button class="btn btn-info" type="submit">Insertar</button>
                     <a href="adminUsuario"<button class="btn btn-danger" type="button">Cancelar</button></a>
                    
                </form>
                
            </div>


    <shared:menuuser></shared:menuuser>

    </div>
    
    <shared:footeruser></shared:footeruser>
    

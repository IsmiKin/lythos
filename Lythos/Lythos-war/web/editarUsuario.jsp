<%-- 
    Document   : editarUsuario
    Created on : 05-may-2013, 20:26:22
    Author     : Rocio
--%>

<%@page import="entidades.Gruporescate"%>
<%@page import="entidades.Municipio"%>
<%@page import="entidades.Tarifa"%>
<%@page import="entidades.Modelomovil"%>
<%@page import="entidades.Terminalmovil"%>
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
        Collection grupo = (Collection)request.getAttribute("grupo");
        Collection municipios = (Collection)request.getAttribute("municipios");
        Usuario usuario = (Usuario)request.getAttribute("usuario");
    %>
    
    <div class="content-main row-fluid">
            <div class="span8 column">
                
                <center><img src="img/editargeneral.jpg"></center><br>
                
                <form class="form-insertar" action="editarUsuario" method="POST">
                    <input type="hidden" name="idUsuario" value="<%= usuario.getIdUsuario() %>">
                    <label for="Nombre"><strong>Nombre</strong></label><input name="Nombre" type="text" class="input-large" placeholder="Nombre" required value="<%= usuario.getNombre() %>"/><br>
                    <label for="Apellidos"><strong>Apellidos</strong></label><input name="Apellidos" type="text" class="input-large" placeholder="Apellidos"   required value="<%= usuario.getApellidos() %>"/><br>
                    <label for="Rol"><strong>Rol</strong></label><input name="Rol" type="text" class="input-large" placeholder="Rol" required value="<%= usuario.getRol() %>"/><br>
                    <label for="Sexo"><strong>Sexo</strong></label><input name="Sexo" type="text" class="input-large" placeholder="Sexo" required value="<%= usuario.getSexo() %>"/><br>
                    <label for="DNI"><strong>DNI</strong></label><input name="DNI" type="text" class="input-large" placeholder="DNI" required value="<%= usuario.getDni() %>"/><br>
                    <label for="Direccion"><strong>Direccion</strong></label><input name="Direccion" type="text" class="input-large" placeholder="Direccion" required value="<%= usuario.getDireccion() %>"/><br>
                    <label for="Email"><strong>Email</strong></label><input name="Email" type="text" class="input-large" placeholder="Email" required value="<%= usuario.getEmail() %>"/><br>
                    <label for="Cargo"><strong>Cargo</strong></label><input name="Cargo" type="text" class="input-large" placeholder="Cargo" required value="<%= usuario.getCargo() %>"/><br>
                    <label for="Municipio"><strong>Municipio</strong></label>                                       
                    <select name="Municipio">
                        <option></option>
                         <% for (Iterator iter = municipios.iterator(); iter.hasNext();) {
                                                               Municipio municipio = (Municipio) iter.next(); %>
                        <option value="<%= municipio.getIdMunicipio() %>" <% if((municipio.getIdMunicipio()!=null) &&(municipio.getIdMunicipio()==usuario.getMunicipioidMunicipio().getIdMunicipio())){  %> selected <% } %> >  <%= municipio.getIdMunicipio() %> </option>
                        <% } %>
                    </select>
                    
                    <br>
                    
                    <label for="Grupo"><strong>Grupo</strong></label>                                       
                    <select name="Grupo">
                        <option></option>
                         <% for (Iterator iter = grupo.iterator(); iter.hasNext();) {
                                                               Gruporescate grup = (Gruporescate) iter.next(); %>
                        <option value="<%= grup.getIdGrupoRescate() %>" <% if((grup.getIdGrupoRescate()!=null) &&(grup.getIdGrupoRescate()==usuario.getGrupoRescateidGrupoRescate().getIdGrupoRescate())){  %> selected <% } %> >  <%= grup.getIdGrupoRescate() %> </option>
                        <% } %>
                    </select>
                    
                    <br>
                    <button class="btn btn-info" type="submit">Editar</button>
                    <a href="adminUsuario"<button class="btn btn-danger" type="button">Cancelar</button></a>
                    
                </form>
                
            </div>
                    
    <shared:menuuser></shared:menuuser>

    </div>
    
    <shared:footeruser></shared:footeruser>
    
    
    



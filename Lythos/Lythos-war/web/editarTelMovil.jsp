<%-- 
    Document   : editarTelMovil
    Created on : 04-may-2013, 19:40:42
    Author     : Rocio
--%>

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
    
    <!-- Anotacion : Esta vista puede verla el Controlador y el Administrador, pero para el Controlador es solo de vista ,
                            asi que las acciones las "filtrarermos" en vivo -->
    
    <% int nivelSeguridad = 0; %>
    
     <%@include  file="menuBarRol.jsp" %>
    
    
  <%    Collection modelos = (Collection)request.getAttribute("modelos");
        Collection usuarios = (Collection)request.getAttribute("usuarios");
        Collection lineas = (Collection)request.getAttribute("lineas");
        Terminalmovil terminal = (Terminalmovil)request.getAttribute("terminal");
    %>
    
    <div class="content-main row-fluid">
            <div class="span8 column">
                
                <center><img src="img/editargeneral.jpg"></center><br>
                
                <form class="form-insertar" action="editarTelMovil" method="POST">
                    <input type="hidden" name="idTerminal" value="<%= terminal.getIdTerminalMovil() %>">
                    <label for="Codigo"><strong>Codigo</strong></label><input name="Codigo" type="text" class="input-large" placeholder="Codigo" required value="<%= terminal.getCodigo() %>" /><br>
                    <label for="Modelo"><strong>Modelo</strong></label>                                       
                    <select name="Modelo">
                        <option></option>
                         <% for (Iterator iter = modelos.iterator(); iter.hasNext();) {
                                                               Modelomovil modelo = (Modelomovil) iter.next(); %>
                        <option value="<%= modelo.getIdModeloMovil() %>" <% if((terminal.getModeloMovilidModeloMovil()!=null) &&(modelo.getIdModeloMovil()==terminal.getModeloMovilidModeloMovil().getIdModeloMovil() )){  %> selected <% } %>  ><%= modelo.getModelo() %></option>
                        <% } %>
                    </select>                    
                    
                    <label for="Usuario"><strong>Usuario</strong></label>                                       
                    <select name="Usuario">
                        <option></option>
                         <% for (Iterator iter = usuarios.iterator(); iter.hasNext();) {
                                                               Usuario user = (Usuario) iter.next(); %>
                        <option value="<%= user.getIdUsuario() %>" <% if((terminal.getUsuarioidUsuario()!=null) &&(user.getIdUsuario()==terminal.getUsuarioidUsuario().getIdUsuario())){  %> selected <% } %> ><%= user.getNombre()  %></option>
                        <% } %>
                    </select>
                    
                    <label for="Linea"><strong>Linea</strong></label>                                       
                    <select name="Linea">
                        <option></option>
                         <% for (Iterator iter = lineas.iterator(); iter.hasNext();) {
                                                               Linea linea = (Linea) iter.next(); %>
                        <option value="<%= linea.getIdLinea() %>" <% if((terminal.getLineaidLinea()!=null) &&(linea.getIdLinea()==terminal.getLineaidLinea().getIdLinea())){  %> selected <% } %> >  <%= linea.getNumero()  %> </option>
                        <% } %>
                    </select>
                    
                    <br>
                    <button class="btn btn-info" type="submit">Editar</button>
                    <a href="adminTelMovil"<button class="btn btn-danger" type="button">Cancelar</button></a>
                    
                </form>
                
            </div>
                    
<%@include  file="menuRightRol.jsp" %>  

    </div>
    
    <shared:footeruser></shared:footeruser>
    
    
    

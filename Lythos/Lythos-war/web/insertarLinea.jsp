<%-- 
    Document   : insertarLinea
    Created on : 04-may-2013, 21:45:23
    Author     : Rocio
--%>

<%@page import="entidades.Tarifa"%>
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
    
    
  <%    Collection lineas = (Collection)request.getAttribute("lineas");
        Collection tarifas = (Collection)request.getAttribute("tarifas");
    %>
 
     <!-- Este script es para sombrear la opción en la que estamos sin tener que cambiar la cabecera... enjoy it baby -->
     <!-- Debes ir a "header-rol" y mirar las clases que tienen los li de menu-up -->
     
     <script>$(".menu-terminales").addClass("active");</script>
     
     <div class="content-main row-fluid">
            <div class="span8 column">
                
                <center><img src="img/insertarlinea.jpg"></center><br>
                
                <form class="form-insertar" action="insertarLinea" method="POST">
                    <label for="Numero"><strong>Numero</strong></label><input name="Numero" type="text" class="input-large" placeholder="Codigo"><br>
                    <label for="Tipo"><strong>Tipo</strong></label>
                    <select name="Tipo" placeholder="Tipo" required>
                        <option value="fija">Fija</option>
                        <option value="movil">Movil</option>
                    </select>
                        
                    <label for="VoIP"><strong>VoIP</strong></label><select name="VoIP"  placeholder="VoIP" required><option value="Si">Si</option><option value="No">No</option></select>
                        
                    <label for="Pais"><strong>Pais</strong></label><input name="Pais" type="text" class="input-large" placeholder="Pais" required><br>
                    
                    <label for="Tarifa"><strong>Tarifa</strong></label>
                    <select name="Tarifa">
                        <option></option>
                         <% for (Iterator iter = tarifas.iterator(); iter.hasNext();) {
                                                               Tarifa tarifa = (Tarifa) iter.next(); %>
                        <option value="<%= tarifa.getIdTarifa() %>"><%= tarifa.getNombre() %></option>
                        <% } %>
                    </select>
                    
                    <br>
                     <button class="btn btn-info" type="submit">Insertar</button>
                     <a href="adminTelMovil"<button class="btn btn-danger" type="button">Cancelar</button></a>
                    
                </form>
                
            </div>


    <%@include  file="menuRightRol.jsp" %>  

    </div>
    
    <shared:footeruser></shared:footeruser>
    
<%-- 
    Document   : editarLinea
    Created on : 05-may-2013, 12:24:47
    Author     : Rocio
--%>

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
    
    <!-- Anotacion : Esta vista puede verla el Controlador y el Administrador, pero para el Controlador es solo de vista ,
                            asi que las acciones las "filtrarermos" en vivo -->
    
    <% int nivelSeguridad = 0; %>
    
    <%@include  file="menuBarRol.jsp" %>
  <%   
        Collection lineas = (Collection)request.getAttribute("lineas");
        Collection tarifas = (Collection)request.getAttribute("tarifas");
        Linea linea = (Linea)request.getAttribute("linea");
    %>
    
    <div class="content-main row-fluid">
            <div class="span8 column">
                
                <center><img src="img/editargeneral.jpg"></center><br>
                
                <form class="form-insertar" action="editarLinea" method="POST">
                    <input type="hidden" name="idLinea" value="<%= linea.getIdLinea() %>">
                    <label for="Numero"><strong>Numero</strong></label><input name="Numero" type="text" class="input-large" placeholder="Numero" value="<%= linea.getNumero() %>"/><br>
                    <label for="Tipo"><strong>Tipo</strong></label>
                    <select name="Tipo" placeholder="Tipo" required>
                        <option value="fija">Fija</option>
                        <option value="movil">Movil</option>
                    </select>
                        
                    <label for="VoIP"><strong>VoIP</strong></label><select name="VoIP"  placeholder="VoIP" required><option value="Si">Si</option><option value="No">No</option></select>
                    <label for="Pais"><strong>Pais</strong></label><input name="Pais" type="text" class="input-large" placeholder="Pais" value="<%= linea.getPais() %>"/> <br> 

                    <label for="Tarifa"><strong>Tarifa</strong></label>                                       
                    <select name="Tarifa">
                        <option></option>
                         <% for (Iterator iter = tarifas.iterator(); iter.hasNext();) {
                                                               Tarifa tarifa = (Tarifa) iter.next(); %>
                        <option value="<%= tarifa.getIdTarifa() %>" <% if((linea.getTarifaidTarifa()!=null) &&(tarifa.getIdTarifa()==linea.getTarifaidTarifa().getIdTarifa())){  %> selected <% } %> >  <%= tarifa.getIdTarifa()  %> </option>
                        <% } %>
                    </select>
                    
                    <br>
                    <button class="btn btn-info" type="submit">Editar</button>
                    <a href="adminLineas"<button class="btn btn-danger" type="button">Cancelar</button></a>
                    
                </form>
                
            </div>
                    
    <%@include  file="menuRightRol.jsp" %>  

    </div>
    
    <shared:footeruser></shared:footeruser>
    
    
    


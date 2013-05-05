<%-- 
    Document   : home
    Created on : 23-abr-2013, 12:58:52
    Author     : IsmiKin
--%>

<%@page import="entidades.Linea"%>
<%@page import="entidades.Usuario"%>
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

     <!-- LIBRERIAS ESENCIALES -->
    <shared:headerlibs></shared:headerlibs>  
        
    <!--   La variable nivelSeguridad es requerida en menuBarRol.jsp para verificar que tipo de Rol puede acceder a esta pagina 
            Si la pagina es publica debes usar el nivel de Seguridad 4 (invitado) 
            Dependiendo del rol lanzara un menubar u otro
       -->
    
    <% int nivelSeguridad = 0; %>
    
    <%@include  file="menuBarRol.jsp" %>
               
     <!-- Este script es para sombrear la opción en la que estamos sin tener que cambiar la cabecera... enjoy it baby 
           Debes ir a "header-rol" y mirar las clases que tienen los li de menu-up -->
     
     
    
  <%    
      Collection modelos = (Collection)request.getAttribute("modelos");	   
      Collection usuarios = (Collection)request.getAttribute("usuarios");	   
      Collection lineas = (Collection)request.getAttribute("lineas");	   
      Terminalfijo terminal = (Terminalfijo)request.getAttribute("terminal");	   
  %>
 
     <!-- Este script es para sombrear la opción en la que estamos sin tener que cambiar la cabecera... enjoy it baby -->
     <!-- Debes ir a "header-rol" y mirar las clases que tienen los li de menu-up -->
     
     <script>
         $(".menu-terminales").addClass("active");
         
          $(document).ready(function(){
                    
                    var existe = false;
                    var codigoActual =$("#inputCodigo").val();
                    
                    $("#inputCodigo").change(checkingCodigo);
                    $("#btnEditarForm").click(function(){                           
                            if(!existe)
                                $(".form-insertar").submit();                                                                                            
                        });
                    
                    $("#inputCodigo").tooltip({'trigger':'hover', 'title': '<b>Obligatorio</b>.<br>Campo <i>unico</i>, no puede repetirse', 'placement':'right', 'html':true});
                        
                    function checkingCodigo(){
                        var codigo = $(this).val();
                        
                        $.ajax({
                            type:"POST", url:"telfijos/checkTelFijo", data:{ codigo:codigo }, success: function(message){                                                                
                                
                                if( (message=="existe") && ( $("#inputCodigo").val() != codigoActual ) ){                                        
                                        $(".codigoexistente").text( codigo);                        
                                        $(".checkexistente").fadeIn("slow");
                                        existe=true;
                                       
                                }
                                else{
                                        $(".checkexistente").fadeOut("slow");
                                       existe=false;
                                }
                            }
                        });
                       
                    }
                    
                    
                });
     </script>
     
    
    
    <div class="content-main row-fluid">
            <div class="span8 column">
                
                <center><img src="img/editelfijos.png"></center><br>
                
                <form class="form-insertar" action="telfijos/editar" method="POST">
                    <input type="hidden" name="idTerminal" value="<%= terminal.getIdTerminalFijo() %>">
                       <div class="checkexistente mensaje-operacion alert-error alert-block  " hidden="hidden"><button type="button" class="close" data-dismiss="alert">×</button><h4>¡Codigo ya existente!</h4><br>El codigo <strong><span class="codigoexistente"> </span></strong> ya existe y no pueden repetirse, use otro.</div>
                    <label for="Codigo"><strong>Codigo</strong></label><input name="Codigo" id="inputCodigo" type="text" class="input-large" placeholder="Codigo" required value="<%= terminal.getCodigo() %>" /><br>
                    <label for="Modelo"><strong>Modelo</strong></label>                                       
                    <select name="Modelo">
                        <option></option>
                         <% for (Iterator iter = modelos.iterator(); iter.hasNext();) {
                                                               Modelofijo modelo = (Modelofijo) iter.next(); %>
                        <option value="<%= modelo.getIdModeloFijo() %>" <% if((terminal.getModeloFijoidModeloFijo()!=null) &&(modelo.getIdModeloFijo()==terminal.getModeloFijoidModeloFijo().getIdModeloFijo() )){  %> selected <% } %>  ><%= modelo.getModelo() %></option>
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
                    <a href="telfijos/admin"<button id="btnEditarForm" class="btn btn-danger" type="button">Cancelar</button></a>
                    
                </form>
                
            </div>  
 
    <%@include  file="menuRightRol.jsp" %>  

    </div>
    
    <shared:footeruser></shared:footeruser>
    
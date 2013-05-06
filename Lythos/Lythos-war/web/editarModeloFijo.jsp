
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
    
    <% int nivelSeguridad = 0; %>
    
    <%@include  file="menuBarRol.jsp" %>
      
 
     <!-- Este script es para sombrear la opciÃ³n en la que estamos sin tener que cambiar la cabecera... enjoy it baby -->
     <!-- Debes ir a "header-rol" y mirar las clases que tienen los li de menu-up -->
     
     <script>
         $(".menu-terminales").addClass("active");
     </script>
     
    <%    
            Modelofijo modelofijo = (Modelofijo)request.getAttribute("modelofijo");
           	   
            	   
        %>
 
 
        <div class=" content-main row-fluid">
            <div class="content-main-left span8 column">
                
                <center><img src="img/modelofijo.jpg"></center><br> 
                
                <form class="formEditarModelosFijos" action="editarModeloFijo" method="POST">
                    
                    <input type="hidden" name="idModeloFijo" value="<%=modelofijo.getIdModeloFijo()%>">
                    <label for="Marca"><strong>Marca</strong></label> 
                    <p><input type="text" value="<%=modelofijo.getMarca()%>" name="marca" size="20" required></p>
                    <label for="Modelo"><strong>Modelo</strong></label> 
                    <!--<p><input type="text" value="<%=modelofijo.getLanzamiento() %>" name="lanzamiento" size="20" required></p>-->
                    <!--//<label for="Modelo"><strong>Lanzamiento</strong></label>--> 
                    <p><input type="text" value="<%=modelofijo.getModelo() %>" name="modelo" size="20" required></p>
                     <label for="Detalles"><strong>Detalles</strong></label>
                    <p><input type="text" value="<%=modelofijo.getDetalles() %>" name="detalles" size="20" required></p>
                     
                    
                    
                  
                    
                    <br>
                    <button class="btn btn-info" type="submit">Guardar Cambios</button>
                    <a href="modelosfijos"<button class="btn btn-danger" type="button">Cancelar</button></a>
                    
                </form>
                
            </div>                                            

    <%@include  file="menuRightRol.jsp" %>

    </div>
    
    <shared:footeruser></shared:footeruser>


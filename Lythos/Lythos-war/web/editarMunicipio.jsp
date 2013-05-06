<%-- 
    Document   : editarMunicipio
    Created on : 03-may-2013, 13:39:21
    Author     : Pablo
--%>

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
    
    <% int nivelSeguridad = 0; %>
    
    <%@include  file="menuBarRol.jsp" %>
    
       <script language="javascript">
function Validate()
{
        var x = document.frm.numero.value;
        var y = document.frm.fax.value;
        var z = document.frm.cp.value;
        
        
        if(isNaN(z)|| z.indexOf(" ")!=-1){
              alert("Introduzca un código postal válido(numérico)");return false; 
          }
          if (z.length != 5 ){
                alert("Introduzca un código postal de 5 caracteres numéricos"); return false;
           } 
        
        if(isNaN(y)|| y.indexOf(" ")!=-1){
              alert("Introduzca un fax válido(numérico)");return false; 
          }
          if ((y.length > 10) || (y.length < 8) ){
                alert("Introduzca un fax entre 8 y 10 caracteres numéricos"); return false;
           }  
        if(isNaN(x)|| x.indexOf(" ")!=-1){
              alert("Introduzca un número válido(numérico)");return false; }
        if ((x.length > 10) || (x.length < 8) ){
                alert("Introduzca un número entre 8 y 10 caracteres numéricos"); return false;
           }  
}

</script>
  
 
     <!-- Este script es para sombrear la opción en la que estamos sin tener que cambiar la cabecera... enjoy it baby -->
     <!-- Debes ir a "header-rol" y mirar las clases que tienen los li de menu-up -->
     
     <script>
         $(".menu-terminales").addClass("active");
     </script>
     
    <%    
            Municipio municipio = (Municipio)request.getAttribute("municipio");
           	   
            	   
        %>
 
 
        <div class="content-main row-fluid">
            <div class="span8 column">
                
                <center><img src="img/editar_muni2.jpg"></center><br> 
                
                <form  name="frm" class="form-insertar" action="editarMunicipio" method="POST" onsubmit="return Validate()">
                    <input type="hidden" name="idMunicipio" value="<%=municipio.getIdMunicipio()  %>">
                    <label for="Modelo"><strong>Nombre</strong></label> 
                    <p><input type="text" value="<%=municipio.getNombre()%>" name="nombre" size="20" required></p>
                    <label for="Modelo"><strong>Codigo Postal</strong></label> 
                    <p><input type="text" value="<%=municipio.getCp() %>" name="cp" size="20" required></p>
                    <label for="Modelo"><strong>Fax</strong></label> 
                    <p><input type="text" value="<%=municipio.getFax() %>" name="fax" size="20" required></p>
                     <label for="Modelo"><strong>Numero</strong></label> 
                    <p><input type="text" value="<%=municipio.getNumero() %>" name="numero" size="20" required></p>
                    
                  
                    
                    <br>
                    <button class="btn btn-info" type="submit">Guardar Cambios</button>
                    <a href="AdminMunicipios"<button class="btn btn-danger" type="button">Cancelar</button></a>
                    
                </form>
                
            </div>
    
                                      

    <%@include  file="menuRightRol.jsp" %>  

    </div>
    
    <shared:footeruser></shared:footeruser>
    
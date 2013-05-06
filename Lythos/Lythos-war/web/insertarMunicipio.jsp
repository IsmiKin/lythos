<%-- 
    Document   : insertarMunicipio
    Created on : 02-may-2013, 13:23:04
    Author     : Pablo
--%>
<%@page import="entidades.Municipio"%>

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
     
    
    
     <div  class="content-main row-fluid ">
           <div  class="span8 column content-main-left"> 
                
                <center><img src="img/añadirmuni.jpg"></center><br>
 
               <% // <head title="Formulario" >INSERTAR MUNICIPIO </head> /%>              
    <% //  <body> %>
    <form name="frm" method="POST" class="form-insertar" action="insertarMunicipio" onsubmit="return Validate()">
  <!--webbot bot="SaveResults" 
   U-File="fpweb:///_private/form_results.txt"
  S-Format="TEXT/CSV" S-Label-Fields="TRUE" -->
</p>
<p><strong>Nombre :</strong> <input type="text"  name="nombre" size="20" required></p>
  <p><strong>Codigo Postal :</strong> <input type="text" name="cp" size="20" required></p>
  <p><strong>Fax : </strong><input type="text" name="fax" size="20" required></p>
  <p><strong>Numero :</strong> <input type="text" name="numero" size="20"  required></p>
  <button  type="submit" class="btn btn-info" >Añadir</button>
   <a href="AdminMunicipios"<button class="btn btn-danger" type="button">Cancelar</button></a>
  </p>
</form>
   <% //  </body> %>      
 </div>                                        

    <%@include  file="menuRightRol.jsp" %>  

    </div>
    
    <shared:footeruser></shared:footeruser>
    
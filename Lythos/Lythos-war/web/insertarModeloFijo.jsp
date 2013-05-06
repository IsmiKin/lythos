<%-- 
    Document   : insertarModeloFijo
    Created on : 01-may-2013, 21:41:20
    Author     : Antonio Sánchez Valadez.
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="shared" tagdir="/WEB-INF/tags" %>

<!-- http://www.kendoui.com/jsp/tags -->
<%@taglib prefix="kendo" uri="http://www.kendoui.com/jsp/tags"%>

   
    <shared:headerlibs></shared:headerlibs>
    
    <!-- Anotacion : Esta vista puede verla el Controlador y el Administrador, pero para el Controlador es solo de vista ,
                            asi que las acciones las "filtrarermos" en vivo -->
    
    <% int nivelSeguridad = 0; %>
    
    <%@include  file="menuBarRol.jsp" %>
 

    <!-- Este script es para sombrear la opción en la que estamos sin tener que cambiar la cabecera... enjoy it baby -->
    <!-- Debes ir a "header-rol" y mirar las clases que tienen los li de menu-up -->
    
    <script>
        $(".menu-terminales").addClass("active");
    </script>
    
   
   
    <div  class="content-main row-fluid ">
          <div  class="span8 column content-main-left"> 
               
               <center><img src="img/modelofijo.jpg"></center><br>

               
<body>
    <form class="formEditarModelosFijos" method="POST" action="insertarmodelosfijos">
        <h4>INSERTAR MODELO FIJO </h4>  
 <!--webbot bot="SaveResults" 
  U-File="fpweb:///_private/form_results.txt"
 S-Format="TEXT/CSV" S-Label-Fields="TRUE" -->
</p>
 <p>Marca : <input type="text" name="marca" size="20" required></p>
 <p>Modelo : <input type="text" name="modelo" size="20" required></p>
 <p>Lanzamiento : <input type="text" name="lanzamiento" size="20"></p>
 <p>Detalles : <input type="text" name="detalles" size="20"></p>
 <button  type="submit" class="btn btn-info"  >Insertar</button>
  <a href="modelosfijos"<button class="btn btn-danger" type="button">Cancelar</button></a>
 </p>
</form>
</body>      
</div>

    <%@include  file="menuRightRol.jsp" %>

   </div>
   
   <shared:footeruser></shared:footeruser>
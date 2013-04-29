<%-- 
    Document   : contacto
    Created on : 28-mar-2013, 2:08:01
    Author     : IsmiKin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="shared" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="kendo" uri="http://www.kendoui.com/jsp/tags"%>

<shared:headerlibs></shared:headerlibs>
<shared:headerguest></shared:headerguest>


<script>
     
</script>



<div class="container info-contact">
    
    <%                
        
    if (request.getParameter("nombre") != null) { %>
    <center>
        <img src="img/Forward.png">
        <div class="alert alert-success"><strong>¡Exito!</strong> El mensaje ha sido enviado con exito</div>
    </center>
    <%}
    else{            
    %>
    
    <script>
        $(document).ready(function(){
            $("#tipocontacto").kendoDropDownList({
                dataSource:[ { "title"  :  "Atencion al Cliente", "valor" : 1 }, { "title" : "Servicio Tecnico", "valor": 2 }, { "title": "Departamento Contable", "valor":3 }],
                dataTextField: "title", dataValueField:"valor"
            });
        }); 
        
    </script>
    
    <div class="row-fluid">
        
        <div class="row-fluid"><!-- Fila de campos principales e imagen -->
            <div class="row-fluid"><legend>Contacto</legend></div>
            
          <form id="contacto" action="#" method="post">
            <fieldset>
            
            <div class="row-fluid">
                <div class="span4"><!-- Campos -->
                    <input name="nombre" type="text" placeholder="Nombre" required></input><br>                                                            
                    
                    <input name="correo" type="email" placeholder="Email" required></input><br>
                    
                    <input type="text" id="tipocontacto"></input>
                    
                    <input name="entidad" type="text" placeholder="Entidad"></input><br>

                </div>
                <div class="span4"><!-- Imagen -->
                    <img src="img/mail.png">
                </div>
            </div>
            
            
            <div class="row-fluid">
                <div class="span8">
                <kendo:editor exec="exec" name="mensaje">
                </kendo:editor>
                    <br>
            </div>
            </div>
            
            <div class="row-fluid">
                <div class="span4"></div>
                <div class="span4">
                    <button class="btn btn-large btn-primary" type="submit">Enviar</button>
                </div>
                
            </div>
                        
        </div>
        </fieldset>
       </form>
        
    </div>
    
    <%      }           %>
</div>
    
    
    
<shared:footerguest></shared:footerguest>


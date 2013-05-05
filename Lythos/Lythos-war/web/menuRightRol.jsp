<%-- 
    Document   : menuRightRol
    Created on : 03-may-2013, 12:43:39
    Author     : IsmiKinPorti
--%>

  <% 
            // IMPORTANTE: En el menuBarRol.jsp ya comprobamos el Rol y si puede ver esta pagina asi que
            //                          aqui lo ignoramos
      
          // La variable de nivelSeguridad la ponemos a mano para decidir hasta que rol puede entrar en esta pagina
         // String nivelSeguridad = [0-3], Administrador = 0, Controlador = 1, JefeServicio = 2, Usuario = 3                    
                     
                // Already created. 

                 if(rol.equals("Administrador")){ %>
                              <shared:menuadmin></shared:menuadmin>
                <%  } else if(rol.equals("Controlador")){ %>
                              <shared:menucontrolador></shared:menucontrolador>
                <%  } else if(rol.equals("JefeServicio")){   %>
                              <shared:menujefe></shared:menujefe> 
                <%  } else if(rol.equals("Usuario")){    %> 
                            <shared:menuuser></shared:menuuser>
                <%  }
            
     %>

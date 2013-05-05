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
          
          if (session == null) {
                // Not created yet. Now do so yourself.
                if(nivelSeguridad<4)
                    response.sendRedirect("errorLogin.jsp");
            } else {
                // Already created. 
                if(nivelSeguridad>rolNumber){                    
                    
                if(rol.equals("Administrador")){ %>
                        <shared:menuadmin></shared:menuadmin>
                  <%  }               
                
                }
                else
                    response.sendRedirect("errorLogin.jsp");
                
                
            }
     %>

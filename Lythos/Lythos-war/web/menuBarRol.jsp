<%-- 
    Document   : menuBarRol
    Created on : 03-may-2013, 12:40:30
    Author     : IsmiKinPorti
--%>


          
    <% 
          
          // La variable de nivelSeguridad la ponemos a mano para decidir hasta que rol puede entrar en esta pagina
         // String nivelSeguridad = [0-3], Administrador = 0, Controlador = 1, JefeServicio = 2, Usuario = 3
          HttpSession sesion = request.getSession(false);
          String rol = (String)sesion.getAttribute("rol");
          Integer rolNumber = (Integer)sesion.getAttribute("rolNumber");
          if (session == null) {
                // Not created yet. Now do so yourself.
                if(nivelSeguridad<4)
                    response.sendRedirect("errorLogin.jsp");
            } else {
                // Already created. 
                if(rolNumber<=nivelSeguridad){                    
                    
                        if(rol.equals("Administrador")){ %>
                                        <shared:headeradmin></shared:headeradmin>
                          <%  } else if(rol.equals("Controlador")){ %>
                                        <shared:headercontrolador></shared:headercontrolador>
                          <%  } else if(rol.equals("JefeServicio")){   %>
                                        <shared:headerjefe></shared:headerjefe> 
                          <%  } else if(rol.equals("Usuario")){    %> 
                                      <shared:headerusuario></shared:headerusuario>
                          <%  }
                    }
                    else{
                        response.sendRedirect("/Lythos-war/errorPermission.jsp"); 
                    }
                
            }
     %>
     
<%-- 
    Document   : menucontrolador
    Created on : 04-may-2013, 2:15:49
    Author     : IsmiKin
--%>

<%@tag description="put the tag description here" pageEncoding="UTF-8"%>

    <div id="menuderecha" class="span4 column">
            <img alt="140x140" src="http://lorempixel.com/140/140/" class="img-polaroid" />
                <ul class="nav nav-list">
                        <li class="nav-header">
                                Mi cuenta
                        </li>
                        <li>
                            <strong>Nombre: </strong> <%= request.getSession().getAttribute("nombre") %><br>
                            <strong>Rol: </strong> <%= request.getSession().getAttribute("rol") %>
                        </li>
                        <li >
                               <a href="logout">Cerrar Sesion</a>
                        </li>
                        <li class="nav-header">
                                Mis cosas
                        </li>
                        <li class="active">
                                <a href="telfijos/mistelfijos?nickname=<%= request.getSession().getAttribute("nickname") %>">Telefonos Fijos</a> <!-- No usamos el idUsuario directamente por seguridad -->
                        </li>
                        <li>
                                <a href="#">Telefonos Moviles</a>
                        </li>
                        <li>
                                <a href="#">Grupo de Rescate</a>
                        </li>
                        <li class="nav-header">
                                Otros
                        </li>
                        <li>
                                <a href="#">Mi perfil</a>
                        </li>
                        <li>
                                <a href="#">Solicitar</a>
                        </li>
                        <li class="divider">
                        </li>
                        <li>
                                <a href="#">Ayuda</a>
                        </li>
                </ul>
        </div>
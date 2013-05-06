<%-- 
    Document   : headeradmin
    Created on : 30-mar-2013, 20:00:02
    Author     : IsmiKin
    Description : Cabecera para la vista de Administrador
--%>

<%@tag description="put the tag description here" pageEncoding="UTF-8"%>

<link rel="stylesheet" href="css/pages/home.css" />

<div class=" menu-barra navbar navbar-inverse navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container-fluid">
            <a class="brand" href="#">Proyecto Lythos</a>
            <div class="nav-collapse collapse">
                <ul class="nav">
                    <li > <a href="#"> Inicio </a> </li>
                    <li > <a href="adminLineas"> Lineas </a> </li>
                    <li > <a href="#"> Contabilidad </a> </li>
                    <li > <a href="#"> Listin Telefonico </a> </li>
                    <li > <a href="adminUsuario">Usuarios</a>  </a> </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle menu-terminales" data-toggle="dropdown">Terminales <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li class="nav-header">Terminales Fijos</li>
                          <li><a href="telfijos/admin">Administrar</a></li>                          
                          <li><a href="telfijos/formTelFijos">Insertar</a></li>                          
                          <li><a href="modelosfijos">Modelos</a></li>                                                    
                          <li class="divider"></li>
                          <li class="nav-header">Terminales Moviles</li>
                          <li><a href="adminTelMovil">Administrar</a></li>
                          <li><a href="formTelMovil">Insertar</a></li>    
                          <li><a href="adminModeloTelMovil">Modelos</a></li>
                        </ul>
                      </li>
                      <li class="dropdown">
                          <a href="#" class="dropdown-toggle menu-gestion" data-toggle="dropdown">Gestion Interna <b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                    <li class="nav-header">Municipios</li>
                                    <li><a href="AdminMunicipios">Administrar</a></li>
                                    <li><a href="formMunicipios">Insertar</a></li>
                            </ul>
                      </li>
                    
                </ul>
            </div>
        </div>
    </div>
</div>
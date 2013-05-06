<%-- 
    Document   : headerjefe
    Created on : 03-may-2013, 23:54:20
    Author     : IsmiKin
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
                          <li><a href="adminModeloTelMovil">Modelos</a></li>
                          <li class="divider"></li>
                          <li class="nav-header">Terminales Moviles</li>
                          <li><a href="adminTelMovil">Administrar</a></li>
                          <li><a href="formTelMovil">Insertar</a></li>   
                          <li><a href="adminModeloTelMovil">Modelos</a></li>
                        </ul>
                      </li>
                    <li > <a href="#"> Gestion Interna </a> </li>
                </ul>
            </div>
        </div>
    </div>
</div>
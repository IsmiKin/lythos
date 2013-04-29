<%-- 
    Document   : header
    Created on : 23-mar-2013, 19:08:35
    Author     : IsmiKin
--%>

<%@tag description="cabecera de todas las paginas" pageEncoding="UTF-8"%>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>

<html>
    <head>
        <base href="<%=basePath%>">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Proyecto Lythos</title>
        <link rel="stylesheet" href="css/kendoui/kendo.common.min.css" />
        <link rel="stylesheet" href="css/kendoui/kendo.default.min.css" />
        <link rel="stylesheet" href="css/bootstrap/bootstrap.min.css" />
        
        <link href='http://fonts.googleapis.com/css?family=Merienda:400,700' rel='stylesheet' type='text/css'>
        
        <script src="js/jquery.min.js"></script>
        <script src="js/kendo.all.min.js"></script>
       <!-- <script src="js/bootstrap.min.js"></script> -->
            
        <!-- BOOTSTRAP JS -->
        
        <script src="js/bootstrap-transition.js"></script>
        <script src="js/bootstrap-alert.js"></script>
        <script src="js/bootstrap-modal.js"></script>
        <script src="js/bootstrap-dropdown.js"></script>
        <script src="js/bootstrap-scrollspy.js"></script>
        <script src="js/bootstrap-tab.js"></script>
        <script src="js/bootstrap-tooltip.js"></script>
        <script src="js/bootstrap-popover.js"></script>
        <script src="js/bootstrap-button.js"></script>
        <script src="js/bootstrap-collapse.js"></script>
        <script src="js/bootstrap-carousel.js"></script>
        <script src="js/bootstrap-typeahead.js"></script>
                
        <link href="/img/favicon.ico" rel="icon" type="image/x-icon" />
        
    </head>
    <body>
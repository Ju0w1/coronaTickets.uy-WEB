<%-- 
    Document   : consultaEspectaculosDePaquete
    Created on : Oct 6, 2021, 5:59:49 PM
    Author     : pabli
--%>

<%@page import="DTOs.FuncionesParaArtistaDTO"%>
<%@page import="DTOs.FuncionDTOConsultaEspectaculo"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="Logica.Clases.Paquete"%>
<%@page import="Logica.Clases.Funcion"%>
<%@page import="java.util.HashMap"%>
<%@page import="Logica.Clases.Categoria"%>
<%@page import="Logica.Clases.Espectaculo"%>
<%@page import="java.util.Map"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">

    <head>
        <link rel="icon" href="https://i.imgur.com/KXDtCAj.png">
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>CoronaTickets - Sorteo</title>
        <!-- CSS only -->

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700&display=swap" rel="stylesheet">

        <style>
            body {
                font-family: 'Montserrat', sans-serif;
            }
        </style>
    </head>

    <body>
        <%
            HttpSession objSesion = request.getSession();
            String usuario;
            String imgPerfil;
            if (objSesion.getAttribute("nickname") != null) {%>
        <%@include file="/Pages/Common/HeaderSearchLogeado.jsp" %>
        <%} else {%>
        <%@include file="/Pages/Common/HeaderSearch.jsp" %>
        <%}
        %>


        <div class="d-flex justify-content-md-center align-items-center mt-5">
            <div class="container" style="width: 100vh;">
                <div class="row">
                    <div class="col-12 d-flex justify-content-md-center">
                        <h1 class="mb-5">REALIZAR SORTEO</h1>
                    </div>
                </div>
                
            </div>
        </div>

    </body>

</html>
<%-- 
    Document   : consultaEspectaculosDePaquete
    Created on : Oct 6, 2021, 5:59:49 PM
    Author     : pabli
--%>

<%@page import="DTOs.numeroDTO"%>
<%@page import="DTOs.UserDTO"%>
<%@page import="DTOs.FuncionesParaArtistaDTO"%>
<%@page import="DTOs.FuncionDTOConsultaEspectaculo"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
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
        <link rel="stylesheet" href="User-list.css">
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
        <%
        
        String funcion = (String) request.getAttribute("funcion");
        List<UserDTO> usuariosRegistrados = (List<UserDTO>) request.getAttribute("usuariosRegistrados");
        numeroDTO cantidadDePremiosDisponibles = (numeroDTO) request.getAttribute("cantidadDePremios");
        int cantidad = cantidadDePremiosDisponibles.getNumero();
        %>
        
        <div class="d-flex justify-content-md-center align-items-center mt-5">
            <div class="container" style="width: 100vh;">
                <div class="row">
                    <div class="col-12 d-flex justify-content-md-center">
                        <h1 class="mb-5">FUNCION:  <%=funcion%></h1>
                    </div>
                </div>
            </div>
        </div>
        <div style="text-align: center;">
            <select aria-label="Default select example" class="cat" name="cat" style="height: 42px; font-size: large; border-color: rgb(226, 227, 236); border-radius: 5%; background-color: #fafafa;">
                <option value="Default"> Cantidad de Premios disponibles </option>
                <option> <%= cantidad%> </option>
            </select>
        </div>
        <div class="articles card">
            <div class="card-header d-flex align-items-center">
                <h2 class="h3">USUARIOS REGISTRADOS</h2>
            </div>
            <!--ARTISTAS-->
            <div class="card-body no-padding">
                <!--USUARIO-->
                <%
                    //int i = 0;
                    for (UserDTO user : usuariosRegistrados) {
                %>
                <div class="item d-flex align-items-center">
                    <div class="image">
                                <%
                                    if(user.getUrl_imagen().equals("")){ //NO TIENE IMAGEN
                                %>
                                    <img src="https://imgur.com/mwpO9Ct.png" alt="fotoPerfil" class="img-fluid rounded-circle">
                                <%  }
                                    else {
                                %>
                                    <img src="<%=user.getUrl_imagen()%>" alt="fotoPerfil" class="img-fluid rounded-circle">
                                <%
                                    }
                                %>
                           </div>
                    <div class="text">
                        <form action="/CoronaTickets-Web/Usuario" method="post">
                            <br>
                            <input type="hidden" name="data" value="<%=user.getNickname() %>" />
                            <button style="border:none; background-color: transparent;">
                                <h3 class="h4"><%= user.getNickname()%></h3>
                            </button>
                        </form>
                    </div>
                </div>
                <%
                    }
                %>
            </div>
        </div>
        <div class="d-flex justify-content-md-center align-items-center mt-3">
            <button type="submit" id="mostrarModal"  class="btn btn-outline-secondary rounded-pill ">
                SORTEAR
            </button>
        </div>
    </body>
</html>
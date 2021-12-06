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
        <style>
        body {
            font-family: 'Montserrat', sans-serif;
        }
        /* Custom Scrollbar using CSS */
        .custom-scrollbar-css {
          overflow-y: scroll;
        }
        /* scrollbar width */
        .custom-scrollbar-css::-webkit-scrollbar {
          width: 5px;
        }
        /* scrollbar track */
        .custom-scrollbar-css::-webkit-scrollbar-track {
          background: #eee;
        }
        /* scrollbar handle */
        .custom-scrollbar-css::-webkit-scrollbar-thumb {
          border-radius: 1rem;
          background-color: #00d2ff;
          background-image: linear-gradient(to top, #00d2ff 0%, #3a7bd5 100%);
        }
        
        #content-3{
            height: 20vh;
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
        int cantidad = 0;
        if(cantidadDePremiosDisponibles!= null){
            cantidad = cantidadDePremiosDisponibles.getNumero();
        }
        List<String> ganadores = (List<String>) request.getAttribute("ganadores");
        %>
        <div class="container">
            <div class="d-flex justify-content-md-center align-items-center mt-5">
            <div class="container" style="width: 100vh;">
                <div class="row">
                    <div class="col-12 d-flex justify-content-md-center">
                        <h1 class="mb-5">FUNCION: <%=funcion%></h1>
                    </div>
                </div>
            </div>
        </div>
        <%
            if(ganadores != null){
        %>
            <div class="articles card me-5 ms-5">
                <div class="card-header d-flex align-items-center">
                    <h2 class="h3">GANADORES</h2>
                </div> 
                <!--ARTISTAS-->
                <div class="card-body no-padding">
                    <%
                            for (String user : ganadores) {
                    %>
                    <div class="item d-flex align-items-center">
                        <div class="image">
                                <img src="https://imgur.com/mwpO9Ct.png" alt="fotoPerfil" class="img-fluid rounded-circle">
                        </div>
                        <div class="text">
                            <form action="/CoronaTickets-Web/Usuario" method="post">
                                <br>
                                <input type="hidden" name="data" value="<%=user %>" />
                                <button style="border:none; background-color: transparent;">
                                    <h3 class="h4"><%= user%></h3>
                                </button>
                            </form>
                        </div>
                    </div>
                    <%
                            }                   
                    %>
                </div>
            </div>
        <%
            }else{
        %>
        <div class="container mb-2">
            <form name="sorteo" class="needs-validation" method="POST" action="/CoronaTickets-Web/GenerarPremios" novalidate>
                <div class="row">
                    <div class="col mt-1">
                      <h5>Cantidad de Premios disponibles: <%= cantidad%></h5>
                    </div>
                    <div class="col">
                      <input id="" name="nombreFuncion" type="hidden" value="<%=funcion%>">
                      <input type="number" class="form-control rounded-pill" min="1" max="<%=cantidad%>" id="inputCantidad" name="inputCantidad" placeholder="Cantidad a sortear" value="" required> 
                      <div class="invalid-feedback">Ingrese una cantidad dentro de los valores estipulados.</div>
                    </div>
                    <%
                        if(!usuariosRegistrados.isEmpty() && cantidad>0){
                    %> 
                        <div class="col">
                            <div class="d-flex justify-content-md-center ">
                                <button type="submit" id="mostrarModal"  class="btn btn-outline-secondary rounded-pill ">
                                    SORTEAR
                                </button>
                            </div>
                        </div>
                    <%
                        }
                    %>    
                </div>
            </form>
            
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
                    if(usuariosRegistrados.isEmpty()){
                %> 
                    <div class="col-12 d-flex justify-content-md-center">
                        <h1 class="mb-5">No hay usuarios registrados para esta función</h1>
                    </div>
                <%
                    }else{
                        for (UserDTO user : usuariosRegistrados) {
                %>
                <div class="item d-flex align-items-center">
                    <div class="image">
                                <%
                                    if(user.getUrl_imagen()==null || user.getUrl_imagen().equals("")){ //NO TIENE IMAGEN
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
                    }
                
                %>
            </div>
        </div>
        <%
        }
        %>
        </div>
        
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="http://localhost:8080/CoronaTickets-Web/Pages/malihu-custom-scrollbar-plugin-master/jquery.mCustomScrollbar.concat.min.js" type="text/javascript"></script>
    <script>
            // Example starter JavaScript for disabling form submissions if there are invalid fields
            (() => {
                'use strict';

                // Fetch all the forms we want to apply custom Bootstrap validation styles to
                const forms = document.querySelectorAll('.needs-validation');

                // Loop over them and prevent submission
                Array.prototype.slice.call(forms).forEach((form) => {
                    form.addEventListener('submit', (event) => {
                        if (!form.checkValidity()) {
                            event.preventDefault();
                            event.stopPropagation();
                        }
                        form.classList.add('was-validated');
                    }, false);
                });
            })();
        </script>
    </body>
</html>
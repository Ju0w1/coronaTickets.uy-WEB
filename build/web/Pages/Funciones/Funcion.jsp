<%-- 
    Document   : Funcion
    Created on : 09/10/2021, 02:47:36 PM
    Author     : milto
--%>

<%@page import="Logica.Clases.Artista"%>
<%@page import="java.util.Map"%>
<%@page import="Logica.Clases.Funcion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<!DOCTYPE html>
<html lang="en">


<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CONSULTA FUNCIONES</title>
    <script async="" defer="" src="https://buttons.github.io/buttons.js"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.js"
        integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous"></script>
</head>

<body>
    <%
        HttpSession objSesion = request.getSession();
        String usuario;
        String imgPerfil;
        if (objSesion.getAttribute("nickname") != null) {%>
            <%@include file="/Pages/Common/HeaderSearchLogeado.jsp" %>
        <%}
        else{%>
            <%@include file="/Pages/Common/HeaderSearch.jsp" %>
        <%}
        System.err.println("HOLAHOLAHOLAHOLAHOLAHOLAHOLA");
        Funcion funcion = (Funcion) request.getAttribute("funcion");
        
    %>
    <div id="header"></div>
    <br>
    <h3 style="text-align: center;">
        CONSULTA DE FUNCIÓN:
    </h3>
    <div class="container" >
        <div class="row">
            <!--NOMBRE FUNCION-->
            <div class="col-6" style="text-align: center;" >
                <h2><%=funcion.getNombre()%></h2>
                 <!-- Informacion Desplegada -->
                <div class="card mt-3">
                    <ul class="list-group list-group-flush">
                        <!-- FECHA -->
                      <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                        <h6 class="mb-0">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-calendar-event" viewBox="0 0 16 16">
                                <path d="M11 6.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1z"/>
                                <path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z"/>
                            </svg>
                            Fecha
                        </h6>
                        <span class="text-secondary"><%=funcion.getFecha()%></span>
                      </li>
                      <!-- HORA -->
                      <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                        <h6 class="mb-0"> 
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-clock" viewBox="0 0 16 16">
                                <path d="M8 3.5a.5.5 0 0 0-1 0V9a.5.5 0 0 0 .252.434l3.5 2a.5.5 0 0 0 .496-.868L8 8.71V3.5z"/>
                                <path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm7-8A7 7 0 1 1 1 8a7 7 0 0 1 14 0z"/>
                              </svg>
                            Hora</h6>
                          <span class="text-secondary"><%=funcion.getHoraInicio()%></span>
                      </li>
                      <!-- ESPECTACULO -->
                      <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                        <h6 class="mb-0"> Espectaculo</h6>
                        <span class="text-secondary"><%=funcion.getEspectaculo().getNombre() %> </span>
                      </li>
                      <!-- Artistas -->
                      <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                        <h6 class="mb-0"> 
                            <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="currentColor" class="bi bi-person-plus" viewBox="0 0 16 16">
                                <path d="M6 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H1s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C9.516 10.68 8.289 10 6 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"/>
                                <path fill-rule="evenodd" d="M13.5 5a.5.5 0 0 1 .5.5V7h1.5a.5.5 0 0 1 0 1H14v1.5a.5.5 0 0 1-1 0V8h-1.5a.5.5 0 0 1 0-1H13V5.5a.5.5 0 0 1 .5-.5z"/>
                              </svg>
                            Artistas Invitados</h6>
                            <%
                                String artistass = "";
                                Map<String,Artista> artistas = funcion.getArtistas();
                                int tamanio = artistas.size();
                                int indice=0;
                                for (Map.Entry<String, Artista> entry : artistas.entrySet()) {
                                    indice++;
                                    String key = entry.getKey();
                                    artistass += key;
                                    if (indice != tamanio){
                                        artistass+=", ";
                                    }
                                }
                            %>
                            <span class="text-secondary">
                            <%=artistass%>
                            </span>
                      </li>
                    </ul>
                  </div>
            </div>
            <div class="col-6 d-flex justify-content-md-center align-items-center">
                <div class="w-100 d-flex justify-content-md-center align-items-center">
                    <img style="max-height:100%; max-width:100%;object-fit: contain;" src="<%=funcion.getUrlIamgen()%>">
                </div>
            </div>
          </div>
    </div>

</body>

</html>

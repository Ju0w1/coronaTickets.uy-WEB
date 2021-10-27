<%-- 
    Document   : Artista-yourself
    Created on : 09/10/2021, 11:57:41 AM
    Author     : milto
--%>
<%@page import="Logica.Clases.Espectaculo"%>
<%@page import="Logica.Clases.Usuario"%>
<%@page import="Logica.Interfaz.IControladorUsuario"%>
<%@page import="Logica.Fabrica"%>
<%@page import="java.util.HashMap"%>
<%@page import="Logica.Clases.Artista"%>
<%@page import="java.util.Map"%>
<%@page import="Logica.DataTypes.DTFecha"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>CoronaTickets - Mi Perfil</title>
  <link rel="stylesheet" href="Perfil.css">
  <script async="" defer="" src="https://buttons.github.io/buttons.js"></script>
  <script src="https://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
    crossorigin="anonymous">
  </script>

</head>

<body style="background-color: rgb(230, 232, 240);">
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
    %>
    <%
        Artista espect = (Artista) request.getAttribute("Artista");
        String imagen = espect.getImagen();
        String nombre = espect.getNombre();
        String apellido = espect.getApellido();
        DTFecha nacimiento = espect.getNacimiento();
        String email = espect.getEmail();
        String nick = espect.getNickname();
        String web = espect.getLinkWeb();
        String descripcion = espect.getDescripcion();
        String bio = espect.getBiografia();
        int seguidores = espect.getSeguidores();
        int seguidos = espect.getSeguidos();
        
        Map<String, Espectaculo> espectaculosAceptados = (Map<String, Espectaculo>) request.getAttribute("EspectaculosA");
        Map<String, Espectaculo> espectaculosIngresados = (Map<String, Espectaculo>) request.getAttribute("EspectaculosI");
        Map<String, Espectaculo> espectaculosRechazados = (Map<String, Espectaculo>) request.getAttribute("EspectaculosR");
        
        
    %>
  <div id="header"></div>
  <div class="container">
    <div class="main-body">
      <div class="row gutters-sm">
        <div class="col-md-4 mb-3">
          <div class="card">
            <!-- Tarjeta de perfil -->
            <div class="card-body">
              <div class="d-flex flex-column align-items-center text-center">

                <%
                    if(imagen.equals("")){ //NO TIENE IMAGEN
                %>
                    <img src="https://imgur.com/mwpO9Ct.png" alt="Admin" class="rounded-circle" width="150">
                <% }
                    else {
                %>
                <img src="<%=imagen%>" alt="Admin" class="rounded-circle" width="150">
                <%
                    }
                %>
                <div class="mt-3">
                  <h4><%=nick%></h4>
                  <p class="text-secondary mb-1">Artista</p>
                  <label> <a style="color: black; text-decoration: none;" href="#">Seguidores <b><%=seguidores%></b></a></label>
                  <label> <a style="color: black; text-decoration: none;" href="#">Seguidos <b><%=seguidos%></b></a> </label>
                </div>
              </div>
            </div>
          </div>
          <div class="card mt-3">
            <!-- Informacion basica -->
            <ul class="list-group list-group-flush">
              <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                <!-- NOMBRE -->
                <h6 class="mb-0"> Nombre</h6>
                <span class="text-secondary"><%=nombre%></span>
              </li>
              <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                <!-- APELLIDO -->
                <h6 class="mb-0"> Apellido</h6>
                <span class="text-secondary"><%=apellido%></span>
              </li>
              <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                <!-- FECHA DE NACIMIENTO -->
                <h6 class="mb-0">
                  <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-calendar-event" viewBox="0 0 16 16">
                    <path d="M11 6.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1z"/>
                    <path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z"/>
                  </svg>
                  </svg> Nacimiento</h6>
                <span class="text-secondary"><%=nacimiento.getDia() + "/" +nacimiento.getMes() + "/" +nacimiento.getAnio()%></span>
              </li>
              <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                <!-- URL -->
                <h6 class="mb-0">
                  <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
                    stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                    class="feather feather-globe mr-2 icon-inline">
                    <circle cx="12" cy="12" r="10"></circle>
                    <line x1="2" y1="12" x2="22" y2="12"></line>
                    <path
                      d="M12 2a15.3 15.3 0 0 1 4 10 15.3 15.3 0 0 1-4 10 15.3 15.3 0 0 1-4-10 15.3 15.3 0 0 1 4-10z">
                    </path>
                  </svg> Sitio</h6>
                <span class="text-secondary"><%=web%></span>
              </li>
              <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                <!-- EMAIL -->
                <h6 class="mb-0">
                  <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor"
                    class="bi bi-envelope" viewBox="0 0 16 16">
                    <path
                      d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4zm2-1a1 1 0 0 0-1 1v.217l7 4.2 7-4.2V4a1 1 0 0 0-1-1H2zm13 2.383-4.758 2.855L15 11.114v-5.73zm-.034 6.878L9.271 8.82 8 9.583 6.728 8.82l-5.694 3.44A1 1 0 0 0 2 13h12a1 1 0 0 0 .966-.739zM1 11.114l4.758-2.876L1 5.383v5.73z" />
                  </svg>
                  </svg> Mail</h6>
                <span class="text-secondary"><%=email%></span>
              </li>
              <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                <form action="/CoronaTickets-Web/EditUser" method="post">
                    <input type="hidden" name="nick" value="<%=nick%>"/>
                    <button type="submit" class="btn btn-outline-primary">Editar</button>
                  </form>
              </li>
            </ul>
          </div>
        </div>
        <div class="col-md-8">
          <div class="card mb-3">
            <div class="card-body">
              <div class="row">
                <!-- DESCRIPCION -->
                <div class="col-sm-3">
                  <h6 class="mb-0">Descripción </h6>
                </div>
                <div class="col-sm-9 text-secondary">
                  <%=descripcion%>
                </div>
              </div>
            </div>
          </div>
          <div class="card mb-3">
            <div class="card-body">
              <div class="row">
                <!-- BIOGRAFIA -->
                <div class="col-sm-3">
                  <h6 class="mb-0">Biografía</h6>
                </div>
                <div class="col-sm-9 text-secondary">
                  <%=bio%>
                </div>
              </div>
            </div>
          </div>
          <div class="row gutters-sm">
            <!-- ESPECTACULOS -->
            <div class="col-sm-6 mb-3">
              <!-- ACEPTADOS -->
              <div class="card h-100">
                <div class="card-body">
                  <h6 class="d-flex align-items-center mb-3"><i class="material-icons text-info mr-2"> Espectaculos </i>
                    Aceptados</h6>
                <%
                    for (Map.Entry<String, Espectaculo> entry : espectaculosAceptados.entrySet()) {
                        String key = entry.getKey();
                        Espectaculo value = entry.getValue();  
                %>
                  <div class="espect">
                    <!-- ESPECTACULO EJEMPLO -->
                    <ul class="list-group list-group-flush">
                      <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                        <!-- NOMBRE -->
                        <h6 class="mb-0"> Nombre</h6>
                        <span class="text-secondary"><%=value.getNombre()%></span>
                      </li>
                      <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                        <!-- PLATAFORMA -->
                        <h6 class="mb-0">
                          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                            class="bi bi-collection-play" viewBox="0 0 16 16">
                            <path
                              d="M2 3a.5.5 0 0 0 .5.5h11a.5.5 0 0 0 0-1h-11A.5.5 0 0 0 2 3zm2-2a.5.5 0 0 0 .5.5h7a.5.5 0 0 0 0-1h-7A.5.5 0 0 0 4 1zm2.765 5.576A.5.5 0 0 0 6 7v5a.5.5 0 0 0 .765.424l4-2.5a.5.5 0 0 0 0-.848l-4-2.5z" />
                            <path
                              d="M1.5 14.5A1.5 1.5 0 0 1 0 13V6a1.5 1.5 0 0 1 1.5-1.5h13A1.5 1.5 0 0 1 16 6v7a1.5 1.5 0 0 1-1.5 1.5h-13zm13-1a.5.5 0 0 0 .5-.5V6a.5.5 0 0 0-.5-.5h-13A.5.5 0 0 0 1 6v7a.5.5 0 0 0 .5.5h13z" />
                          </svg>
                          Plataforma</h6>
                        <span class="text-secondary"><%=value.getPlataforma() %></span>
                      </li>
                      <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                        <!-- COSTO -->
                        <h6 class="mb-0">
                          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                            class="bi bi-cash-coin" viewBox="0 0 16 16">
                            <path fill-rule="evenodd"
                              d="M11 15a4 4 0 1 0 0-8 4 4 0 0 0 0 8zm5-4a5 5 0 1 1-10 0 5 5 0 0 1 10 0z" />
                            <path
                              d="M9.438 11.944c.047.596.518 1.06 1.363 1.116v.44h.375v-.443c.875-.061 1.386-.529 1.386-1.207 0-.618-.39-.936-1.09-1.1l-.296-.07v-1.2c.376.043.614.248.671.532h.658c-.047-.575-.54-1.024-1.329-1.073V8.5h-.375v.45c-.747.073-1.255.522-1.255 1.158 0 .562.378.92 1.007 1.066l.248.061v1.272c-.384-.058-.639-.27-.696-.563h-.668zm1.36-1.354c-.369-.085-.569-.26-.569-.522 0-.294.216-.514.572-.578v1.1h-.003zm.432.746c.449.104.655.272.655.569 0 .339-.257.571-.709.614v-1.195l.054.012z" />
                            <path
                              d="M1 0a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h4.083c.058-.344.145-.678.258-1H3a2 2 0 0 0-2-2V3a2 2 0 0 0 2-2h10a2 2 0 0 0 2 2v3.528c.38.34.717.728 1 1.154V1a1 1 0 0 0-1-1H1z" />
                            <path d="M9.998 5.083 10 5a2 2 0 1 0-3.132 1.65 5.982 5.982 0 0 1 3.13-1.567z" />
                          </svg>
                          Costo</h6>
                        <span class="text-secondary"><%=value.getCosto()%></span>
                      </li>
                      <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                        <button class="btn btn-outline-primary">Detalles</button>
                      </li>
                    </ul>
                  </div>
                  <br>
                  
                    <%
                        } 
                    %>
                </div>
              </div>
            </div>

            <div class="col-sm-6 mb-3">
              <!-- INGRESADOS -->
              <div class="card h-100">
                <div class="card-body">
                  <h6 class="d-flex align-items-center mb-3"><i class="material-icons text-info mr-2">Espectaculos </i>
                    Ingresados</h6>
                        <%
                            for (Map.Entry<String, Espectaculo> entry : espectaculosIngresados.entrySet()) {
                                String key = entry.getKey();
                                Espectaculo value = entry.getValue();  
                        %>
                  <div class="espect">
                    <!-- ESPECTACULO EJEMPLO -->
                    <ul class="list-group list-group-flush">
                      <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                        <!-- NOMBRE -->
                        <h6 class="mb-0"> Nombre</h6>
                        <span class="text-secondary"><%=value.getNombre()%></span>
                      </li>
                      <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                        <!-- PLATAFORMA -->
                        <h6 class="mb-0">
                          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                            class="bi bi-collection-play" viewBox="0 0 16 16">
                            <path
                              d="M2 3a.5.5 0 0 0 .5.5h11a.5.5 0 0 0 0-1h-11A.5.5 0 0 0 2 3zm2-2a.5.5 0 0 0 .5.5h7a.5.5 0 0 0 0-1h-7A.5.5 0 0 0 4 1zm2.765 5.576A.5.5 0 0 0 6 7v5a.5.5 0 0 0 .765.424l4-2.5a.5.5 0 0 0 0-.848l-4-2.5z" />
                            <path
                              d="M1.5 14.5A1.5 1.5 0 0 1 0 13V6a1.5 1.5 0 0 1 1.5-1.5h13A1.5 1.5 0 0 1 16 6v7a1.5 1.5 0 0 1-1.5 1.5h-13zm13-1a.5.5 0 0 0 .5-.5V6a.5.5 0 0 0-.5-.5h-13A.5.5 0 0 0 1 6v7a.5.5 0 0 0 .5.5h13z" />
                          </svg>
                          Plataforma</h6>
                        <span class="text-secondary"><%=value.getPlataforma()%></span>
                      </li>
                      <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                        <!-- COSTO -->
                        <h6 class="mb-0">
                          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                            class="bi bi-cash-coin" viewBox="0 0 16 16">
                            <path fill-rule="evenodd"
                              d="M11 15a4 4 0 1 0 0-8 4 4 0 0 0 0 8zm5-4a5 5 0 1 1-10 0 5 5 0 0 1 10 0z" />
                            <path
                              d="M9.438 11.944c.047.596.518 1.06 1.363 1.116v.44h.375v-.443c.875-.061 1.386-.529 1.386-1.207 0-.618-.39-.936-1.09-1.1l-.296-.07v-1.2c.376.043.614.248.671.532h.658c-.047-.575-.54-1.024-1.329-1.073V8.5h-.375v.45c-.747.073-1.255.522-1.255 1.158 0 .562.378.92 1.007 1.066l.248.061v1.272c-.384-.058-.639-.27-.696-.563h-.668zm1.36-1.354c-.369-.085-.569-.26-.569-.522 0-.294.216-.514.572-.578v1.1h-.003zm.432.746c.449.104.655.272.655.569 0 .339-.257.571-.709.614v-1.195l.054.012z" />
                            <path
                              d="M1 0a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h4.083c.058-.344.145-.678.258-1H3a2 2 0 0 0-2-2V3a2 2 0 0 0 2-2h10a2 2 0 0 0 2 2v3.528c.38.34.717.728 1 1.154V1a1 1 0 0 0-1-1H1z" />
                            <path d="M9.998 5.083 10 5a2 2 0 1 0-3.132 1.65 5.982 5.982 0 0 1 3.13-1.567z" />
                          </svg>
                          Costo</h6>
                        <span class="text-secondary"><%=value.getCosto()%></span>
                      </li>
                      <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                        <button class="btn btn-outline-primary">Detalles</button>
                      </li>
                    </ul>
                  </div>
                  <br>
                    <%
                        }
                    %>
                </div>
              </div>
            </div>
            <div class="col-sm-6 mb-3">
              <!-- RECHAZADOS -->
              <div class="card h-100">
                <div class="card-body">
                  <h6 class="d-flex align-items-center mb-3"><i
                      class="material-icons text-info mr-2">Espectaculos</i>Rechazados</h6>
                    <%
                        for (Map.Entry<String, Espectaculo> entry : espectaculosRechazados.entrySet()) {
                            String key = entry.getKey();
                            Espectaculo value = entry.getValue();  
                    %>
                  <div class="espect">
                    <!-- ESPECTACULO EJEMPLO -->
                    <ul class="list-group list-group-flush">
                      <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                        <!-- NOMBRE -->
                        <h6 class="mb-0"> Nombre</h6>
                        <span class="text-secondary"><%=value.getNombre()%></span>
                      </li>
                      <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                        <!-- PLATAFORMA -->
                        <h6 class="mb-0">
                          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                            class="bi bi-collection-play" viewBox="0 0 16 16">
                            <path
                              d="M2 3a.5.5 0 0 0 .5.5h11a.5.5 0 0 0 0-1h-11A.5.5 0 0 0 2 3zm2-2a.5.5 0 0 0 .5.5h7a.5.5 0 0 0 0-1h-7A.5.5 0 0 0 4 1zm2.765 5.576A.5.5 0 0 0 6 7v5a.5.5 0 0 0 .765.424l4-2.5a.5.5 0 0 0 0-.848l-4-2.5z" />
                            <path
                              d="M1.5 14.5A1.5 1.5 0 0 1 0 13V6a1.5 1.5 0 0 1 1.5-1.5h13A1.5 1.5 0 0 1 16 6v7a1.5 1.5 0 0 1-1.5 1.5h-13zm13-1a.5.5 0 0 0 .5-.5V6a.5.5 0 0 0-.5-.5h-13A.5.5 0 0 0 1 6v7a.5.5 0 0 0 .5.5h13z" />
                          </svg>
                          Plataforma</h6>
                        <span class="text-secondary"><%=value.getPlataforma() %></span>
                      </li>
                      <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                        <!-- COSTO -->
                        <h6 class="mb-0">
                          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                            class="bi bi-cash-coin" viewBox="0 0 16 16">
                            <path fill-rule="evenodd"
                              d="M11 15a4 4 0 1 0 0-8 4 4 0 0 0 0 8zm5-4a5 5 0 1 1-10 0 5 5 0 0 1 10 0z" />
                            <path
                              d="M9.438 11.944c.047.596.518 1.06 1.363 1.116v.44h.375v-.443c.875-.061 1.386-.529 1.386-1.207 0-.618-.39-.936-1.09-1.1l-.296-.07v-1.2c.376.043.614.248.671.532h.658c-.047-.575-.54-1.024-1.329-1.073V8.5h-.375v.45c-.747.073-1.255.522-1.255 1.158 0 .562.378.92 1.007 1.066l.248.061v1.272c-.384-.058-.639-.27-.696-.563h-.668zm1.36-1.354c-.369-.085-.569-.26-.569-.522 0-.294.216-.514.572-.578v1.1h-.003zm.432.746c.449.104.655.272.655.569 0 .339-.257.571-.709.614v-1.195l.054.012z" />
                            <path
                              d="M1 0a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h4.083c.058-.344.145-.678.258-1H3a2 2 0 0 0-2-2V3a2 2 0 0 0 2-2h10a2 2 0 0 0 2 2v3.528c.38.34.717.728 1 1.154V1a1 1 0 0 0-1-1H1z" />
                            <path d="M9.998 5.083 10 5a2 2 0 1 0-3.132 1.65 5.982 5.982 0 0 1 3.13-1.567z" />
                          </svg>
                          Costo</h6>
                        <span class="text-secondary"><%=value.getCosto()%></span>
                      </li>
                      <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                        <button class="btn btn-outline-primary">Detalles</button>
                      </li>
                    </ul>
                  </div>
                  <br>
                    <% 
                        }
                    %>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</body>

</html>

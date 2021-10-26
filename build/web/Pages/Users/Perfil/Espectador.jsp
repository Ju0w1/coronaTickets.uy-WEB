<%-- 
    Document   : Espectador
    Created on : 09/10/2021, 12:05:06 PM
    Author     : milto
--%>
<%@page import="Logica.Clases.Espectaculo"%>
<%@page import="Logica.Clases.Funcion"%>
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
  <title>ESPECTADOR</title>
  <link rel="stylesheet" href="Perfil.css">
  <script async="" defer="" src="https://buttons.github.io/buttons.js"></script>
  <script src="https://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
    crossorigin="anonymous">
  </script>
    <%
        HttpSession objSesion = request.getSession();
        String usuario;
        String imgPerfil;
        if (objSesion.getAttribute("nickname") != null) {%>
            <%@include file="/Pages/Common/Header2.jsp" %>
        <%}
        else{%>
            <%@include file="/Pages/Common/HeaderSearch.jsp" %>
        <%}
    %>
    <%
        Usuario espect = (Usuario) request.getAttribute("Espectador");
        String imagen = espect.getImagen();
        String nombre = espect.getNombre();
        String apellido = espect.getApellido();
        DTFecha nacimiento = espect.getNacimiento();
        String email = espect.getEmail();
        String nick = espect.getNickname();
        int seguidores = espect.getSeguidores();
        int seguidos = espect.getSeguidos();
        boolean losigo = true;
        //if (request.getAttribute("losigo")!= null){
        //    losigo = (boolean) request.getAttribute("losigo");
        //}
        
        if(Fabrica.getInstance().getIControladorUsuario().loSigo(objSesion.getAttribute("nickname").toString(), nick)){
            losigo = true;
            System.out.println("SI LO SIGO");
        } else {
            System.out.println("NO LO SIGO");
            losigo = false;
        }
        
        Map<String, Funcion> funciones = (Map<String, Funcion>) request.getAttribute("Funciones");
        boolean login = false;
        if (request.getAttribute("login")!=null){
            login = true;
        }
    %>

</head>
<body style="background-color: rgb(230, 232, 240);">
    
    
  <div id="header"></div>
  <div class="container">
    <div class="main-body">
      <div class="row gutters-sm">
        <div class="col-md-4 mb-3">
          <div class="card">
            <!-- Tarjeta de perfil -->
            <div class="card-body">
              <div class="d-flex flex-column align-items-center text-center">
                <!-- IMAGEN -->
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
                  <p class="text-secondary mb-1">Espectador</p>
                  <label> <a style="color: black; text-decoration: none;" href="#">Seguidores <b><%=seguidores%></b></a></label>
                  <label> <a style="color: black; text-decoration: none;" href="#">Seguidos <b><%=seguidos%></b></a> </label>
                  <%
                        if(login==false){
                            if(losigo == true){
                            %>    
                            <form action="/CoronaTickets-Web/User" method="post">
                                <button type="submit" class="btn btn-primary" >Dejar de seguir</button>
                                <input type="hidden" name="data" value="<%=nick%>" />
                                <input type="hidden" name="user" value="<%=nick%>" />
                                <input type="hidden" name="yo" value="<%=objSesion.getAttribute("nickname")%>" />
                            </form>
                            <%  
                            } else {
                            %>
                            <form action="/CoronaTickets-Web/User" method="post">
                                <button type="submit" class="btn btn-primary" >Seguir</button>
                                <input type="hidden" name="data" value="<%=nick%>" />
                                <input type="hidden" name="user2" value="<%=nick%>" />
                                <input type="hidden" name="yo2" value="<%=objSesion.getAttribute("nickname")%>" />
                            </form>
                            <%
                            
                            }
                        }
                    %> 
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
            </ul>
          </div>
        </div>
        <div class="col-md-8">
          <div class="card mb-3">
            <div class="card-body">
              <!-- FUNCIONES REGISTRADO -->
              <h6 class="d-flex align-items-center mb-3"><i class="material-icons text-info mr-2"> Funciones </i>  Registrado
              </h6>
              
            <%
                for (Map.Entry<String, Funcion> entry : funciones.entrySet()) {
                    String key = entry.getKey();
                    Funcion value = entry.getValue();  
            %>
              
              
              <div class="func">
                <!-- FUNCION EJEMPLO -->
                <ul class="list-group list-group-flush">
                  <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                    <!-- NOMBRE -->
                    <h6 class="mb-0"> Nombre</h6>
                    <span class="text-secondary"><%=value.getNombre() %></span>
                  </li>
                  <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                    <!-- NOMBRE -->
                    <h6 class="mb-0"> Espectaculo</h6>
                    <span class="text-secondary"><%=value.getEspectaculo().getNombre() %></span>
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
                    <span class="text-secondary"><%=value.getEspectaculo().getPlataforma() %></span>
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
</body>

</html>

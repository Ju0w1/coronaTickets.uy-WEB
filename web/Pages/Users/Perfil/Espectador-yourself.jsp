<%-- 
    Document   : Espectador-yourself
    Created on : 09/10/2021, 12:02:29 PM
    Author     : milto
--%>
<%@page import="DTOs.PaquetesDeUserDTO"%>
<%@page import="DTOs.ListPaquetesDeUserDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.google.common.collect.HashBiMap"%>
<%@page import="DTOs.FuncionesDeUserDTO"%>
<%@page import="DTOs.ListFuncionesDeUserDTO"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="DTOs.UserDTO"%>
<%@page import="Logica.Clases.Paquete"%>
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
    <link rel="icon" href="https://i.imgur.com/KXDtCAj.png">
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
        UserDTO espect = (UserDTO) request.getAttribute("Espectador");
        String imagen = espect.getUrl_imagen();
        String nombre = espect.getNombre();
        String apellido = espect.getApellido();

        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");  
        Date date = espect.getNacimiento();
        String strDate = dateFormat.format(date);  
        String[] datos = strDate.split("-");
        int dia = Integer.parseInt(datos[2]);
        int mes = Integer.parseInt(datos[1]);
        int anio = Integer.parseInt(datos[0]);
        DTFecha nacimiento = new DTFecha(dia, mes, anio);

        String email = espect.getEmail();
        String nick = espect.getNickname();
        int seguidores = espect.getSeguidores();
        int seguidos = espect.getSeguidos();
        
        ListFuncionesDeUserDTO funcionesMap = (ListFuncionesDeUserDTO) request.getAttribute("Funciones");
        Map<String, FuncionesDeUserDTO> funciones = new HashMap<>(); 
        List<FuncionesDeUserDTO> funcionesX = funcionesMap.getFunciones();
        for (FuncionesDeUserDTO funcion :  funcionesX) {
            funciones.put(funcion.getNombre(),new FuncionesDeUserDTO(funcion.getNombre(),funcion.getEspectaculo(), funcion.getPlataforma()));
        }
        
        ListPaquetesDeUserDTO paquetesMap = (ListPaquetesDeUserDTO) request.getAttribute("paquetes");
        Map<String, PaquetesDeUserDTO> paquetesRegistrado = new HashMap<>(); 
        List<PaquetesDeUserDTO> paquetesX = paquetesMap.getPaquetes();
        for (PaquetesDeUserDTO paquete :  paquetesX) {
            paquetesRegistrado.put(paquete.getNombre(),new PaquetesDeUserDTO(paquete.getNombre(), paquete.getDescuento()));
        }
        
        //Map<String, Paquete> paquetesRegistrado = (Map<String, Paquete>) request.getAttribute("paquetes");
        System.out.println("La imagen es: \""+imagen+"\"");
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
                  <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor"
                    class="bi bi-calendar-event" viewBox="0 0 16 16">
                    <path d="M11 6.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1z" />
                    <path
                      d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z" />
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
              <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                <!-- PREMIOS -->
                <form action="/CoronaTickets-Web/Trophy" method="post">
                    <button style="border:none; background-color: transparent; text-align: left; text-align:left; padding-left:0px">
                        <h6 class="mb-0">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-trophy" viewBox="0 0 16 16">
                            <path d="M2.5.5A.5.5 0 0 1 3 0h10a.5.5 0 0 1 .5.5c0 .538-.012 1.05-.034 1.536a3 3 0 1 1-1.133 5.89c-.79 1.865-1.878 2.777-2.833 3.011v2.173l1.425.356c.194.048.377.135.537.255L13.3 15.1a.5.5 0 0 1-.3.9H3a.5.5 0 0 1-.3-.9l1.838-1.379c.16-.12.343-.207.537-.255L6.5 13.11v-2.173c-.955-.234-2.043-1.146-2.833-3.012a3 3 0 1 1-1.132-5.89A33.076 33.076 0 0 1 2.5.5zm.099 2.54a2 2 0 0 0 .72 3.935c-.333-1.05-.588-2.346-.72-3.935zm10.083 3.935a2 2 0 0 0 .72-3.935c-.133 1.59-.388 2.885-.72 3.935zM3.504 1c.007.517.026 1.006.056 1.469.13 2.028.457 3.546.87 4.667C5.294 9.48 6.484 10 7 10a.5.5 0 0 1 .5.5v2.61a1 1 0 0 1-.757.97l-1.426.356a.5.5 0 0 0-.179.085L4.5 15h7l-.638-.479a.501.501 0 0 0-.18-.085l-1.425-.356a1 1 0 0 1-.757-.97V10.5A.5.5 0 0 1 9 10c.516 0 1.706-.52 2.57-2.864.413-1.12.74-2.64.87-4.667.03-.463.049-.952.056-1.469H3.504z"/>
                            </svg> Premios
                        </h6>
                    </button>
                    <input type="hidden" name="data" value="<%=nick%>" />
                </form>
                <span class="text-secondary">23</span>
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
          <div class="row gutters-sm">
            <div class="col-sm-6 mb-3">
              <div class="card h-100">
                <!--################################################################################################################################################################-->
                <div class="card-body">
                    <!-- FUNCIONES REGISTRADO -->
                    <h6 class="d-flex align-items-center mb-3"><i class="material-icons text-info mr-2"> Funciones </i>
                        Registrado
                    </h6>
                    <%
                        for (Map.Entry<String, FuncionesDeUserDTO> entry : funciones.entrySet()) {
                            String key = entry.getKey();
                            FuncionesDeUserDTO value = entry.getValue();
                    %>
                    <div class="func">
                        <!-- FUNCION EJEMPLO -->
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                                <!-- NOMBRE -->
                                <h6 class="mb-0"> Nombre</h6>
                                <span class="text-secondary"><%=value.getNombre()%></span>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                                <!-- NOMBRE -->
                                <h6 class="mb-0"> Espectaculo</h6>
                                <span class="text-secondary"><%=value.getEspectaculo()%></span>
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
              <div class="card h-100">
                <!--################################################################################################################################################################-->
                <div class="card-body">
                    <!-- PAQUETES COMPRADOS -->
                    <h6 class="d-flex align-items-center mb-3"><i class="material-icons text-info mr-2"> Pquetes </i>
                        Comprados
                    </h6>
                    <%
                        for (Map.Entry<String, PaquetesDeUserDTO> entry : paquetesRegistrado.entrySet()) {
                            String key = entry.getKey();
                            PaquetesDeUserDTO value = entry.getValue();
                    %>
                    <div class="func">
                        <!-- PAQUETE EJEMPLO -->
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                                <!-- NOMBRE -->
                                <h6 class="mb-0"> Nombre</h6>
                                <span class="text-secondary"><%=value.getNombre()%></span>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                                <!-- DESCUENTO -->
                                <h6 class="mb-0">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="23" height="23" fill="currentColor" class="bi bi-percent" viewBox="0 0 16 16">
                                    <path d="M13.442 2.558a.625.625 0 0 1 0 .884l-10 10a.625.625 0 1 1-.884-.884l10-10a.625.625 0 0 1 .884 0zM4.5 6a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3zm0 1a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5zm7 6a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3zm0 1a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5z"/>
                                    </svg>
                                    Descuento</h6>
                                <span class="text-secondary"><%=value.getDescuento()%></span>
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
  </div>
  </div>
</body>

</html>

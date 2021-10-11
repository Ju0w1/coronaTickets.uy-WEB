<%-- 
    Document   : Users-list
    Created on : 09/10/2021, 10:50:18 AM
    Author     : milto
--%>
<%@page import="Logica.Interfaz.IControladorUsuario"%>
<%@page import="Logica.Fabrica"%>
<%@page import="java.util.HashMap"%>
<%@page import="Logica.Clases.Usuario"%>
<%@page import="java.util.Map"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>LIST USER</title>
   <link rel="stylesheet" href="User-list.css">
   <script async="" defer="" src="https://buttons.github.io/buttons.js"></script>
   <script src="https://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
      crossorigin="anonymous"> </script>
   <script>
      $(function () {
         $("#header").load("Pages/Common/Header2.jsp");
      });
   </script>
</head>

<body>
   <div id="header"></div>
   <br>
   <div class="container">
      <div class="row">
         <div class="col-lg-6">
            <br> <br>
            <div class="articles card">
               <div class="card-header d-flex align-items-center">
                  <h2 class="h3">Artistas</h2>
               </div>
               <!--ARTISTAS-->
               <div class="card-body no-padding">
                  <!--USUARIO-->
                  <%
                    Map<String, Usuario> usuarios = (Map<String, Usuario>) request.getAttribute("usuarios");
                    String mensaje = (String) request.getAttribute("mensaje");
                    System.out.println(mensaje);
                    if(usuarios == null){
                            System.out.println("NO HAY");
                            System.out.println("MENSAJE: " + mensaje);
                    }
                        //###########################################
                    int tamanio = usuarios.size();
                    int indice = 0;
                    int mitad = tamanio/2;
                        //###########################################
                    for (Map.Entry<String, Usuario> entry : usuarios.entrySet()) {
                        String key = entry.getKey();
                        Usuario value = entry.getValue();
                    %>
                    
                    <div class="item d-flex align-items-center">
                       <div class="image"><img src=<%= value.getImagen()%> alt="fotoPerfil"
                            class="img-fluid rounded-circle"></div>
                       <div class="text"><a href="#">
                                <form action="/CoronaTickets-Web/users" method="post">
                                    <input type="hidden" name="nick" value="<%= key%>" />
                                    <h3 class="h5" value="<%= key%>"><%= key%></h3>
                                    <input type="submit" name="submit" value="Ver"/>
                                </form>
                           </a><small><%= value.getEmail()%></small>
                       </div>
                    </div>
                    <%
                        //###########################################
                        indice++;
                        if(mitad == indice){
                            break;
                        }
                        // ##########################################
                    }
                    %> 
               </div>
            </div>
         </div>
         <div class="col-lg-6">
            <br> <br>
            <div class="articles card">
               <div class="card-header d-flex align-items-center">
                  <h2 class="h3">Espectadores</h2>
               </div>
               <!--ESPECTADORES-->
               <div class="card-body no-padding">
                  <!--USUARIO-->
                  <%
                        //###########################################
                      for (Map.Entry<String, Usuario> entry : usuarios.entrySet()) {
                        String key = entry.getKey();
                        Usuario value = entry.getValue();
                        indice--;
                        if(indice >= 0){

                        } else {
                        //###########################################
                    %>
                  
                  <div class="item d-flex align-items-center">
                       <div class="image"><img src=<%= value.getImagen()%> alt="fotoPerfil"
                            class="img-fluid rounded-circle"></div>
                       <div class="text"><a href="#">
                                <form action="/CoronaTickets-Web/users" method="post">
                                    <input type="hidden" name="nick" value="<%= key%>" />
                                    <h3 class="h5" value="<%= key%>"><%= key%></h3>
                                    <input type="submit" name="submit" value="Ver"/>
                                </form>
                           </a><small><%= value.getEmail()%></small>
                       </div>
                    </div>
                   <%
                        //###########################################
                        }
                    }
                        // ##########################################
                    %> 
                  
               </div>
            </div>
         </div>
      </div>
   </div>
</body>

</html>

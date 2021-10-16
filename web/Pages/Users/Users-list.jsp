<%-- 
    Document   : Users-list
    Created on : 09/10/2021, 10:50:18 AM
    Author     : milto
--%>
<%@page import="Logica.Clases.Usuario"%>

<%@page import="Logica.Interfaz.IControladorUsuario"%>
<%@page import="Logica.Fabrica"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
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
   
   
</head>

<body>
    <%
        HttpSession objSesion = request.getSession();
        String usuario;
        String imgPerfil;
        if (objSesion.getAttribute("nickname") != null) {%>
            <%@include file="/Pages/Common/Header2.jsp" %>
        <%}
        else{%>
            <%@include file="/Pages/Common/Header.jsp" %>
        <%}
    %>
   <div id="header"></div>
   <br>
    <%
        Map<String, Usuario> usuarios = (Map<String, Usuario>) request.getAttribute("usuarios");
        String mensaje = (String) request.getAttribute("mensaje");
        System.out.println(mensaje);
        if(mensaje.equals("Vacio")){
            %>
                <div class="container"> NO HAY USUARIOS</div>
            <%
        } else {
            String nick="";
    %>
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
                                <form action="/CoronaTickets-Web/Usuario" method="post">
                                    <h3 class="h5" value="<%= key%>"><%= key%></h3>
                                    <%
                                        nick=key;
                                        /*nombre=value.getNombre();
                                        apellido=value.getApellido();
                                        email=value.getEmail();
                                        imagen=value.getImagen();
                                        nacimiento=value.getNacimiento().getDia() + "/" + value.getNacimiento().getMes() + "/" + value.getNacimiento().getAnio();*/
                                        //Artista art = (Artista) value;
                                        
                                        //web=art.getLinkWeb();
                                        //desc=art.getDescripcion();
                                        //bio=art.getBiografia();
                                        //concat=nick+","+nombre+","+apellido+","+email+","+imagen+","+nacimiento+","+web+","+desc+","+bio;
                                        //concat=nick+","+nombre+","+apellido+","+email+","+imagen+","+nacimiento;
                                    %>
                                    <input type="hidden" name="data" value="<%=nick%>" />
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
                                <form action="/CoronaTickets-Web/Usuario" method="post">
                                    <h3 class="h5" value="<%= key%>"><%= key%></h3>
                                    <%
                                        nick=key;
                                    %>
                                    <input type="hidden" name="data" value="<%=nick%>" />
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
    <%              
        }
    %>
</body>

</html>

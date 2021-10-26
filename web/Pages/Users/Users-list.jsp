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
            <%@include file="/Pages/Common/HeaderSearchLogeado.jsp" %>
        <%}
        else{%>
            <%@include file="/Pages/Common/HeaderSearch.jsp" %>
        <%}
    %>
   <div id="header"></div>
   <br>
    <%
        Map<String, Usuario> usuarios = (Map<String, Usuario>) request.getAttribute("usuarios");
        boolean tipoUser[] = (boolean[]) request.getAttribute("tipoUser");
        
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
                        int i = 0;
                        for (Map.Entry<String, Usuario> entry : usuarios.entrySet()) {
                            if(tipoUser[i]){
                                String key = entry.getKey();
                                Usuario value = entry.getValue();
                        %>
                        <div class="item d-flex align-items-center">
                           <div class="image">
                                <%
                                    if(value.getImagen().equals("")){ //NO TIENE IMAGEN
                                %>
                                    <img src="https://imgur.com/mwpO9Ct.png" alt="fotoPerfil" class="img-fluid rounded-circle">
                                <%  }
                                    else {
                                %>
                                    <img src="<%=value.getImagen()%>" alt="fotoPerfil" class="img-fluid rounded-circle">
                                <%
                                    }
                                %>
                           </div>
                           <div class="text">
                                    <form action="/CoronaTickets-Web/Usuario" method="post">
                                        <br>
                                        <button style="border:none; background-color: transparent;">
                                            <h3 class="h4"><%= key%></h3>
                                        </button>
                                        <%
                                            nick=key;
                                        %>
                                        <input type="hidden" name="data" value="<%=nick%>" />
                                    </form>
                               <pre><small> <%=value.getEmail()%></small>
                           </div>
                        </div>
                        <%
                            }
                            i++;
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
                    i=0;
                    for (Map.Entry<String, Usuario> entry : usuarios.entrySet()) {
                        String key = entry.getKey();
                        Usuario value = entry.getValue();
                        if(tipoUser[i]){
                            
                        } else {
                        //###########################################
                    %>
                  
                  <div class="item d-flex align-items-center">
                       <div class="image">
                           <%
                                if(value.getImagen().equals("")){ //NO TIENE IMAGEN
                            %>
                                <img src="https://imgur.com/mwpO9Ct.png" alt="fotoPerfil" class="img-fluid rounded-circle">
                            <%  }
                                else {
                            %>
                                <img src="<%=value.getImagen()%>" alt="fotoPerfil" class="img-fluid rounded-circle">
                            <%
                                }
                            %>
                       </div>
                       <div class="text">
                           <br>     
                           <form action="/CoronaTickets-Web/Usuario" method="post">
                                <button style="border:none; background-color: transparent;">
                                    <h3 class="h4"><%= key%></h3>
                                </button>
                                <%
                                    nick=key;
                                %>
                                <input type="hidden" name="data" value="<%=nick%>" />
                            </form>
                           <pre><small> <%= value.getEmail()%></small>
                       </div>
                    </div>
                   <%
                        //###########################################
                        }
                        i++;
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

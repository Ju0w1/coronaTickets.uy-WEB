<%-- 
    Document   : Funciones-list
    Created on : 09/10/2021, 12:13:41 PM
    Author     : milto
--%>
<%@page import="Logica.Clases.Categoria"%>
<%@page import="Logica.Clases.Plataforma"%>
<%@page import="Logica.Clases.Funcion"%>
<%@page import="Logica.Clases.Espectaculo"%>
<%@page import="Logica.Fabrica"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="Logica.DataTypes.DTFecha"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <%
        //Map<String, Espectaculo> espectaculosAux;
        Map<String, Espectaculo> EspectAux = new HashMap<>();
        Map<String, Categoria> categoriasAux;
        
        
        Map<String, Plataforma> plataformas = (Map<String, Plataforma>) request.getAttribute("plataformas");
        Map<String, Categoria> categorias = (Map<String, Categoria>) request.getAttribute("categorias");
        //Map<String, Espectaculo> espectaculos = (Map<String, Espectaculo>) request.getAttribute("espectaculos");
        
        Map<String, Espectaculo> espectaculosFiltrados = new HashMap<>();
        espectaculosFiltrados = (Map<String, Espectaculo>) request.getAttribute("espectaculosFiltrados");
    %>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LIST FUNCIONES</title>
    <link rel="stylesheet" href="Funciones-list.css">
    <script async="" defer="" src="https://buttons.github.io/buttons.js"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.js"
        integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous"> </script>
    <script>
        $(function () {
            $("#header").load("Pages/Common/Header2.jsp");
        });
    </script>
    <script>
        function activa_boton(campo,boton){
            $("#boton").click();
        }
    </script> 

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
    
    
    <div class="resultado"></div>
    <br>
    <h3 style="text-align: center;">
        CONSULTA DE FUNCIÓN:
    </h3>
        <div class="container">
            <div class="row">
                <div class="col-2">
                    <h3>
                        Filtrar por:
                    </h3>
                </div>
                <div class="col-2">
                    <div class="dropdown">
                        
                        <form action="/CoronaTickets-Web/funciones" method="post">
                            <select aria-label="Default select example" class="cat" name="cat" onChange="activa_boton(this,this.form.boton)" required
                                style="height: 42px; font-size: large; border-color: rgb(226, 227, 236); border-radius: 5%; background-color: #fafafa;">
                                <<option value="Default">Categorias</option>
                                <%
                                for (Map.Entry<String, Categoria> entry : categorias.entrySet()) {
                                    String key = entry.getKey();
                                    Categoria value = entry.getValue();  
                                %>
                                <option value="<%=value.getNombre()%>"><%=value.getNombre()%></option>
                                <%
                                    }
                                %>
                            </select>
                            <input hidden="true" type="submit" name="boton" id="boton">
                        </form>
                        
                    </div>
                </div>
                <div class="col-2">
                    <div class="dropdown">
                        <select aria-label="Default select example" class="pla"
                            style="height: 42px; font-size: large; border-color: rgb(226, 227, 236); border-radius: 5%; background-color: #fafafa;">
                            <option selected>Plataformas</option>
                            <%
                            for (Map.Entry<String, Plataforma> entry : plataformas.entrySet()) {
                                String key = entry.getKey();
                                Plataforma value = entry.getValue();  
                            %>
                            <option value="1"><%=value.getNombre()%></option>
                            <%
                                }
                            %>
                            <!--
                            <option value="2">YouTube</option>
                            <option value="3">Facebook</option>-->
                        </select>
                    </div>
                </div>
            </div>
            <div class="col-4">
            </div>
        </div>
    <div class="container">
        <div class="row">
            <div class="col-lg-6">
                <br> <br>
                <div class="articles card">
                    <div class="card-header d-flex align-items-center">
                        <h2 class="h3">Espectaculos</h2>
                    </div>
                    <!--ESPECTACULOS-->
                    <div class="card-body no-padding">
                        <!--ESPECTACULO-EJEMPLO-->
                        <%
                            if(espectaculosFiltrados!=null){
                                for (Map.Entry<String, Espectaculo> entry : espectaculosFiltrados.entrySet()) {
                                    String key = entry.getKey();
                                    Espectaculo value = entry.getValue();
                        %>
                        <div class="item d-flex align-items-center">
                            <!--IMAGEN-->
                            <div class="image"><img src="<%=value.getUrlIamgen()%>"
                                alt="fotoPerfil" class="img-thumbnail" style="height: 100px ;width: 100px;"></div>
                                <div class="text"><a href="#">
                                    <!--NOMBRE-->
                                    <h3 class="h5"><%=value.getNombre()%></h3>
                                </a>
                                <!--PLATAFORMA-->
                                <small><%=value.getPlataforma() %></small><br>
                                <!--PRECIO-->
                                <small>$100</small>
                            </div>
                        </div>
                        <%
                                }
                            }
                        %>
                        <!--ESPECTACULO-EJEMPLO-->
                        
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <br> <br>
                <div class="articles card">
                    <div class="card-header d-flex align-items-center">
                        <h2 class="h3">Funciones</h2>
                    </div>
                    <!--FUNCIONES-->
                    <div class="card-body no-padding">
                        <!--FUNCION-EJEMPLO-->
                        <div class="item d-flex align-items-center">
                            <!--IMAGEN-->
                            <div class="image"><img src="https://sc2.elpais.com.uy/files/article_main/uploads/2018/01/25/5a6a82b9c13ba.jpeg"
                                alt="fotoPerfil" class="img-thumbnail" style="height: 100px ;width: 100px;"></div>
                                <div class="text"><a href="#">
                                    <!-- NOMBRE -->
                                    <h3 class="h5">El Entierro</h3>
                                </a>
                                <!--FECHA-->
                                <small>04/01/2022</small><br>
                                <!--HORA-->
                                <small>22:00</small>
                            </div>
                        </div>
                        <!--FUNCION-EJEMPLO-->
                        <div class="item d-flex align-items-center">
                            <!--IMAGEN-->
                            <div class="image"><img src="https://fotos.perfil.com/2019/04/04/trim/1040/780/20190404-agarrate-catalina-656295.jpg"
                                alt="fotoPerfil" class="img-thumbnail" style="height: 100px ;width: 100px;"></div>
                                <div class="text"><a href="#">
                                    <!-- NOMBRE -->
                                    <h3 class="h5">Tablado</h3>
                                </a>
                                <!--FECHA-->
                                <small>06/02/2022</small><br>
                                <!--HORA-->
                                <small>21:30</small>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

</html>

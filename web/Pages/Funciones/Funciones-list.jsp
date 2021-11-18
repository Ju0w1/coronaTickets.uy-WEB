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
    <link rel="icon" href="https://i.imgur.com/KXDtCAj.png">
    <%
        //Map<String, Espectaculo> espectaculosAux;
        Map<String, Espectaculo> EspectAux = new HashMap<>();
        Map<String, Categoria> categoriasAux;
        
        
        Map<String, Plataforma> plataformas = (Map<String, Plataforma>) request.getAttribute("plataformas");
        Map<String, Categoria> categorias = (Map<String, Categoria>) request.getAttribute("categorias");
        //Map<String, Espectaculo> espectaculos = (Map<String, Espectaculo>) request.getAttribute("espectaculos");
        Map<String, Funcion> funcionesDeEspec = new HashMap<>();
        Map<String, Espectaculo> espectaculosFiltrados = new HashMap<>();
        espectaculosFiltrados = (Map<String, Espectaculo>) request.getAttribute("espectaculosFiltrados");
        funcionesDeEspec = (Map<String, Funcion>) request.getAttribute("funcionesDeEspec");
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
        function activa_boton(campo,boton){
            $("#boton").click();
        }
        function activa_boton2(campo,boton2){
            $("#boton2").click();
        }
    </script> 

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
                                <% 
                                    String categoriaSelect = (String) request.getAttribute("categoriaSelect");
                                    if(categoriaSelect==null){ %>
                                        <option value="Default">Categorias</option>
                                    <% } else { %>
                                        <option value="Default"><%=categoriaSelect%></option>
                                    <%
                                    }
                                    int cont =0;
                                for (Map.Entry<String, Categoria> entry : categorias.entrySet()) {
                                    String key = entry.getKey();
                                    Categoria value = entry.getValue();  
                                    if(cont==0 && categoriaSelect!=null && value.getNombre().equalsIgnoreCase(categoriaSelect)){ %> 
                                        <option value="Categorias">Categorias</option>
                                    <%  
                                    }
                                    //if(!(value.getNombre().equals(categoriaSelect))){
                                    %>
                                        <option value="<%=value.getNombre()%>"><%=value.getNombre()%></option>
                                    <%
                                    //}
                                    cont++;
                                }
                                %>
                            </select>
                            <input hidden="true" type="submit" name="boton" id="boton">
                        </form>
                        
                    </div>
                </div>
                <div class="col-2">
                    <div class="dropdown">
                        <form action="/CoronaTickets-Web/funciones" method="post">
                            <select aria-label="Default select example" class="pla" name="pla" onChange="activa_boton2(this,this.form.boton2)" required
                                style="height: 42px; font-size: large; border-color: rgb(226, 227, 236); border-radius: 5%; background-color: #fafafa;">
                                <option selected>Plataformas</option>
                                <%
                                for (Map.Entry<String, Plataforma> entry : plataformas.entrySet()) {
                                    String key = entry.getKey();
                                    Plataforma value = entry.getValue();  
                                %>
                                <option value="<%=value.getNombre()%>"><%=value.getNombre()%></option>
                                <%
                                    }
                                %>
                            </select>
                            <input hidden="true" type="submit" name="boton2" id="boton2">
                        </form>
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
                                    if(value.getUrlIamgen()==null){
                                        value.setUrlImagen("https://i.imgur.com/Hh3cYL8.jpeg");
                                    }
                        %>
                        <form action="/CoronaTickets-Web/funciones" method="post">
                            <div class="item d-flex align-items-center">
                                
                                <input type="hidden" name="data" value="<%=value.getNombre()%>" />
                                
                                <!--IMAGEN-->
                                <div class="image"><img src="<%=value.getUrlIamgen()%>"
                                    alt="fotoPerfil" class="img-thumbnail" style="height: 100px ;width: 100px;">
                                </div>
                                <div class="text"> <br>
                                    <!--NOMBRE-->
                                    <button style="border:none; background-color: transparent;">
                                        <h3 class="h4"><%=value.getNombre()%></h3>
                                    </button> <br>
                                    <!--PLATAFORMA-->
                                    <pre> <label><%=value.getPlataforma()%></label>
                                </div>
                            </div>
                        </form>
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
                        <%
                            if(funcionesDeEspec!=null){
                                for (Map.Entry<String, Funcion> entry : funcionesDeEspec.entrySet()) {
                                    String key = entry.getKey();
                                    Funcion value = entry.getValue();
                        %>
                        <!--FUNCION-EJEMPLO-->
                        <form action="/CoronaTickets-Web/funcion" method="post">
                            <div class="item d-flex align-items-center">
                                <input type="hidden" name="data2" value="<%=value.getNombre()%>" />
                                <!--IMAGEN-->
                                <div class="image"><img src="<%=value.getUrlIamgen() %>"
                                    alt="fotoPerfil" class="img-thumbnail" style="height: 100px ;width: 100px;"></div>
                                    <div class="text"> 
                                        <button style="border:none; background-color: transparent;">
                                            <br>
                                            <h3 class="h4"><%=value.getNombre()%></h3>
                                        </button> <br>
                                    <!--FECHA-->
                                    <pre> <lavel><%=value.getFecha().toString()%> </lavel> <br>
                                </div>
                            </div>
                        </form>
                        <%
                                }
                            }
                        %>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>


</html>

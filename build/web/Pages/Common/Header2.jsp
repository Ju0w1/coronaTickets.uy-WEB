<%-- 
    Document   : Header
    Created on : Oct 1, 2021, 4:50:29 PM
    Author     : FederRodríguez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="icon" href="https://i.imgur.com/KXDtCAj.png">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
<!DOCTYPE html>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container">
        <a class="navbar-brand" href="home" style="margin-right: 40px;margin-right: 40px;">
            <img src="https://i.imgur.com/9HUpz3c.png" alt="" width="100" height="40">
        </a>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item" style="margin-right: 40px;">
                    <div class="input-group" style="width: 400px;">
                        <input class="form-control border-end-0 border rounded-pill searchbar" value="Espectáculos, Paquetes" type="search" onkeyup="filter()" id="myInput">
                        <span class="input-group-append">
                            <button class="btn btn-outline-secondary bg-white border-bottom-0 border rounded-pill" style="margin-left: -40px; height: 37px" type="button">
                                <i class="bi bi-search"></i>
                            </button>
                        </span>
                    </div>
                </li>
                <!--<li class="nav-item dropdown" style="margin-right: 40px;">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <strong>Plataformas</strong>
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#">Action</a></li>
                        <li><a class="dropdown-item" href="#">Another action</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="#">Something else here</a></li>
                    </ul>
                </li>
                <li class="nav-item dropdown" style="margin-right: 40px;">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <strong>Categorías</strong>
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#">Action</a></li>
                        <li><a class="dropdown-item" href="#">Another action</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="#">Something else here</a></li>
                    </ul>
                </li>-->

            </ul>
        </div>
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item dropdown" style="margin-right: 40px;">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    <img
                        src="
                        <%
                            imgPerfil = objSesion.getAttribute("imagen").toString();
                            if(imgPerfil.equals("")){
                                out.print("https://imgur.com/mwpO9Ct.png");
                            } else {
                            out.print(imgPerfil);
                            }
                        %>
                        "
                        class="rounded-circle z-depth-0"
                        alt="avatar image"
                        height="35"
                        hight="35"
                        />
                </a>
                <%
                    String tipoUsuario = objSesion.getAttribute("tipo").toString();
                    String nick = objSesion.getAttribute("nickname").toString();
                    if(tipoUsuario.equals("artista")){
                %>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li>
                                <form action="/CoronaTickets-Web/Usuario" method="post">
                                    <button type="submit" class="dropdown-item">
                                         Perfil
                                    </button>
                                    <input type="hidden" name="data" value="<%=nick%>" />
                                </form>
                            </li>
                            <li><a class="dropdown-item" href="users">Listar usuarios</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item" href="AltaEspectaculo">Alta espectáculo</a></li>
                            <li><a class="dropdown-item" href="AltaPaquete">Crear paquete de espectáculos</a></li>
                            <li><a class="dropdown-item" href="AltaFuncion">Alta función de espectáculo</a></li>
                            <li><a class="dropdown-item" href="AgregarEspectaculo">Agregar espectáculo a paquete</a></li>
                            <li><a class="dropdown-item" href="ConsultaEspectaculosFinalizados">Consultar espectaculos finalizados</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item" href="/CoronaTickets-Web/Pages/Users/CerrarSesion.jsp">Cerrar Sesión</a></li>
                        </ul>
                <%
                    }else if(tipoUsuario.equals("espectador")){
                %>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li>
                                <form action="/CoronaTickets-Web/Usuario" method="post">
                                    <button type="submit" class="dropdown-item">
                                         Perfil
                                    </button>
                                    <input type="hidden" name="data" value="<%=nick%>" />
                                </form>
                            </li>
                            <li><a class="dropdown-item" href="users">Listar usuarios</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item" href="funciones">Registro función de espectáculo</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item" href="/CoronaTickets-Web/Pages/Users/CerrarSesion.jsp">Cerrar Sesión</a></li>
                        </ul>
                <%
                    }
                %>
                
                
            </li>
            <h6 style="margin-top: 8%; padding-left: 0px;"> 
            <%
                usuario = objSesion.getAttribute("nickname").toString();
                out.print(usuario);
            %> </h6>
        </ul>
    </div>
</nav>

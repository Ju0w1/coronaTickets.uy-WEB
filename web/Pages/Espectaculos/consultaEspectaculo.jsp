<%-- 
    Document   : consultaEspectaculosDePaquete
    Created on : Oct 6, 2021, 5:59:49 PM
    Author     : pabli
--%>

<%@page import="DTOs.FuncionDTOConsultaEspectaculo"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="Logica.Clases.Paquete"%>
<%@page import="Logica.Clases.Funcion"%>
<%@page import="java.util.HashMap"%>
<%@page import="Logica.Clases.Categoria"%>
<%@page import="Logica.Clases.Espectaculo"%>
<%@page import="java.util.Map"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">

    <head>
        <link rel="icon" href="https://i.imgur.com/KXDtCAj.png">
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>CoronaTickets - Espectáculo</title>
        <!-- CSS only -->

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700&display=swap" rel="stylesheet">

        <style>
            body {
                font-family: 'Montserrat', sans-serif;
            }
        </style>
    </head>

    <body>
        <%
            HttpSession objSesion = request.getSession();
            String usuario;
            String imgPerfil;
            if (objSesion.getAttribute("nickname") != null) {%>
        <%@include file="/Pages/Common/HeaderSearchLogeado.jsp" %>
        <%} else {%>
        <%@include file="/Pages/Common/HeaderSearch.jsp" %>
        <%}
        %>
        <%
            String nombre = (String) request.getAttribute("nombre");
            nombre = nombre.replaceAll("Ã¡", "\u00E1");
            nombre = nombre.replaceAll("Ã©", "\u00E9");
            nombre = nombre.replaceAll("Ã­", "\u00ED");
            nombre = nombre.replaceAll("Ã³", "\u00F3");
            nombre = nombre.replaceAll("Ãº", "\u00FA");
            nombre = nombre.replaceAll("Ã±", "\u00F1");
            int artista = (int) request.getAttribute("artista");
            String descripcion = (String) request.getAttribute("descripcion");
            descripcion = descripcion.replaceAll("Ã¡", "\u00E1");
            descripcion = descripcion.replaceAll("Ã©", "\u00E9");
            descripcion = descripcion.replaceAll("Ã­", "\u00ED");
            descripcion = descripcion.replaceAll("Ã³", "\u00F3");
            descripcion = descripcion.replaceAll("Ãº", "\u00FA");
            descripcion = descripcion.replaceAll("Ã±", "\u00F1");
            int especmax = (int) request.getAttribute("especmax");
            int especmin = (int) request.getAttribute("especmin");
            String url = (String) request.getAttribute("url");
            double costo = (double) request.getAttribute("costo");
            double duracion = (double) request.getAttribute("duracion");
            Date fecha = (Date) request.getAttribute("fecha");
            String urlImagen = "";
            if (request.getAttribute("urlImagen").toString().equals("")) {
                urlImagen = "https://i.imgur.com/Hh3cYL8.jpeg";
            } else {
                urlImagen = (String) request.getAttribute("urlImagen");
            }
            List<Categoria> categorias = (List<Categoria>) request.getAttribute("categorias");
            List<FuncionDTOConsultaEspectaculo> funciones = (List<FuncionDTOConsultaEspectaculo>) request.getAttribute("funcionesDeEspec");
            List<Paquete> paquetes = (List<Paquete>) request.getAttribute("paquetes");
            int cantidadFavoritos = (int) request.getAttribute("cantidadFavoritos");
            boolean yaEsFavorito = (boolean) request.getAttribute("yaEsFavorito");
            String dia;
            String mes;
            if (fecha.getDate() < 10) {
                dia = "0" + fecha.getDate();
            } else {
                dia = Integer.toString(fecha.getDate());
            }
            if (fecha.getMonth() < 10) {
                mes = "0" + fecha.getMonth();
            } else {
                mes = Integer.toString(fecha.getMonth());
            }
            int anio = fecha.getYear() + 1900;
            //String fecha = espec.getFecha_Registro().getYear()+1900+"-"+mes+"-"+dia;
            String fechaA = dia + "/" + mes + "/" + anio;
        %>

        <div class="d-flex justify-content-md-center align-items-center mt-5">
            <div class="container" style="width: 100vh;">
                <div class="row">
                    <div class="col-12 d-flex justify-content-md-center">
                        <h1 class="mb-5">DETALLES DEL ESPECTÁCULO</h1>
                    </div>
                </div>

                <div class="row">
                    <div class="col-6">
                        <form class="p-2">

                            <div class="form-group row mb-2 justify-content-between">
                                <label for="inputNombre" class="col-sm-2 col-form-label">Nombre</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="inputNombre" name="nombreEspec" placeholder="<%=nombre%>" readonly>
                                </div>
                            </div>
                            <div class="form-group row mb-2 justify-content-between">
                                <label for="inputNombre" class="col-sm-2 col-form-label">Descripción</label>
                                <div class="col-sm-8">
                                    <textarea class="form-control rounded-3" id="inputDescripcion " style="resize: none; " placeholder="<%=descripcion%>" rows="2 " readonly></textarea>
                                </div>
                            </div>
                            <div class="form-group row mb-2 justify-content-between">
                                <label for="inputNombre" class="col-sm-2 col-form-label">Organizador</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="inputNombre" placeholder="<%=artista%>" readonly>
                                </div>
                            </div>
                            <div class="form-group row mb-2 justify-content-between">
                                <label for="inputNombre" class="col-sm-4 col-form-label">Duración</label>
                                <div class="col-sm-8">
                                    <input type="number" class="form-control" id="inputNombre" placeholder="<%=duracion%> Minutos" readonly>
                                </div>
                            </div>
                            <div class="form-group row mb-2 justify-content-between">
                                <label for="inputNombre" class="col-sm-8 col-form-label">Cantidad mínima de espectadores</label>
                                <div class="col-sm-4">
                                    <input type="number" class="form-control" id="inputNombre" placeholder="<%=especmin%>" readonly>
                                </div>
                            </div>
                            <div class="form-group row mb-2 justify-content-between">
                                <label for="inputNombre" class="col-sm-8 col-form-label">Cantidad máxima de espectadores</label>
                                <div class="col-sm-4">
                                    <input type="number" class="form-control" id="inputNombre" placeholder="<%=especmax%>" readonly>
                                </div>
                            </div>

                            <%
                                if (urlImagen.equals("")) {
                            %>

                            <%
                            } else {
                            %>
                            <div class="form-group row mb-2 justify-content-between">
                                <label for="inputNombre" class="col-sm-8 col-form-label">Imagen</label>

                                <div class="w-100 d-flex justify-content-md-center align-items-center">
                                    <img style="max-height:100%; max-width:100%;object-fit: contain;" src="<%=urlImagen%>">
                                </div>
                            </div>
                            <%
                                }
                            %>
                        </form>

                    </div>
                    <div class="col-6 p-2">
                        <div class="form-group row mb-2 justify-content-between">
                            <label for="inputNombre" class="col-sm-2 col-form-label">URL</label>
                            <div class="col-sm-10">
                                <input type="url" class="form-control" id="inputNombre" placeholder="<%=url%>" readonly>
                            </div>
                        </div>
                        <div class="form-group row mb-2 justify-content-between">
                            <label for="inputNombre" class="col-sm-5 col-form-label">Fecha de registro</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" id="inputNombre" placeholder="<%=fechaA%>" readonly>
                            </div>
                        </div>
                        <div class="form-group row mb-2 justify-content-between">
                            <label for="inputNombre" class="col-sm-2 col-form-label">Costo</label>
                            <div class="col-sm-10">
                                <input type="number" class="form-control" id="inputNombre" placeholder="<%=costo%>" readonly>
                            </div>
                        </div>
                        <div class="form-group row mb-2 justify-content-between">
                            <label for="inputNombre" class="col-sm-2 col-form-label">Categorías</label>
                            <div class="col-sm-50" >

                                <%
                                    for (Categoria categoriasx : categorias) {
                                        Categoria value2 = categoriasx;
                                %>
                                <span class="badge rounded-pill bg-secondary"><%=value2.getNombre()%></span>
                                <%
                                    }
                                %>

                            </div>
                        </div>
                        <div class="w-100 d-flex justify-content-md-center align-items-center">
                            <img style="max-height:100%; max-width:100%;object-fit: contain;" src="">
                        </div>
                        <div class="form-group row mb-2 justify-content-between">
                            <label for="inputNombre" class="col-sm-2 col-form-label">Funciones:</label>   
                        </div>
                        <div class="w-100 d-flex justify-content-md-center align-items-center">

                            <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
                                <div class="carousel-indicators">
                                    <%
                                        int i = 0;
                                        for (int xx = 0; xx < funciones.size(); xx++) {
                                            if (i == 0) {
                                    %>
                                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                                    <%
                                        i++;
                                    } else {
                                    %>
                                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="<%=i%>" aria-label="Slide 2"></button>
                                    <%
                                                i++;
                                            }
                                        }
                                    %>
                                </div>
                                <div class="carousel-inner">
                                    <%
                                        i = 0;
                                        for (FuncionDTOConsultaEspectaculo funcionx : funciones) {
                                            FuncionDTOConsultaEspectaculo value2 = funcionx;
                                            if (value2.getUrl_imagen() == null || value2.getUrl_imagen().equals("")) {
                                                value2.setUrl_imagen("https://i.imgur.com/Hh3cYL8.jpeg");
                                            }
                                            if (i == 0) {
                                    %>
                                    <div class="carousel-item active">
                                        <h6><%=value2.getNombre()%></h6>
                                        <img src="<%=value2.getUrl_imagen()%>" class="d-block w-100" alt="..." style="max-height:150px; max-width:100%;">
                                        <div class="card-img-overlay d-flex justify-content-md-center align-items-center">
                                            <form name="ver_mas" method="POST" action="/CoronaTickets-Web/funcion" >
                                                <input type="hidden" name="data2" value="<%=value2.getNombre()%>" />
                                                <input type="submit" value="Ver más" id="btn_ver_mas" class="btn btn-secondary">
                                            </form>
                                        </div>
                                    </div>
                                    <%
                                        i++;
                                    } else {
                                    %>
                                    <div class="carousel-item">
                                        <h6><%=value2.getNombre()%></h6>
                                        <img src="<%=value2.getUrl_imagen()%>" class="d-block w-100" alt="..." style="max-height:150px; max-width:100%;">
                                        <div class="card-img-overlay d-flex justify-content-md-center align-items-center">
                                            <form name="ver_mas" method="POST" action="/CoronaTickets-Web/funcion" >
                                                <input type="hidden" name="data2" value="<%=value2.getNombre()%>" />
                                                <input type="submit" value="Ver más" id="btn_ver_mas" class="btn btn-secondary">
                                            </form>
                                        </div>
                                    </div>
                                    <%
                                                i++;
                                            }
                                        }
                                    %>
                                </div>
                                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                    <span class="visually-hidden">Previous</span>
                                </button>
                                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                    <span class="visually-hidden">Next</span>
                                </button>
                            </div>
                        </div>
                        <div class="form-group row mb-2 justify-content-between">
                            <label for="inputNombre" class="col-sm-2 col-form-label">Paquetes:</label>   
                        </div>
                        <div class="w-100 d-flex justify-content-md-center align-items-center">

                            <div id="carouselExampleIndicators2" class="carousel slide" data-bs-ride="carousel">
                                <div class="carousel-indicators">
                                    <%
                                        i = 0;
                                        for (Paquete paquetex : paquetes) {
                                            if (i == 0) {
                                    %>
                                    <button type="button" data-bs-target="#carouselExampleIndicators2" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                                    <%
                                        i++;
                                    } else {
                                    %>
                                    <button type="button" data-bs-target="#carouselExampleIndicators2" data-bs-slide-to="<%=i%>" aria-label="Slide 2"></button>
                                    <%
                                                i++;
                                            }
                                        }
                                    %>
                                </div>
                                <div class="carousel-inner">
                                    <%
                                        i = 0;
                                        for (Paquete paquetex : paquetes) {
                                            Paquete value = paquetex;
                                            String nombrep = value.getNombre();
                                            String desc = value.getDescripcion();
                                            String mes1;
                                            if (value.getFecha_Inicio().getMes() < 10) {
                                                mes1 = "0" + value.getFecha_Inicio().getMes();
                                            } else {
                                                mes1 = Integer.toString(value.getFecha_Inicio().getMes());
                                            }
                                            String dia1;
                                            if (value.getFecha_Inicio().getDia() < 10) {
                                                dia1 = "0" + value.getFecha_Inicio().getDia();
                                            } else {
                                                dia1 = Integer.toString(value.getFecha_Inicio().getDia());
                                            }
                                            String mes2;
                                            if (value.getFecha_Fin().getMes() < 10) {
                                                mes2 = "0" + value.getFecha_Fin().getMes();
                                            } else {
                                                mes2 = Integer.toString(value.getFecha_Fin().getMes());
                                            }
                                            String dia2;
                                            if (value.getFecha_Fin().getDia() < 10) {
                                                dia2 = "0" + value.getFecha_Fin().getDia();
                                            } else {
                                                dia2 = Integer.toString(value.getFecha_Inicio().getDia());
                                            }
                                            String fechaIni = value.getFecha_Inicio().getAnio() + "-" + mes1 + "-" + dia1;
                                            String fechaFin = value.getFecha_Fin().getAnio() + "-" + mes2 + "-" + dia2;
                                            //String fechaFin = value.getFecha_Fin().getDia()+"/"+value.getFecha_Fin().getMes()+"/"+value.getFecha_Fin().getAnio();
                                            float descuento = value.getDescuento();
                                            float costop = value.getCosto();
                                            String urlImagenp = value.getUrl();
                                            String concat = nombrep + "@" + desc + "@" + fechaIni + "@" + fechaFin + "@" + Float.toString(descuento) + "@" + Float.toString(costop) + "@" + urlImagenp;
                                            if (value.getUrl() == null || value.getUrl().equals("")) {
                                                value.setUrl("https://i.imgur.com/Hh3cYL8.jpeg");
                                            }
                                            if (i == 0) {
                                    %>
                                    <div class="carousel-item active">
                                        <h6><%=value.getNombre()%></h6>
                                        <img src="<%=value.getUrl()%>" class="d-block w-100" alt="..." style="max-height:150px; max-width:100%;">
                                        <div class="card-img-overlay d-flex justify-content-md-center align-items-center">
                                            <form name="ver_mas" method="POST" action="/CoronaTickets-Web/Paquete" >
                                                <input type="hidden" value="<%= value.getNombre()%>" name="nombrePaquete">
                                                <input type="submit" value="Ver más" id="btn_ver_mas" class="btn btn-secondary">
                                            </form>
                                        </div>
                                    </div>
                                    <%
                                        i++;
                                    } else {
                                    %>
                                    <div class="carousel-item">
                                        <h6><%=value.getNombre()%></h6>
                                        <img src="<%=value.getUrl()%>" class="d-block w-100" alt="..." style="max-height:150px; max-width:100%;">
                                        <div class="card-img-overlay d-flex justify-content-md-center align-items-center">
                                            <form name="ver_mas" method="POST" action="/CoronaTickets-Web/Paquete" >
                                                <input type="hidden" value="<%= value.getNombre()%>" name="nombrePaquete">
                                                <input type="submit" value="Ver más" id="btn_ver_mas" class="btn btn-secondary">
                                            </form>
                                        </div>
                                    </div>
                                    <%
                                                i++;
                                            }
                                        }
                                    %>

                                </div>
                                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators2" data-bs-slide="prev">
                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                    <span class="visually-hidden">Previous</span>
                                </button>
                                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators2" data-bs-slide="next">
                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                    <span class="visually-hidden">Next</span>
                                </button>
                            </div>
                        </div>   
                    </div>
                    <%
                        if (objSesion.getAttribute("tipo") != null) {
                    %>
                    <%
                        if (yaEsFavorito == true) {
                    %>
                    <div style="text-align: center;">
                        Favoritos:
                        <button class="btn ">
                            <i class="bi bi-heart-fill"></i> <%=cantidadFavoritos%>
                        </button>
                    </div>
                    <%
                    } else {
                    %>
                    <div style="text-align: center;">
                        Favoritos:
                        <button class="btn ">
                            <i class="bi bi-heart"></i> <%=cantidadFavoritos%>
                        </button>
                    </div>
                    <%
                        }
                    } else {
                    %>
                    <div style="text-align: center;">
                        Favoritos:
                        <button class="btn " disabled>
                            <i class="bi bi-heart"></i> <%=cantidadFavoritos%>
                        </button>
                    </div>
                    <%
                        }
                    %>
                    <div class="row mt-3" style="margin-bottom: 20px; position: center;">
                        <div class="col-12 d-flex justify-content-md-center">
                            <a href="home">
                                <button class="btn btn-outline-secondary rounded-pill" style="margin-right: 10px; margin-left: 10px;">
                                    VOLVER
                                </button>
                            </a>
                            <%
                                if (objSesion.getAttribute("tipo") != null) {
                                    String tipoUsuario = objSesion.getAttribute("tipo").toString();
                                    if (tipoUsuario.equals("espectador")) {
                            %>
                            <%
                            } else {
                            %>
                            <a href="/CoronaTickets-Web/AltaEspectaculo">
                                <button class="btn btn-secondary rounded-pill me-3" style="margin-right: 10px; margin-left: 10px;">
                                    CREAR ESPECTÁCULO
                                </button>
                            </a>
                            <%
                                if (request.getAttribute("especFinalizado") != null) {
                                    if ((boolean) request.getAttribute("especFinalizado") == true) {
                            %>
                            <form name="" method="POST" action="/CoronaTickets-Web/FinEspectaculo" >
                                <input id="" name="nombreEspectaculoFinalizar" type="hidden" value="<%= nombre%>" >
                                <button type="submit" class="btn btn-secondary rounded-pill me-3" style="margin-right: 10px; margin-left: 10px;">
                                    FINALIZAR ESPECTÁCULO
                                </button>

                            </form>

                            <%
                                            }
                                        }
                                    }
                                }
                            %>
                        </div>
                    </div>
                </div>
            </div>

    </body>

</html>
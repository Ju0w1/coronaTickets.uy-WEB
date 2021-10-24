<%-- 
    Document   : consultaEspectaculosDePaquete
    Created on : Oct 6, 2021, 5:59:49 PM
    Author     : pabli
--%>

<%@page import="Logica.Clases.Categoria"%>
<%@page import="Logica.Clases.Espectaculo"%>
<%@page import="java.util.Map"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
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
        <%@include file="/Pages/Common/Header2.jsp" %>
        <%} else {%>
        <%@include file="/Pages/Common/Header.jsp" %>
        <%}
        %>
        <%
            String nombre = (String) request.getAttribute("nombre");
            String artista = (String) request.getAttribute("artista");
            String descripcion = (String) request.getAttribute("descripcion");
            String especmax = (String) request.getAttribute("especmax");
            String especmin = (String) request.getAttribute("especmin");
            String url = (String) request.getAttribute("url");
            String costo = (String) request.getAttribute("costo");
            String duracion = (String) request.getAttribute("duracion");
            String fecha = (String) request.getAttribute("fecha");
            String urlImagen = (String) request.getAttribute("urlImagen");
            Map<String, Categoria> categorias = (Map<String, Categoria>) request.getAttribute("categorias");
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
                                    <input type="text" class="form-control" id="inputNombre" placeholder="<%=nombre%>" readonly>
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
                                <input type="number" class="form-control" id="inputNombre" placeholder="<%=fecha%>" readonly>
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
                                    for (Map.Entry<String, Categoria> entry : categorias.entrySet()) {
                                        String key2 = entry.getKey();
                                        Categoria value2 = entry.getValue();
                                %>
                                <span class="badge rounded-pill bg-secondary"><%=value2.getNombre()%></span>
                                <%
                                    }
                                %>

                            </div>
                        </div>
                        <div class="form-group row mb-2 justify-content-between">
                            <label for="inputNombre" class="col-sm-2 col-form-label">Funciones</label>   
                        </div>

                        <!--<div class="w-100 h-50 d-flex justify-content-md-center align-items-center" style="background-color: #eee;">Imagen</div>-->

                        <div class="w-100 d-flex justify-content-md-center align-items-center">
                            <img style="max-height:100%; max-width:100%;object-fit: contain;" src="">
                        </div>
                        <div class="w-100 d-flex justify-content-md-center align-items-center">

                        </div>

                    </div>

                </div>
                <div class="row mt-3">
                    <div class="col-12 d-flex justify-content-md-center">
                        <a href="home">
                            <button class="btn btn-outline-secondary rounded-pill ">
                                VOLVER
                            </button>
                        </a>
                    </div>
                </div>
            </div>
        </div>

    </body>

</html>

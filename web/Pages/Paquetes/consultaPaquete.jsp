<%-- 
    Document   : consultaPaquete
    Created on : Oct 6, 2021, 5:57:52 PM
    Author     : pabli
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <!-- CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
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
            String descripcion = (String) request.getAttribute("desc");
            String fechaIni = (String) request.getAttribute("fechaIni");
            String fechaFin = (String) request.getAttribute("fechaFin");
            String descuento = (String) request.getAttribute("descuento");
            String costo = (String) request.getAttribute("costo");
            String imagen = (String) request.getAttribute("imagen");
        %>
        <div class="d-flex justify-content-md-center align-items-center vh-100 ">
            <div class="container" style="width: 100vh;">
                <div class="row">
                    <div class="col-12 d-flex justify-content-md-center">
                        <h1 class="mb-5">DETALLE DE PAQUETE</h1>
                    </div>
                </div>
                <div class="row">
                    <div class="col-6 d-flex justify-content-md-center align-items-center">
                        <div class="" style="background-color: #eee;">
                            <img class="w-100 " src="<%=imagen%>">
                        </div>
                    </div>
                    <div class="col-6">
                        <form class="p-2" name="paquete" method="POST" action="/CoronaTickets-Web/login">
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
                                <label for="inputNombre" class="col-sm-4 col-form-label">Fecha de inicio</label>
                                <div class="col-sm-8">
                                    <input type="date" class="form-control" id="inputNombre" placeholder="<%=fechaIni%>" readonly>
                                </div>
                            </div>
                            <div class="form-group row mb-2 justify-content-between">
                                <label for="inputNombre" class="col-sm-4 col-form-label">Fecha de fin</label>
                                <div class="col-sm-8">
                                    <input type="date" class="form-control" id="inputNombre" placeholder="<%=fechaFin%>" readonly>
                                </div>
                            </div>
                            <div class="form-group row mb-2 justify-content-between">
                                <label for="inputNombre" class="col-sm-2 col-form-label">Descuento</label>
                                <div class="col-sm-8">
                                    <input type="number" class="form-control" id="inputNombre" placeholder="<%=descuento%>" readonly>
                                </div>
                            </div>
                            <div class="form-group row mb-4 justify-content-between">
                                <label for="inputNombre" class="col-sm-2 col-form-label">Costo</label>
                                <div class="col-sm-8">
                                    <input type="number" class="form-control" id="inputNombre" placeholder="<%=costo%>" readonly>
                                </div>
                            </div>
                            <div class="form-group row justify-content-center">
                                <button type="submit" class="btn btn-secondary rounded-pill ">Ver espectáculos</button>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="row mt-5">
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

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js " integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj " crossorigin="anonymous "></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js " integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN " crossorigin="anonymous "></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js " integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF " crossorigin="anonymous "></script>
    </body>

</html>

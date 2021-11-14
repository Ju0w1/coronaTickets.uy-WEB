<%-- 
    Document   : consultaPaquete
    Created on : Oct 6, 2021, 5:57:52 PM
    Author     : pabli
--%>

<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Date"%>
<%@page import="Logica.Clases.Paquete"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <link rel="icon" href="https://i.imgur.com/KXDtCAj.png">
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>CoronaTickets - Paquete</title>
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
        <%}%>
        <%
            /*Paquete paqSeleccionado = (Paquete) objSesion.getAttribute("paqueteSeleccionado");
            String imagen = (String) objSesion.getAttribute("imagenPaquete");
            System.out.println(imagen);*/
            //Paquete paq = new Paquete(nombre_, Descripcion_, Fecha_Inicio_, Fecha_Fin_, Costo_, Descuento_, Fecha_Compra_);
            //Paquete paq = new Paquete(nombre_, Descripcion_, Fecha_Inicio_, Fecha_Fin_, Costo_, Descuento_, Fecha_Compra_, url_, Fecha_alta_, vigencia_);
            String nombre = (String) request.getAttribute("nombre");
            String descripcion = (String) request.getAttribute("descripcion");
            String fechaIni = (String) request.getAttribute("fechaIni");
            String fechaFin = (String) request.getAttribute("fechaFin");
            String descuento = (String) request.getAttribute("descuento");
            String costo = "0";
            //String costo = (String) request.getAttribute("costo");
            String imagen = (String) request.getAttribute("imagen");
            String nickname = (String) objSesion.getAttribute("nickname");
            Map<String, Paquete> paquetes2 = new HashMap<>();
            paquetes2 = (Map<String, Paquete>) request.getAttribute("paquetes2");
            //2013-01-08
            objSesion.setAttribute("nombrePaquete", nombre);


        %>
        <div class="d-flex justify-content-md-center align-items-center mt-5">
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
                        <div class="form-group row mb-2 justify-content-between">
                            <label for="inputNombre" class="col-sm-2 col-form-label">Nombre</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="inputNombre" placeholder="<%=nombre%>" readonly>
                            </div>
                        </div>
                        <div class="form-group row mb-2 justify-content-between">
                            <label for="inputNombre" class="col-sm-2 col-form-label">Descripción</label>
                            <div class="col-sm-8">
                                <textarea class="form-control rounded-3" id="inputDescripcion" style="resize: none;" placeholder="<%=descripcion%>" rows="4" readonly></textarea>
                            </div>
                        </div>
                        <div class="form-group row mb-2 justify-content-between">
                            <label for="inputNombre" class="col-sm-4 col-form-label">Fecha de inicio</label>
                            <div class="col-sm-8">
                                <input type="date" class="form-control" id="" value="<%=fechaIni%>" placeholder="" readonly>
                            </div>
                        </div>
                        <div class="form-group row mb-2 justify-content-between">
                            <label for="inputNombre" class="col-sm-4 col-form-label">Fecha de fin</label>
                            <div class="col-sm-8">
                                <input type="date" class="form-control" id="" value="<%=fechaFin%>" placeholder="" readonly>
                            </div>
                        </div>
                        <div class="form-group row mb-2 justify-content-between">
                            <label for="inputNombre" class="col-sm-2 col-form-label">Descuento</label>
                            <div class="col-sm-8">
                                <input type="number" class="form-control" id="" placeholder="<%=descuento%>" readonly>
                            </div>
                        </div>

                        <div class="form-group row justify-content-center">
                            <div class="btn-group" role="group" aria-label="Basic example">
                                <form class="p-2" name="paquete" method="POST" action="/CoronaTickets-Web/ConsultaEspectaculosDePaquete">
                                    <button type="submit" class="btn btn-secondary rounded-pill me-3">Ver espectáculos</button>
                                </form>

                                <%
                                    if(objSesion.getAttribute("nickname") != null){
                                    String tipoUsuario = objSesion.getAttribute("tipo").toString();
                                    if (tipoUsuario.equals("espectador")) {
                                        boolean isPaqueteComprado = false;
                                        for (Map.Entry<String, Paquete> entry : paquetes2.entrySet()) {
                                            String key2 = entry.getKey();
                                            Paquete value2 = entry.getValue();
                                            if (value2.getNombre().equals(nombre)) {
                                                isPaqueteComprado = true;
                                            }
                                        }
                                        if (isPaqueteComprado == false) {
                                %>
                                <form class="p-2" name="paquete" method="POST" action="/CoronaTickets-Web/ComprarPaquete">
                                    <input type="hidden" name="nickname" value="<%=nombre%>" />
                                    <button class="btn btn-outline-secondary rounded-pill ">
                                        COMPRAR
                                    </button>
                                </form>
                                <%
                                } else {
                                %>
                                <form class="p-2" name="paquete" method="POST" action="/CoronaTickets-Web/ComprarPaquete">
                                    <input type="hidden" name="nickname" value="<%=nombre%>" />
                                    <button class="btn btn-outline-secondary rounded-pill disabled">
                                        COMPRADO  <i class="bi bi-check2-circle"></i>
                                    </button>
                                   
                                </form>
                                <%
                                    }
                                %>
                                <%
                                } else {
                                %>
                                <form class="p-2">
                                <a class="btn btn-outline-secondary rounded-pill " href="AltaPaquete">CREAR PAQUETE</a>
                                </form>
                                <%
                                    }
                                }
                                %>
                            </div>
                        </div>
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
    </body>

</html>

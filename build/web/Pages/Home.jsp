<%-- 
    Document   : Login
    Created on : Sep 1, 2021, 11:30:19 PM
    Author     : LucasCiceri
--%>

<%@page import="Logica.Interfaz.IControladorPaquete"%>
<%@page import="Logica.Fabrica"%>
<%@page import="java.util.HashMap"%>
<%@page import="Logica.Clases.Paquete"%>
<%@page import="java.util.Map"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>

    <!DOCTYPE html>

    <html>
    <head>

        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <!-- CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700&display=swap" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>


        <!-- JavaScript Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <style>
            body {
                font-family: 'Montserrat', sans-serif;
            }
        </style>
    </head>
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
    <body>
        <div class="d-flex justify-content-md-center align-items-center mt-5">
            <div class="container w-75 ">
                    <div class="row ">
                        <div class="col-6"  style="overflow-y: scroll; height: 85vh">
                            <h1>Paquetes</h1>
                            <%
                                Map<String, Paquete> paquetes = (Map<String, Paquete>) request.getAttribute("paquetes");
                                if(paquetes == null){
                                    System.out.println("VACIO");
                                }else{
                                    for (Map.Entry<String, Paquete> entry : paquetes.entrySet()) {
                                        String key = entry.getKey();
                                        Paquete value = entry.getValue();
                                        String nombre =value.getNombre();
                                        String desc = value.getDescripcion();
                                        String fechaIni = value.getFecha_Inicio().getDia()+"/"+value.getFecha_Inicio().getMes()+"/"+value.getFecha_Inicio().getAnio();
                                        String fechaFin = value.getFecha_Fin().getDia()+"/"+value.getFecha_Fin().getMes()+"/"+value.getFecha_Fin().getAnio();
                                        float descuento = value.getDescuento();
                                        float costo = value.getCosto();
                                        String urlImagen = value.getUrl();
                                        String concat = nombre+","+desc+","+fechaIni+","+fechaFin+","+Float.toString(descuento)+","+Float.toString(costo)+","+urlImagen;
                            %>
                            <div class="row ">
                                <div class="container w-100 mt-3 mb-3">
                                    <div class="card bg-dark text-white">
                                        <img src="<%= value.getUrl()%>" id="<%= key%>" class="card-img">
                                        <div class="card-img-overlay d-flex justify-content-md-center align-items-center">
                                            <form name="ver_mas" method="POST" action="/CoronaTickets-Web/Paquete" >
                                                <input type="hidden" value="<%= concat %>" name="ver_mas">
                                                <input type="submit" value="Ver más" id="btn_ver_mas" class="btn btn-secondary">
                                            </form>
                                        </div>
                                    </div>
                                    
                                </div>
                            </div>
                            <%
                                    }
                                }
                            %> 
                        </div>
                        <div class="col-6"  style="overflow-y: scroll; height: 85vh">
                            <h1>Espectáculos</h1>
                            <div class="container">
                                
                            </div>
                        </div>
                    </div>
                             
            </div>
        </div>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </body>

    </html>
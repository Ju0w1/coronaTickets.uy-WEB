<%-- 
    Document   : Login
    Created on : Sep 1, 2021, 11:30:19 PM
    Author     : LucasCiceri
--%>

<%@page import="java.util.HashMap"%>
<%@page import="Logica.Clases.Paquete"%>
<%@page import="java.util.Map"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

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


        <!-- JavaScript Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </head>
    <%@include file="/Pages/Common/Header.jsp" %>
    <body>
        <div class="d-flex justify-content-md-center align-items-center mt-5">
            <div class="container w-75 bg-danger" style="overflow-y: scroll; ">
                <%
                    Map<String, Paquete> paquetes = new HashMap<>();
                    paquetes = (Map<String, Paquete>) request.getAttribute("paquetes");
                    String mensaje = (String) request.getAttribute("mensaje");
                    System.out.println(mensaje);
                    if(paquetes == null){
                        System.out.println("VACIO");
                    }
                    for (Map.Entry<String, Paquete> entry : paquetes.entrySet()) {
                        String key = entry.getKey();
                        Paquete value = entry.getValue();

                    %>
                    <div class="row ">
                        <div class="col-6 h-100">
                            <div class="container bg-success">
                                <img src="<%= value.getUrl()%>" id="<%= key%>" width="100" height="100">
                            </div>
                        </div>
                        <div class="col-6 h-100">
                            <div class="container bg-success">
                                <img src="<%= value.getUrl() %>" width="100" height="100">
                            </div>
                        </div>
                    </div>
                    <%
                        }
                    %>
            </div>
        </div>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </body>

    </html>
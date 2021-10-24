<%-- 
    Document   : agregarEspectaculoAPaquete
    Created on : Oct 23, 2021, 7:56:11 PM
    Author     : pabli
--%>

<%@page import="java.util.Map"%>
<%@page import="Logica.Clases.Plataforma"%>
<%@page import="Logica.Clases.Paquete"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- CSS only -->
    <!-- 
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
     -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700&display=swap" rel="stylesheet">
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
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
        <%}
        else{%>
            <%@include file="/Pages/Common/Header.jsp" %>
        <%}
    %>
    <div class="d-flex justify-content-md-center align-items-center mt-5">
        <%
            
                if(request.getAttribute("paquete") == null && request.getAttribute("espectaculo") == null){

        %>  
                    <form name="agregarEspectaculo" method="GET" action="/CoronaTickets-Web/AgregarEspectaculo">
                        <div style="width: 80vh;" class="form-register ">
                            <h1 class="mb-5">AGREGAR ESPECTÁCULO A PAQUETE</h1>
                        </div>
                        <div class="row d-flex justify-content-md-center align-items-center">
                            <div class="col-6">
                                <div class="row">
                                    <select class="form-select" aria-label="Default select example">
                                        <option selected>Paquetes</option>
                                        <option value="1">One</option>
                                        <option value="2">Two</option>
                                        <option value="3">Three</option>
                                    </select>
                                </div>
                                <div class="row mt-4">
                                    <select class="form-select" name="plataforma" aria-label="Plataformas">
                                        <option selected>Plataformas</option>
                                        <%
                                            int i=0;
                                            Map<String, Plataforma> plataformas = (Map<String, Plataforma>) request.getAttribute("plataformas");
                                            if(plataformas == null){
                                                System.out.println("VACIO");
                                            }else{
                                                for (Map.Entry<String, Plataforma> entry : plataformas.entrySet()) {
                                                    String key = entry.getKey();
                                                    Plataforma value = entry.getValue();
                                        %>
                                        <option value="<%=i%>" id="<%=key%>"><%=key%></option>
                                        <%
                                                    i++;
                                                }
                                            }
                                        %>
                                    </select>
                                </div>

                            </div>


                        </div>
                        <div class="form-register mt-5 d-flex justify-content-md-center align-items-center ">
                            <button type="submit " class="btn btn-outline-secondary rounded-pill ">
                                BUSCAR
                            </button>
                        </div>
                    </form>
        <%
                }else{
        %> 
                    <form name="agregarEspectaculo2" method="POST" action="/CoronaTickets-Web/AgregarEspectaculo">
                        <div style="width: 80vh;" class="form-register ">
                            <h1 class="mb-5">AGREGAR ESPECTÁCULO A PAQUETE</h1>
                        </div>
                        <div class="row d-flex justify-content-md-center align-items-center">
                            <div class="col-6">
                                <div class="row">
                                    <select class="form-select" aria-label="Default select example">
                                        <option selected>Espectáculo</option>
                                        <option value="1">One</option>
                                        <option value="2">Two</option>
                                        <option value="3">Three</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="form-register mt-5 d-flex justify-content-md-center align-items-center ">
                            <button type="submit " class="btn btn-outline-secondary rounded-pill ">
                                AGREGAR
                            </button>
                        </div>
                    </form>
        <%      
                }
        %>
    </div>
</body>

</html>

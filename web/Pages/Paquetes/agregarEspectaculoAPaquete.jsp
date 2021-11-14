<%-- 
    Document   : agregarEspectaculoAPaquete
    Created on : Oct 23, 2021, 7:56:11 PM
    Author     : pabli
--%>

<%@page import="DTOs.PaquetesListaDTO"%>
<%@page import="DTOs.PlataformaDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Logica.Clases.Espectaculo"%>
<%@page import="java.util.Map"%>
<%@page import="Logica.Clases.Plataforma"%>
<%@page import="Logica.Clases.Paquete"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <link rel="icon" href="https://i.imgur.com/KXDtCAj.png">
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>CoronaTickets - Agregar Espectáculo a Paquete</title>
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
        <%@include file="/Pages/Common/HeaderSearchLogeado.jsp" %>
        <%} else {%>
        <%@include file="/Pages/Common/HeaderSearch.jsp" %>
        <%}
        %>
        <div class="d-flex justify-content-md-center align-items-center mt-5">
            <%
                String paq = (String) request.getAttribute("paquete");

                if (request.getParameter("paquete") == null || request.getParameter("paquete") == null) {

            %>  
            <form name="agregarEspectaculo" method="GET" action="/CoronaTickets-Web/AgregarEspectaculo" class="needs-validation" novalidate>
                <div style="width: 80vh;" class="form-register ">
                    <h1 class="mb-5">AGREGAR ESPECTÁCULO A PAQUETE</h1>
                </div>
                <div class="row d-flex justify-content-md-center align-items-center">
                    <div class="col-6">
                        <div class="row">
                            <label for="validationCustom01" class="form-label">Selecciona el Paquete:</label>
                            <select class="form-select" name="paquete" id="validationCustom01" aria-label="Paquetes" required>
                                <option selected disabled value="">Paquetes</option>
                                <%                                            int j = 0;
                                    PaquetesListaDTO paquetes = (PaquetesListaDTO) request.getAttribute("paquetes");
                                    if (paquetes == null) {
                                        System.out.println("VACIO");
                                    } else {
                                        for (Paquete entry : paquetes.getPaquetes()){
                                            String key=entry.getNombre();
                                %>
                                <option value="<%=key%>" id="<%=key%>"><%=key%></option>
                                <%
                                            j++;
                                        }
                                    }
                                %>
                            </select>
                            <div class="invalid-feedback">
                                 Debe seleccionar un Paquete.
                            </div>
                        </div>
                        <div class="row mt-4">
                            <label for="validationCustom02" class="form-label">Selecciona la Plataforma:</label>
                            <select class="form-select" id="validationCustom02" name="plataforma" aria-label="Plataformas" required>
                                <option selected disabled value="">Plataformas</option>
                                <%
                                    int i = 0;
                                    PlataformaDTO plataformas = (PlataformaDTO) request.getAttribute("plataformas");
                                    
                                    if (plataformas == null) {
                                        System.out.println("VACIO");
                                    } else {
                                        for (Plataforma entry : plataformas.getPlataformas()) {
                                            String value2=entry.getNombre();
                                %>
                                <option value="<%=value2%>" id="<%=value2%>"><%=value2%></option>
                                <%
                                            i++;
                                        }
                                    }
                                %>
                            </select>
                            <div class="invalid-feedback">
                                Debe seleccionar una Plataforma.
                            </div>
                        </div>

                    </div>


                </div>
                <div class="form-register mt-5 d-flex justify-content-md-center align-items-center ">
                    <button type="submit" class="btn btn-outline-secondary rounded-pill ">
                        BUSCAR
                    </button>
                </div>
            </form>
            <%
            } else {
            %> 
            <form name="agregarEspectaculo2" method="POST" action="/CoronaTickets-Web/AgregarEspectaculo" class="needs-validation" novalidate>
                <input id="labelImagen" name="paquetePost" type="hidden" value="<%=paq%>">
                <div style="width: 80vh;" class="form-register ">
                    <h1 class="mb-5">AGREGAR ESPECTÁCULO A PAQUETE</h1>
                </div>
                <div class="row d-flex justify-content-md-center align-items-center">
                    <div class="col-6">
                        <div class="row">
                            <label for="validationCustom03" class="form-label">Selecciona el Espectáculo a vincular:</label>
                            <select class="form-select" name="espectaculo" id="validationCustom03" aria-label="Default select example" required>
                                <option selected disabled value="">Espectáculo</option>
                                <%
                                    ArrayList<String> espectaculos = (ArrayList<String>) request.getAttribute("espectaculos");
                                    if (espectaculos == null) {
                                        System.out.println("VACIO");
                                    } else {
                                        for (String espectaculo : espectaculos) {
                                %>
                                <option value="<%=espectaculo%>" id="validationCustom02"><%=espectaculo%></option>
                                <%

                                        }
                                    }
                                %>
                            </select>
                            <div class="invalid-feedback">
                                Debe seleccionar un Espectáculo.
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-register mt-5 d-flex justify-content-md-center align-items-center ">
                    <button type="submit" class="btn btn-outline-secondary rounded-pill ">
                        AGREGAR
                    </button>
                </div>
            </form>
            <%
                }
            %>
        </div>
        <script>
            // Example starter JavaScript for disabling form submissions if there are invalid fields
            (() => {
                'use strict';

                // Fetch all the forms we want to apply custom Bootstrap validation styles to
                const forms = document.querySelectorAll('.needs-validation');

                // Loop over them and prevent submission
                Array.prototype.slice.call(forms).forEach((form) => {
                    form.addEventListener('submit', (event) => {
                        if (!form.checkValidity()) {
                            event.preventDefault();
                            event.stopPropagation();
                        }
                        form.classList.add('was-validated');
                    }, false);
                });
            })();
        </script>
    </body>

</html>

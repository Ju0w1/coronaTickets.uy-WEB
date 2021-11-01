<%-- 
    Document   : altaPaquete
    Created on : Oct 20, 2021, 9:04:01 PM
    Author     : pabli
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <link rel="icon" href="https://i.imgur.com/KXDtCAj.png">
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>CoronaTickets - Crear Paquete</title>
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
        <script>
            function abrirModal() {
                var myModal = new bootstrap.Modal(document.getElementById("myModal"));
                myModal.show();
            }
        </script>
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
            String nickvalue = "";
            String descvalue = "";
            String fechaivalue = "";
            String fechafvalue = "";
            String descuentovalue = "";
            String successvalue = "";
            String errorvalue = "";
            if (request.getAttribute("rNombre") != null) {
                nickvalue = (String) request.getAttribute("rNombre");
            }
            if (request.getAttribute("rDescripcion") != null) {
                descvalue = (String) request.getAttribute("rDescripcion");
            }
            if (request.getAttribute("rFechaInicio") != null) {
                fechaivalue = (String) request.getAttribute("rFechaInicio");
            }
            if (request.getAttribute("rFechaFin") != null) {
                fechafvalue = (String) request.getAttribute("rFechaFin");
            }
            if (request.getAttribute("rDescuento") != null) {
                descuentovalue = (String) request.getAttribute("rDescuento");
            }
            if (request.getAttribute("success") != null) {
                successvalue = (String) request.getAttribute("success");
            }
            if (request.getAttribute("error") != null) {
                errorvalue = (String) request.getAttribute("error");
            }
        %>
        <div class="d-flex justify-content-md-center align-items-center mt-5">

            <form name="altaPaquete" method="POST" action="/CoronaTickets-Web/AltaPaquete" class="needs-validation" novalidate>
                <div style="width: 80vh;" class="form-register d-flex justify-content-md-center align-items-center">
                    <h1 class="mb-5 text-center">ALTA DE PAQUETE DE ESPECTÁCULOS</h1>
                </div>
                <div class="row">
                    <div class="col-6">
                        <div class="form-group ">
                            <input type="text" class="form-control rounded-pill mb-1" id="validationCustom01" name="inputNombre" placeholder="Nombre" value="<%=nickvalue%>" required>
                            <div class="invalid-feedback mb-2">Campo inválido.</div>
                        </div>
                        <textarea class="form-control rounded-3 mb-1" id="validationCustom02" style="resize: none; " name="inputDescripcion" placeholder="Descripción " rows="6" value="<%=descvalue%>" required><%=descvalue%></textarea>
                        <div class="invalid-feedback mb-2">Campo inválido.</div>
                    </div>

                    <div class="col-6">
                        <div class="form-group ">
                            <label for="" class="ps-1">Fecha inicio:</label>
                            <div class="input-group ">
                                <input type="date" class="form-control rounded-pill mb-1 " id="validationCustom03"name="inputFechaInicio" placeholder="Fecha inicio" value="<%=fechaivalue%>" required>
                                <span class="input-group-append ">
                                    <button class="btn btn-outline-secondary bg-white border-0 rounded-pill " style="margin-left: -41px; margin-top: 1.5px; height: 32px " type="button ">
                                        <i class="bi bi-calendar"></i>
                                    </button>
                                </span>
                                <div id="respuestaFI" class="invalid-feedback mb-2">Campo inválido.</div>
                            </div>
                        </div>
                        <div class="form-group ">
                            <label for="" class="ps-1">Fecha fin:</label>
                            <div class="input-group ">
                                <input type="date" class="form-control rounded-pill mb-1 " id="validationCustom04" name="inputFechaFin" placeholder="Fecha fin" value="<%=fechafvalue%>" required>
                                <span class="input-group-append ">
                                    <button class="btn btn-outline-secondary bg-white border-0 rounded-pill " style="margin-left: -41px; margin-top: 1.5px; height: 32px " type="button ">
                                        <i class="bi bi-calendar "></i>
                                    </button>
                                </span>
                                <div id="respuestaFF" class="invalid-feedback mb-2">Campo inválido.</div>
                            </div>
                        </div>
                        <div class="input-group ">
                            <input type="number" class="form-control rounded-pill mb-1 " id="validationCustom05" name="inputDescuento" placeholder="Descuento" value="<%=descuentovalue%>" required>
                            <span class="input-group-append ">
                                <button class="btn btn-outline-secondary bg-white border-0 rounded-pill " style="margin-left: -41px; margin-top: 1.5px; height: 32px " type="button ">
                                    <i class="bi bi-currency-dollar"></i>
                                </button>
                            </span>
                            <div class="invalid-feedback mb-2">Campo inválido.</div>
                        </div>
                        <label for="altaEspectaculo" class="form-label">URL de imagen (Opcional):</label>
                        <input id="labelImagen" name="urlImagen" type="hidden" value="">
                        <div class="input-group">
                            <input type="file" class="form-control rounded-pill mb-2 " id="inputFile"  name="inputFile" placeholder="">
                            <span class="input-group-append ">
                                <button class="btn btn-outline-secondary bg-white border-0 rounded-pill " style="margin-left: -41px; margin-top: 1.5px; height: 32px " type="button "disabled>
                                    <i class="bi bi-link-45deg "></i>
                                </button>
                            </span>
                        </div>
                    </div>


                </div>

                <div class="d-flex justify-content-center" id="spinner-border">
                </div>

                <div class="form-register mt-5 d-flex justify-content-md-center align-items-center ">
                    <button type="submit" id="subir" class="btn btn-outline-secondary rounded-pill ">
                        CREAR
                    </button>
                </div>

            </form>
        </div>

        <%
            //MODAL PARA ERRORES
            String error = (String) request.getAttribute("error");
            System.out.println(error);
            if (error != null) {
                String[] errores = error.split(",");
        %>
        <div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Error</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <%
                            for (String err : errores) {
                        %>
                        <p>- <%=err%></p>
                        <%
                            }
                        %>

                    </div>
                </div>

            </div>
        </div>
        <script>
            abrirModal();
        </script>
        <%
            }
        %>
        <%
            //MODAL PARA ERRORES
            String success = (String) request.getAttribute("success");
            System.out.println(success);
            if (success != null) {

        %>
        <div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content ">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel"><%=success%></h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body d-flex align-items-center justify-content-center">
                        <div class="w-50">
                            <img style="max-height:100%; max-width:100%;object-fit: contain;" id="imagenEnDiv" src="https://i.imgur.com/w50RQl3.png">
                        </div>

                    </div>
                </div>

            </div>
        </div>
        <script>
            abrirModal();
        </script>
        <%
            }
        %>          

        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="http://localhost:8080/CoronaTickets-Web/Pages/malihu-custom-scrollbar-plugin-master/jquery.mCustomScrollbar.concat.min.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                $('input[type="file"]').change(function (e) {
                    const file = document.getElementById("file");
                    const label = document.getElementById("imagen");
                    var apiURL = 'https://api-imgur.herokuapp.com/upload';
                    var settings = {
                        sync: false,
                        //crossDomain: true,
                        processData: false,
                        contentType: false,
                        type: 'POST',
                        url: apiURL,
                        headers: {
                            Accept: 'application/json',
                            'Access-Control-Allow-Origin': "*"
                        },
                        mimeType: 'multipart/form-data'
                    };
                    var formData = new FormData();
                    formData.append('file', e.target.files[0]);
                    settings.data = formData;
                    $('#subir').attr('disabled', 'disabled');
                    $("#spinner-border").append('<div class="spinner-border mb-3 mt-3" role="status"><span class="visually-hidden">Loading...</span></div>');
                    $.ajax(settings).done(function (response) {
                        $('#subir').removeAttr('disabled');
                        //console.log(response);
                        var lab = $.parseJSON(response);
                        $(".visually-hidden").remove();
                        $(".spinner-border").remove();
                        //console.log(lab.data.url);
                        //$label.val = response.data.link;
                        //$("#labelImagen").text(lab.data.url);
                        $("#labelImagen").attr("value", lab.data.url);
                    });
                });
            });

        </script>   
        <script>
            $(document).ready(function () {
                $('form').on('submit', function (e) {
                    // validation code here
                    let fechaI = document.getElementById('validationCustom03').value;
                    let fechaF = document.getElementById('validationCustom04').value;
                    const fechaISplited = fechaI.split("-");
                    const fechaFSplited = fechaF.split("-");
                    var fechaIAnio = Number(fechaISplited[0]);
                    var fechaIMes = Number(fechaISplited[1]);
                    var fechaIDia = Number(fechaISplited[2]);
                    var fechaFAnio = Number(fechaFSplited[0]);
                    var fechaFMes = Number(fechaFSplited[1]);
                    var fechaFDia = Number(fechaFSplited[2]);
                    if (fechaFAnio < fechaIAnio || (fechaFAnio == fechaIAnio && fechaFMes == fechaIMes && fechaFDia < fechaIDia) || (fechaFAnio == fechaIAnio && fechaFMes < fechaIMes)) {
                        var elementfechaI = document.getElementById("validationCustom03");
                        var elementfechaF = document.getElementById("validationCustom04");
                        elementfechaI.classList.add("is-invalid");
                        elementfechaF.classList.add("is-invalid");
                        document.getElementById("respuestaFI").innerHTML = "Fecha de inicio no puede ser mayor que fecha de finalización.";
                        document.getElementById("respuestaFF").innerHTML = "Fecha de finalización no puede ser menor que fecha de inicio.";
                        e.preventDefault();
                    }
                });
            });
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

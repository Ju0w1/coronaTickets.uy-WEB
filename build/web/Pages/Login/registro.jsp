<%-- 
    Document   : registro
    Created on : Oct 1, 2021, 2:28:33 PM
    Author     : pabli
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <link rel="icon" href="https://i.imgur.com/KXDtCAj.png">
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>CoronaTickets - Registrarse</title>
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
        String pass1value = "";
        String pass2value = "";
        String emailvalue = "";
        String nombrevalue = "";
        String apellidovalue = "";
        String datevalue = "";
        String errorvalue = "";
        if (request.getAttribute("rnick") != null) {
            nickvalue = (String) request.getAttribute("rnick");
        }
        if (request.getAttribute("rpass1") != null) {
            pass1value = (String) request.getAttribute("rpass1");
        }
        if (request.getAttribute("rpass2") != null) {
            pass2value = (String) request.getAttribute("rpass2");
        }
        if (request.getAttribute("remail") != null) {
            emailvalue = (String) request.getAttribute("remail");
        }
        if (request.getAttribute("rnombre") != null) {
            nombrevalue = (String) request.getAttribute("rnombre");
        }
        if (request.getAttribute("rapellido") != null) {
            apellidovalue = (String) request.getAttribute("rapellido");
        }
        if (request.getAttribute("rdate") != null) {
            datevalue = (String) request.getAttribute("rdate");
        }
        if (request.getAttribute("error") != null) {
            errorvalue = (String) request.getAttribute("error");
        }
    %>
    <body>
        <div class="d-flex justify-content-md-center align-items-center vh-100">

            <form name="registro" method="POST" action="/CoronaTickets-Web/registro" class="needs-validation" novalidate>
                <div class="form-register d-flex justify-content-md-center align-items-center">
                    <h1 class="mb-5">REGISTRAR USUARIO</h1>
                </div>
                <div class="row">
                    <div class="column col-6">
                        <h6 class="mb-2">Datos de usuario</h6>
                        <div class="form-group">
                            <input type="text" class="form-control rounded-pill mb-2" id="validationCustom01" name="inputNickname" placeholder="Nickname" value="<%=nickvalue%>" required>
                            <div id="respuestaNick" class="invalid-feedback">Nickname inválido.</div>
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-control rounded-pill mb-2" id="validationCustom02" name="inputPassword1" placeholder="Contraseña" value="<%=pass1value%>" required>
                            <div id="respuestaPass1" class="invalid-feedback">Contraseña inválida.</div>
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-control rounded-pill mb-2" id="validationCustom03" name="inputPassword2" placeholder="Confirmar contraseña" value="<%=pass2value%>" required>
                            <div id="respuestaPass2" class="invalid-feedback">Contraseña inválida.</div>
                        </div>
                        <div class="form-group">
                            <input type="email" class="form-control rounded-pill mb-2" id="validationCustom04" name="inputEmail1" aria-describedby="emailHelp" placeholder="Nickname/Email" value="<%=emailvalue%>" required>
                            <div id="respuestaMail" class="invalid-feedback">Mail inválido.</div>
                        </div>
                    </div>

                    <div class="column col-6 mb-5">
                        <h6 class="mb-2">Datos personales</h6>
                        <div class="form-group">
                            <input type="text" class="form-control rounded-pill mb-2" id="validationCustom05"name="inputNombre" placeholder="Nombre" value="<%=nombrevalue%>" required>
                            <div class="invalid-feedback">Nombre inválido.</div>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control rounded-pill mb-2" id="validationCustom06" name="inputApellido"  placeholder="Apellido" value="<%=apellidovalue%>" required>
                            <div class="invalid-feedback">Apellido inválido.</div>
                        </div>
                        <div class="form-group">
                            <div class="input-group border border-secondary rounded-pill mb-2">
                                <input type="date" class="form-control border-0 rounded-pill " placeholder="" id="validationCustom07" name="inputNacimiento" value="<%=datevalue%>" required>    
                                <span class="input-group-btn">
                                    <button class="btn btn-default" type="">
                                        <i class="bi bi-calendar2-date"></i>
                                    </button>
                                </span>
                            </div>
                            <div id="respuestaFecha" class="invalid-feedback">Fecha de nacimiento inválida.</div>
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

                <div class="form-register d-flex justify-content-md-center align-items-center">
                    <button type="button" id="subir" class="btn btn-outline-secondary rounded-pill" data-bs-toggle="modal" data-bs-target="#myModal">
                        Registrate
                    </button>
                </div>

                <div class="modal fade text-center" id="myModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">DESEA REGISTRARSE COMO:</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <div class="d-flex justify-content-around">
                                    <button type="submit" class="btn btn-outline-secondary" name="registrar" value="espectador">Espectador</button>
                                    <button type="submit" class="btn btn-outline-secondary" name="registrar" value="artista">Artista</button> 
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </form>
        </div>
        <script type="text/javascript">
            console.log("<%=errorvalue%>");
            if ("error" == "<%=errorvalue%>") {
                var element = document.getElementById("validationCustom01");
                element.classList.add("is-invalid");
                document.getElementById("respuestaNick").innerHTML = "Nickname o Mail ya existe.";
                var element = document.getElementById("validationCustom04");
                element.classList.add("is-invalid");
                document.getElementById("respuestaMail").innerHTML = "Mail o Nickname ya existe.";
            } else {
                var element = document.getElementById("validationCustom01");
                element.classList.remove("is-invalid");
                document.getElementById("respuestaNick").innerHTML = "Nickname inválido.";
                var element = document.getElementById("validationCustom04");
                element.classList.remove("is-invalid");
                document.getElementById("respuestaMail").innerHTML = "Mail inválido.";
            }

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
                    $("#spinner-border").append('<div class="spinner-border mb-4" role="status"><span class="visually-hidden">Loading...</span></div>');
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
                    if ((document.getElementById('validationCustom02').value) !== (document.getElementById('validationCustom03').value)) {
                        var elementpass = document.getElementById("validationCustom02");
                        elementpass.classList.add("is-invalid");
                        document.getElementById("respuestaPass1").innerHTML = "Las contraseñas no coinciden.";
                        var elementpass2 = document.getElementById("validationCustom03");
                        elementpass2.classList.add("is-invalid");
                        document.getElementById("respuestaPass2").innerHTML = "Las contraseñas no coinciden.";
                        e.preventDefault();
                    }

                    let fechastring = document.getElementById('validationCustom07').value;
                    const myArr = fechastring.split("-");
                    if (myArr[0] >= "2003") {
                        alert("No está permitido el registro a menores de 18 años.");
                        var elementfecha = document.getElementById("validationCustom07");
                        elementfecha.classList.add("is-invalid");
                        document.getElementById("respuestaFecha").innerHTML = "No está permitido el registro a menores de 18 años.";
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

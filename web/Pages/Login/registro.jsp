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

    <body>
        <div class="d-flex justify-content-md-center align-items-center vh-100">

            <form name="registro" method="POST" action="/CoronaTickets-Web/registro">
                <div class="form-register d-flex justify-content-md-center align-items-center">
                    <h1 class="mb-5">REGISTRAR USUARIO</h1>
                </div>
                <div class="row">
                    <div class="column col-6">
                        <h6 class="mb-2">Datos de usuario</h6>
                        <div class="form-group">
                            <input type="text" class="form-control rounded-pill mb-2" id="inputNickname" name="inputNickname" placeholder="Nickname">
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-control rounded-pill mb-2" id="inputPassword1" name="inputPassword1" placeholder="Contraseña">
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-control rounded-pill mb-2" id="inputPassword2" name="inputPassword2" placeholder="Confirmar contraseña">
                        </div>
                        <div class="form-group">
                            <input type="email" class="form-control rounded-pill mb-2" id="inputEmail1" name="inputEmail1" aria-describedby="emailHelp" placeholder="Nickname/Email">
                        </div>
                    </div>

                    <div class="column col-6 mb-5">
                        <h6 class="mb-2">Datos personales</h6>
                        <div class="form-group">
                            <input type="text" class="form-control rounded-pill mb-2" id="inputNombre" name="inputNombre" placeholder="Nombre">
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control rounded-pill mb-2" id="inputApellido" name="inputApellido"  placeholder="Apellido">
                        </div>
                        <div class="form-group">
                            <div class="input-group border border-secondary rounded-pill mb-2">
                                <input type="date" class="form-control border-0 rounded-pill " placeholder="" id="inputNacimiento" name="inputNacimiento">
                                <span class="input-group-btn">
                                    <button class="btn btn-default" type="">
                                        <i class="bi bi-calendar2-date"></i>
                                    </button>
                                </span>
                            </div>
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
                    <button type="button" id="subir" onclick="abrirModal" class="btn btn-outline-secondary rounded-pill" data-bs-toggle="modal" data-bs-target="#myModal">
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

    </body>

</html>

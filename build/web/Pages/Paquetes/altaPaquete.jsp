<%-- 
    Document   : altaPaquete
    Created on : Oct 20, 2021, 9:04:01 PM
    Author     : pabli
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
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
    <%
        HttpSession objSesion = request.getSession();
        String usuario;
        String imgPerfil;
        if (objSesion.getAttribute("nickname") != null) {%>
            <%@include file="/Pages/Common/HeaderSearchLogeado.jsp" %>
        <%}
        else{%>
            <%@include file="/Pages/Common/HeaderSearch.jsp" %>
        <%}
    %>
    <div class="d-flex justify-content-md-center align-items-center mt-5">

        <form name="altaPaquete" method="POST" action="/CoronaTickets-Web/AltaPaquete">
            <div style="width: 80vh;" class="form-register d-flex justify-content-md-center align-items-center">
                <h1 class="mb-5 text-center">ALTA DE PAQUETE DE ESPECTÁCULOS</h1>
            </div>
            <div class="row">
                <div class="col-6">
                    <div class="form-group ">
                        <input type="text" class="form-control rounded-pill mb-2" id="inputNombre" name="inputNombre" placeholder="Nombre">
                    </div>
                    <textarea class="form-control rounded-3 mb-2" id="inputDescripcion" style="resize: none; " name="inputDescripcion" placeholder="Descripción " rows="6"></textarea>
                </div>

                <div class="col-6">
                    <div class="form-group ">
                        <label for="" class="ps-1">Fecha inicio:</label>
                        <div class="input-group ">
                            <input type="date" class="form-control rounded-pill mb-2 " id="inputFechaInicio" name="inputFechaInicio" placeholder="Fecha inicio">
                            <span class="input-group-append ">
                                <button class="btn btn-outline-secondary bg-white border-0 rounded-pill " style="margin-left: -41px; margin-top: 1.5px; height: 32px " type="button ">
                                    <i class="bi bi-calendar"></i>
                                </button>
                            </span>
                        </div>
                    </div>
                    <div class="form-group ">
                        <label for="" class="ps-1">Fecha fin:</label>
                        <div class="input-group ">
                            <input type="date" class="form-control rounded-pill mb-2 " id="inputFechaFin" name="inputFechaFin" placeholder="Fecha fin">
                            <span class="input-group-append ">
                                <button class="btn btn-outline-secondary bg-white border-0 rounded-pill " style="margin-left: -41px; margin-top: 1.5px; height: 32px " type="button ">
                                    <i class="bi bi-calendar "></i>
                                </button>
                            </span>
                        </div>
                    </div>
                    <div class="input-group ">
                        <input type="number" class="form-control rounded-pill mb-2 " id="inputDescuento" name="inputDescuento" placeholder="Descuento">
                        <span class="input-group-append ">
                            <button class="btn btn-outline-secondary bg-white border-0 rounded-pill " style="margin-left: -41px; margin-top: 1.5px; height: 32px " type="button ">
                                <i class="bi bi-currency-dollar"></i>
                            </button>
                        </span>
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
    <script type="text/javascript">
        $(document).ready(function() {
            $('input[type="file"]').change(function(e){
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
                $('#subir').attr('disabled','disabled');
                $("#spinner-border").append('<div class="spinner-border mb-3 mt-3" role="status"><span class="visually-hidden">Loading...</span></div>');
                $.ajax(settings).done(function(response) {
                    $('#subir').removeAttr('disabled');
                    //console.log(response);
                    var lab = $.parseJSON(response);
                    $(".visually-hidden").remove();
                        $(".spinner-border").remove();
                    //console.log(lab.data.url);
                    //$label.val = response.data.link;
                    //$("#labelImagen").text(lab.data.url);
                    $("#labelImagen").attr("value",lab.data.url);
                });
            });
        });
        
    </script>          
</body>

</html>

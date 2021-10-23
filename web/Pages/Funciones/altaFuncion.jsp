<%-- 
    Document   : altaFuncion
    Created on : Oct 21, 2021, 2:24:12 PM
    Author     : pabli
--%>

<%@page import="java.util.HashMap"%>
<%@page import="Logica.Clases.Plataforma"%>
<%@page import="Logica.Clases.Categoria"%>
<%@page import="java.util.Map"%>
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
    
    <link rel="stylesheet" type="text/css" href="../malihu-custom-scrollbar-plugin-master/jquery.mCustomScrollbar.css" />
    <!--<link rel="stylesheet" href="../malihu-custom-scrollbar-plugin-master/jquery.mCustomScrollbar.css" />-->
    
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="../malihu-custom-scrollbar-plugin-master/jquery.mCustomScrollbar.concat.min.js" crossorigin="anonymous"></script>
    <style>
        body {
            font-family: 'Montserrat', sans-serif;
        }
        /* Custom Scrollbar using CSS */
        .custom-scrollbar-css {
          overflow-y: scroll;
        }

        /* scrollbar width */
        .custom-scrollbar-css::-webkit-scrollbar {
          width: 5px;
        }

        /* scrollbar track */
        .custom-scrollbar-css::-webkit-scrollbar-track {
          background: #eee;
        }

        /* scrollbar handle */
        .custom-scrollbar-css::-webkit-scrollbar-thumb {
          border-radius: 1rem;
          background-color: #00d2ff;
          background-image: linear-gradient(to top, #00d2ff 0%, #3a7bd5 100%);
        }
        
        #content-3{
            height: 20vh;
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
        
        <form name="altaEspectaculo" method="POST" action="/CoronaTickets-Web/AltaFuncion" >
            <div style="width: 80vh;" class="form-register d-flex justify-content-md-center align-items-center">
                <h1 class="mb-5">ALTA DE FUNCIÓN</h1>
            </div>
            <div class="row">
                <div class="col-6">
                    <div class="form-group ">
                        <input type="text" class="form-control rounded-pill mb-2 " id="inputNombre" name="inputNombre" placeholder="Nombre">
                    </div>
                    <div class="form-group row mb-2 justify-content-between">
                        <label for="inputNombre" class="col-sm-5 col-form-label">Fecha de función</label>
                        <div class="col-sm-7">
                            <input type="date" class="form-control rounded-pill" id="inputNombre" value="">
                        </div>
                    </div>
                    <div class="form-group ">
                        <div class="input-group ">
                            <label for="inputHora" class="col-sm-5 col-form-label">Hora de inicio</label>
                            <input type="time" class="form-control rounded-pill mb-2 " id="inputHora" name="inputHora" placeholder="Hora de inicio">
                            <span class="input-group-append ">
                                <button class="btn btn-outline-secondary bg-white border-0 rounded-pill" style="margin-left: -41px; margin-top: 1.5px; height: 32px " type="button "disabled>
                                    <i class="bi bi-clock "></i>
                                </button>
                            </span>
                        </div>
                    </div>
                    
                    <div class="form-group mt-1">
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

                <div class="col-6 " >
                    
                    <div class="row">
                        <h3 class="col-md-12 control-label text-center">
                            Artitas
                        </h3>
                        
                    </div>
                    <div class="container custom-scrollbar-js" id="content-3">
                        <div class="row ">
                            <div class="form-group d-flex justify-content-md-center align-items-center">
                                <label class="col checkbox-inline" for="checkboxes-0">
                                    <input type="checkbox" name="checkboxes" id="checkboxes-0" value="1">
                                    Artista 1
                                </label>
                                <label class="col checkbox-inline" for="checkboxes-1">
                                    <input type="checkbox" name="checkboxes" id="checkboxes-1" value="2">
                                    Artista 2
                                </label>
                                <label class="col checkbox-inline" for="checkboxes-2">
                                    <input type="checkbox" name="checkboxes" id="checkboxes-2" value="3">
                                    Artista 3
                                </label>
                            </div>
                        </div>
                        <div class="row ">
                            <div class="form-group d-flex justify-content-md-center align-items-center">
                                <label class="col checkbox-inline" for="checkboxes-0">
                                    <input type="checkbox" name="checkboxes" id="checkboxes-0" value="1">
                                    Artista 1
                                </label>
                                <label class="col checkbox-inline" for="checkboxes-1">
                                    <input type="checkbox" name="checkboxes" id="checkboxes-1" value="2">
                                    Artista 2
                                </label>
                                <label class="col checkbox-inline" for="checkboxes-2">
                                    <input type="checkbox" name="checkboxes" id="checkboxes-2" value="3">
                                    Artista 3
                                </label>
                            </div>
                        </div>
                        <div class="row ">
                            <div class="form-group d-flex justify-content-md-center align-items-center">
                                <label class="col checkbox-inline" for="checkboxes-0">
                                    <input type="checkbox" name="checkboxes" id="checkboxes-0" value="1">
                                    Artista 1
                                </label>
                                <label class="col checkbox-inline" for="checkboxes-1">
                                    <input type="checkbox" name="checkboxes" id="checkboxes-1" value="2">
                                    Artista 2
                                </label>
                                <label class="col checkbox-inline" for="checkboxes-2">
                                    <input type="checkbox" name="checkboxes" id="checkboxes-2" value="3">
                                    Artista 3
                                </label>
                            </div>
                        </div>
                        <div class="row ">
                            <div class="form-group d-flex justify-content-md-center align-items-center">
                                <label class="col checkbox-inline" for="checkboxes-0">
                                    <input type="checkbox" name="checkboxes" id="checkboxes-0" value="1">
                                    Artista 1
                                </label>
                                <label class="col checkbox-inline" for="checkboxes-1">
                                    <input type="checkbox" name="checkboxes" id="checkboxes-1" value="2">
                                    Artista 2
                                </label>
                                <label class="col checkbox-inline" for="checkboxes-2">
                                    <input type="checkbox" name="checkboxes" id="checkboxes-2" value="3">
                                    Artista 3
                                </label>
                            </div>
                        </div>
                        <div class="row ">
                            <div class="form-group d-flex justify-content-md-center align-items-center">
                                <label class="col checkbox-inline" for="checkboxes-0">
                                    <input type="checkbox" name="checkboxes" id="checkboxes-0" value="1">
                                    Artista 1
                                </label>
                                <label class="col checkbox-inline" for="checkboxes-1">
                                    <input type="checkbox" name="checkboxes" id="checkboxes-1" value="2">
                                    Artista 2
                                </label>
                                <label class="col checkbox-inline" for="checkboxes-2">
                                    <input type="checkbox" name="checkboxes" id="checkboxes-2" value="3">
                                    Artista 3
                                </label>
                            </div>
                        </div>
                        <div class="row ">
                            <div class="form-group d-flex justify-content-md-center align-items-center">
                                <label class="col checkbox-inline" for="checkboxes-0">
                                    <input type="checkbox" name="checkboxes" id="checkboxes-0" value="1">
                                    Artista 1
                                </label>
                                <label class="col checkbox-inline" for="checkboxes-1">
                                    <input type="checkbox" name="checkboxes" id="checkboxes-1" value="2">
                                    Artista 2
                                </label>
                                <label class="col checkbox-inline" for="checkboxes-2">
                                    <input type="checkbox" name="checkboxes" id="checkboxes-2" value="3">
                                    Artista 3
                                </label>
                            </div>
                        </div>
                        <div class="row ">
                            <div class="form-group d-flex justify-content-md-center align-items-center">
                                <label class="col checkbox-inline" for="checkboxes-0">
                                    <input type="checkbox" name="checkboxes" id="checkboxes-0" value="1">
                                    Artista 1
                                </label>
                                <label class="col checkbox-inline" for="checkboxes-1">
                                    <input type="checkbox" name="checkboxes" id="checkboxes-1" value="2">
                                    Artista 2
                                </label>
                                <label class="col checkbox-inline" for="checkboxes-2">
                                    <input type="checkbox" name="checkboxes" id="checkboxes-2" value="3">
                                    Artista 3
                                </label>
                            </div>
                        </div>
                        <div class="row ">
                            <div class="form-group d-flex justify-content-md-center align-items-center">
                                <label class="col checkbox-inline" for="checkboxes-0">
                                    <input type="checkbox" name="checkboxes" id="checkboxes-0" value="1">
                                    Artista 1
                                </label>
                                <label class="col checkbox-inline" for="checkboxes-1">
                                    <input type="checkbox" name="checkboxes" id="checkboxes-1" value="2">
                                    Artista 2
                                </label>
                                <label class="col checkbox-inline" for="checkboxes-2">
                                    <input type="checkbox" name="checkboxes" id="checkboxes-2" value="3">
                                    Artista 3
                                </label>
                            </div>
                        </div>
                        <div class="row ">
                            <div class="form-group d-flex justify-content-md-center align-items-center">
                                <label class="col checkbox-inline" for="checkboxes-0">
                                    <input type="checkbox" name="checkboxes" id="checkboxes-0" value="1">
                                    Artista 1
                                </label>
                                <label class="col checkbox-inline" for="checkboxes-1">
                                    <input type="checkbox" name="checkboxes" id="checkboxes-1" value="2">
                                    Artista 2
                                </label>
                                <label class="col checkbox-inline" for="checkboxes-2">
                                    <input type="checkbox" name="checkboxes" id="checkboxes-2" value="3">
                                    Artista 3
                                </label>
                            </div>
                        </div>
                        <div class="row ">
                            <div class="form-group d-flex justify-content-md-center align-items-center">
                                <label class="col checkbox-inline" for="checkboxes-0">
                                    <input type="checkbox" name="checkboxes" id="checkboxes-0" value="1">
                                    Artista 1
                                </label>
                                <label class="col checkbox-inline" for="checkboxes-1">
                                    <input type="checkbox" name="checkboxes" id="checkboxes-1" value="2">
                                    Artista 2
                                </label>
                                <label class="col checkbox-inline" for="checkboxes-2">
                                    <input type="checkbox" name="checkboxes" id="checkboxes-2" value="3">
                                    Artista 3
                                </label>
                            </div>
                        </div>
                        <div class="row ">
                            <div class="form-group d-flex justify-content-md-center align-items-center">
                                <label class="col checkbox-inline" for="checkboxes-0">
                                    <input type="checkbox" name="checkboxes" id="checkboxes-0" value="1">
                                    Artista 1
                                </label>
                                <label class="col checkbox-inline" for="checkboxes-1">
                                    <input type="checkbox" name="checkboxes" id="checkboxes-1" value="2">
                                    Artista 2
                                </label>
                                <label class="col checkbox-inline" for="checkboxes-2">
                                    <input type="checkbox" name="checkboxes" id="checkboxes-2" value="3">
                                    Artista 3
                                </label>
                            </div>
                        </div>
                        <div class="row ">
                            <div class="form-group d-flex justify-content-md-center align-items-center">
                                <label class="col checkbox-inline" for="checkboxes-0">
                                    <input type="checkbox" name="checkboxes" id="checkboxes-0" value="1">
                                    Artista 1
                                </label>
                                <label class="col checkbox-inline" for="checkboxes-1">
                                    <input type="checkbox" name="checkboxes" id="checkboxes-1" value="2">
                                    Artista 2
                                </label>
                                <label class="col checkbox-inline" for="checkboxes-2">
                                    <input type="checkbox" name="checkboxes" id="checkboxes-2" value="3">
                                    Artista 3
                                </label>
                            </div>
                        </div>
                    </div>
                    
                    
                </div>


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
            $("#content-3").mCustomScrollbar({
              theme: "inset-3-dark"
            });
            
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
                $.ajax(settings).done(function(response) {
                    $('#subir').removeAttr('disabled');
                    //console.log(response);
                    var lab = $.parseJSON(response);
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
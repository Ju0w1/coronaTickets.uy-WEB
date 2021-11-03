<%-- 
    Document   : EditUser
    Created on : 25/10/2021, 06:41:53 PM
    Author     : milto
--%>

<%@page import="Logica.Clases.Artista"%>
<%@page import="Logica.Clases.Paquete"%>
<%@page import="Logica.DataTypes.DTFecha"%>
<%@page import="Logica.Clases.Funcion"%>
<%@page import="java.util.Map"%>
<%@page import="Logica.Clases.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" href="https://i.imgur.com/KXDtCAj.png">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CoronaTickets - Editar Perfil</title>
        <link rel="stylesheet" href="EditUser.css">
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
            String imagen, apellido, nombre, email, nick, bio="", desc="", sitio="";
            DTFecha nacimiento;
            if (request.getAttribute("espectador") != null) {
                Usuario espect = (Usuario) request.getAttribute("espectador");
                imagen = espect.getImagen();
                nombre = espect.getNombre();
                apellido = espect.getApellido();
                nacimiento = espect.getNacimiento();
                email = espect.getEmail();
                nick = espect.getNickname();
                if(imagen.equals("")){
                    imagen = "https://imgur.com/mwpO9Ct.png";
                }
            } else {
                Artista art = (Artista) request.getAttribute("artista");
                imagen = art.getImagen();
                nombre = art.getNombre();
                apellido = art.getApellido();
                nacimiento = art.getNacimiento();
                email = art.getEmail();
                nick = art.getNickname();
                bio = art.getBiografia();
                desc = art.getDescripcion();
                sitio = art.getLinkWeb();
                if(imagen.equals("")){
                    imagen = "https://imgur.com/mwpO9Ct.png";
                }
            }
            System.out.println("La imagen es: \"" + imagen + "\"");
        %>
    </head>
    <body>
        <form action="/CoronaTickets-Web/Usuario" method="post" class="needs-validation" novalidate>
            <div class="container rounded bg-white mt-5 mb-5">
                <div class="row">
                        <div class="col-md-3 border-right">
                            <div class="d-flex flex-column align-items-center text-center p-3 py-5 conteiner-imagen">
                                <img class="card rounded-circle mt-5" width="250" id="a" src="<%=imagen%>" onclick="document.getElementById('inputFile').click();">
                                <span class="font-weight-bold"><%=nick%></span>
                                <input hidden="true" name="data" value="<%=nick%>"/>
                                <span class="text-black-50">
                                    <%=email%>
                                </span>
                                <input hidden="true" name="email" value="<%=email%>"/>
                            </div>
                        </div> 
                        <input hidden="true" type="file" id="inputFile" name="inputFile" placeholder="">
                        <input id="labelImagen" name="urlImagen" type="hidden" value="">
                    <div class="col-md-8 border-right">
                        <div class="p-3 py-5">
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <h4 class="text-right">Datos del Perfil</h4>
                            </div>
                            <div class="row mt-2">
                                <div class="col-md-6"><label>Nombre</label><input type="text" id="validationCustom01" class="form-control" placeholder="Nombre" name="nombre" value="<%=nombre%>" required></div>
                                <div class="invalid-feedback mb-2">Campo inválido.</div>
                                <div class="col-md-6"><label>Apellido</label><input type="text" id="validationCustom02" class="form-control" name="apellido" value="<%=apellido%>" placeholder="Apellido" required></div>
                                <div class="invalid-feedback mb-2">Campo inválido.</div>
                            </div>
                            <div class="row mt-2">
                                
                                <%    
                                    String dia = String.valueOf(nacimiento.getDia()); 
                                    String mes = String.valueOf(nacimiento.getMes()); 
                                    if(nacimiento.getDia()<10){
                                        dia = "0" + nacimiento.getDia();
                                    }
                                    if (nacimiento.getMes()<10){
                                        mes = "0" + nacimiento.getMes();
                                    }
                                    String fechaFinal = nacimiento.getAnio() + "-" + mes + "-" + dia;
                                    
                                %>
                                <div class="col-md-6"><label>Fecha de nacimiento</label><input type="date" class="form-control" name="fecha"  min="1950-01-01" max="2003-01-01" value="<%=fechaFinal%>" required></div>                                
                                <div id="respuestaFI" class="invalid-feedback mb-2">Campo inválido.</div>
                                <%
                                    if (request.getAttribute("espectador") == null) {%>
                                <div class="col-md-6"><label>Sitio Web</label><input type="text" class="form-control" placeholder="https://example.com" name="sitio" value="<%=sitio%>"></div>
                                <%
                                    } 
                                %>
                            </div>
                            <div class="row mt-3">
                                <%
                                    if (request.getAttribute("espectador") == null) {%>
                                        <div class="col-md-12"><label>Descripcion</label><input type="text" class="form-control" placeholder="Descripcion" name="descripcion" value="<%=desc%>" required></div>
                                        
                                        <div class="col-md-12">
                                            <div class="about-inputs "> <label>Biografia</label> <textarea id="bio" rows="8" class="form-control" type="text" placeholder="Biografia" required><%=bio%></textarea>
                                                <input id="bioinput" type="text" hidden="true" name="bio" value="">
                                            </div>
                                        </div>
                                        <input name="esArtista" value="1" hidden="true"/>
                                <%
                                    } else { %>
                                        <input name="esEspectador" value="1" hidden="true"/>
                                <%
                                    }
                                %>
                            </div>
                            <div class="mt-5 text-center">
                                <button class="btn btn-primary profile-button" onclick="document.getElementById('bioinput').value = $('#bio').val();" type="submit">Guardar Perfil</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script>
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
                $(".conteiner-imagen").append('<div class="spinner-border" role="status"><span class="visually-hidden">Loading...</span></div>');
                $.ajax(settings).done(function(response) {
                    $('#subir').removeAttr('disabled');
                    $(".visually-hidden").remove();
                    $(".spinner-border").remove();
                    console.log(response);
                    var lab = $.parseJSON(response);
                    //console.log(lab.data.url);
                    //$label.val = response.data.link;
                    //$("#labelImagen").text(lab.data.url);
                    $("#labelImagen").attr("value",lab.data.url);
                    $("#a").attr("src",lab.data.url);
                });
            });
        });              
        </script>           
        <script>
            $(document).ready(function () {
                $('form').on('submit', function (e) {
                    // validation code here
                    let nombre = document.getElementById('validationCustom01').value;
                    let apellido = document.getElementById('validationCustom02').value;
                   
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

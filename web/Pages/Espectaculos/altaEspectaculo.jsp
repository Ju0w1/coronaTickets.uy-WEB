
<%@page import="java.util.HashMap"%>
<%@page import="Logica.Clases.Plataforma"%>
<%@page import="Logica.Clases.Categoria"%>
<%@page import="java.util.Map"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>

    <!DOCTYPE html>
<html lang="en">

<head>
    <link rel="icon" href="https://i.imgur.com/KXDtCAj.png">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CoronaTickets - Crear Espectáculo</title>
    <!-- CSS only -->
    <!-- 
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
     -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link href="http://localhost:8080/CoronaTickets-Web/Pages/malihu-custom-scrollbar-plugin-master/jquery.mCustomScrollbar.css" rel="stylesheet" type="text/css"/>
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
            height: 10vh;
        }
        .error{
            outline: 1px solid red;
        }  
    </style>
    <script>
        function abrirModal() {
            var myModal = new bootstrap.Modal(document.getElementById("myModal"));
            myModal.show();
        }
        function myValidation() {
            var algunoVacio = false;
            if (!$('#inputNombre').val()) {
                $('#inputNombre').addClass("error");
                algunoVacio = true;
            }else{
                $('#inputNombre').removeClass("error");
            }
            // ----------------------------------- //
            if (!$('#inputDescripcion').val()) {
                $('#inputDescripcion').addClass("error");
                algunoVacio = true;
            }else{
                $('#inputDescripcion').removeClass("error");
            }
            // ----------------------------------- //
            if (!$('#inputDuracion').val()) {
                $('#inputDuracion').addClass("error");
                algunoVacio = true;
            }else{
                $('#inputDuracion').removeClass("error");
            }
            // ----------------------------------- //
            if (!$('#inputEspecMin').val()) {
                $('#inputEspecMin').addClass("error");
                algunoVacio = true;
            }else{
                $('#inputEspecMin').removeClass("error");
                if(!$('#inputEspecMax').val() && $('#inputEspecMin').val() >= $('#inputEspecMax').val()){
                    alert('El campo Espectadores mínimos debe ser menor que el campo Espectadóres máxmios');
                    $('#inputEspecMin').addClass("error");
                    $('#inputEspecMax').addClass("error");
                }else{
                    $('#inputEspecMin').removeClass("error");
                    $('#inputEspecMax').removeClass("error");
                }
            }
            // ----------------------------------- //
            if (!$('#inputEspecMax').val()) {
                $('#inputEspecMax').addClass("error");
                algunoVacio = true;
            }else{
                $('#inputEspecMin').removeClass("error");
                if(!$('#inputEspecMin').val() && $('#inputEspecMin').val() >= $('#inputEspecMax').val()){
                    alert('El campo Espectadores mínimos debe ser menor que el campo Espectadóres máxmios');
                    $('#inputEspecMin').addClass("error");
                    $('#inputEspecMax').addClass("error");
                }else{
                    $('#inputEspecMin').removeClass("error");
                    $('#inputEspecMax').removeClass("error");
                }
            }
            // ----------------------------------- //
            if (!$('#inputURL').val()) {
                $('#inputURL').addClass("error");
                algunoVacio = true;
            }else{
                $('#inputURL').removeClass("error");
            }
            // ----------------------------------- //
            if (!$('#inputCosto').val()) {
                $('#inputCosto').addClass("error");
                algunoVacio = true;
            }else{
                $('#inputCosto').removeClass("error");
            }
            // ----------------------------------- //
            if (!$('#inputFile').val()) {
                $('#inputFile').addClass("error");
                algunoVacio = true;
            }else{
                $('#inputFile').removeClass("error");
            }
            if(algunoVacio){
                
                alert('Complete los campos obligatorios señalados con "*"');
                algunoVacio = false;
                return false;
            }else{
               
                return true;
            }
            // ----------------------------------- //

        };
    </script>
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
        
        <form name="altaEspectaculo" onsubmit = "event.preventDefault(); myValidation();" id="formEspec" method="POST" action="/CoronaTickets-Web/AltaEspectaculo" >
            <div style="width: 80vh;" class="form-register d-flex justify-content-md-center align-items-center">
                <h1 class="mb-5">ALTA DE ESPECTÁCULO</h1>
            </div>
            <div class="row">
                <div class="col-6">
                    <div class="form-group ">
                        <input type="text" class="form-control rounded-pill mb-2 " id="inputNombre" name="inputNombre" placeholder="Nombre *">
                    </div>
                    <textarea class="form-control rounded-3 mb-2" id="inputDescripcion" name="inputDescripcion" style="resize: none; " placeholder="Descripción *" rows="2 "></textarea>
                    <div class="form-group ">
                        <div class="input-group ">
                            <input type="number" class="form-control rounded-pill mb-2 " id="inputDuracion" name="inputDuracion" placeholder="Duración(minutos) *">
                            <span class="input-group-append ">
                                <button class="btn btn-outline-secondary bg-white border-0 rounded-pill " style="margin-left: -41px; margin-top: 1.5px; height: 32px " type="button "disabled>
                                    <i class="bi bi-clock "></i>
                                </button>
                            </span>
                        </div>
                    </div>
                    <div class="form-group mt-1">
                        <div class="row">
                            <div class="col">
                                <select class="form-select" name="plataforma" aria-label="Plataformas">
                                    <option selected>Plataforma *</option>
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
                                    <option value="<%=key%>" id="<%=key%>"><%=key%></option>
                                    <%
                                                i++;
                                            }
                                        }
                                    %>
                                </select>
                            </div>
                                <div class="col content-3" id="content-3">
                                <h4 class="form-check-label align-items-center" for="flexCheckDefault">Categoria/s *</h4>
                                    <%
                                    Map<String, Categoria> categorias = (Map<String, Categoria>) request.getAttribute("categorias");
                                    if(plataformas == null){
                                        System.out.println("VACIO");
                                    }else{
                                        for (Map.Entry<String, Categoria> entry : categorias.entrySet()) {
                                            String key2 = entry.getKey();
                                            Categoria value2 = entry.getValue();

                                %>

                                <div class="row ms-3">
                                    <div class="form-check">
                                        <input class="form-check-input" name="categoria" type="checkbox" value="<%=value2.getNombre()%>" >
                                        <label class="form-check-label" for="flexCheckDefault">
                                          <%=value2.getNombre()%>
                                        </label>
                                    </div>
                                </div>
                                <%
                                        }
                                    }
                                %>
                                
                                
                            </div>

                        </div>
                    </div>
                </div>

                <div class="col-6">
                    <div class="input-group ">
                        <input type="number" class="form-control rounded-pill mb-2 " id="inputEspecMin" name="inputEspecMin" placeholder="Espectadores mínimos *">
                        <span class="input-group-append ">
                            <button class="btn btn-outline-secondary bg-white border-0 rounded-pill " style="margin-left: -41px; margin-top: 1.5px; height: 32px " type="button "disabled>
                                <i class="bi bi-person-fill "></i>
                            </button>
                        </span>
                    </div>
                    <div class="input-group ">
                        <input type="number " class="form-control rounded-pill mb-2 " id="inputEspecMax" name="inputEspecMax" placeholder="Espectadores máximos *">
                        <span class="input-group-append ">
                            <button class="btn btn-outline-secondary bg-white border-0 rounded-pill " style="margin-left: -41px; margin-top: 1.5px; height: 32px " type="button "disabled>
                                <i class="bi bi-person-fill "></i>
                            </button>
                        </span>
                    </div>
                    <div class="input-group">
                        <input type="url " class="form-control rounded-pill mb-2 " id="inputURL" name="inputURL" placeholder="URL *">
                        <span class="input-group-append ">
                            <button class="btn btn-outline-secondary bg-white border-0 rounded-pill " style="margin-left: -41px; margin-top: 1.5px; height: 32px " type="button "disabled>
                                <i class="bi bi-link-45deg "></i>
                            </button>
                        </span>
                    </div>
                    <div class="input-group">
                        <input type="number" step="0.01" class="form-control rounded-pill mb-2 " id="inputCosto" name="inputCosto" placeholder="Costo *">
                        <span class="input-group-append ">
                            <button class="btn btn-outline-secondary bg-white border-0 rounded-pill " style="margin-left: -41px; margin-top: 1.5px; height: 32px " type="button "disabled>
                                <i class="bi bi-currency-dollar "></i>
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
                                
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="http://localhost:8080/CoronaTickets-Web/Pages/malihu-custom-scrollbar-plugin-master/jquery.mCustomScrollbar.concat.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        
        $(document).ready(function() {
            $('#formEspec input').blur(function(){
                if(!$(this).val()){
                    $(this).addClass("error");
                } else{
                    $(this).removeClass("error");
                }
            });
            $('#formEspec textarea').blur(function(){
                if(!$(this).val()){
                    $(this).addClass("error");
                } else{
                    $(this).removeClass("error");
                }
            });
            
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
                $("#spinner-border").append('<div class="spinner-border" role="status"><span class="visually-hidden">Loading...</span></div>');
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
                });
            });
        });
        
    </script>                                       
</body>

</html>
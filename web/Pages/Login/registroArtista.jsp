<%-- 
    Document   : registroArtista
    Created on : Oct 13, 2021, 12:05:17 PM
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
        <title>CoronaTickets - Registrarse como Artista</title>
        <!-- CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700&display=swap" rel="stylesheet">
        <style>
            body {
                font-family: 'Montserrat', sans-serif;
            }
        </style>
    </head>
    <%
        HttpSession objSesion = request.getSession();
        String rnick = (String) request.getAttribute("rnick");
        String rpass1 = (String) request.getAttribute("rpass1");
        String remail = (String) request.getAttribute("remail");
        String rnombre = (String) request.getAttribute("rnombre");
        String rapellido = (String) request.getAttribute("rapellido");
        String rdate = (String) request.getAttribute("rdate");
        String rimagen = (String) request.getAttribute("rimagen");
    %>
    
    <body>
        <div class="d-flex justify-content-md-center align-items-center vh-100">

            <form name="registroArtista" method="POST" action="/CoronaTickets-Web/registroartista" class="needs-validation" novalidate>
                <input type="hidden" name="rnick" value="<%=rnick%>" />
                <input type="hidden" name="rpass1" value="<%=rpass1%>" />
                <input type="hidden" name="remail" value="<%=remail%>" />
                <input type="hidden" name="rnombre" value="<%=rnombre%>" />
                <input type="hidden" name="rapellido" value="<%=rapellido%>" />
                <input type="hidden" name="rdate" value="<%=rdate%>" />
                <input type="hidden" name="rimagen" value="<%=rimagen%>" />
                <div class="form-register d-flex justify-content-md-center align-items-center">
                    <h1 class="mb-5">REGISTRAR USUARIO</h1>
                </div>
                <div class="column col-12">
                    <h6 class="mb-2">Datos de artista: </h6>
                    <h6 class="mb-2" name="Nickname">
                        <%
                            String usuario = objSesion.getAttribute("nickname").toString();
                            out.print(usuario);
                        %></h6>

                    <textarea class="form-control rounded-3 mb-2" id="validationCustom01" name="inputDescripcion" style="resize: none; " placeholder="Descripción " rows="3" required></textarea>
                    <div class="invalid-feedback">La descripción es un campo obligatorio.</div>
                    <textarea class="form-control rounded-3 mb-2" id="inputBiografia" name="inputBiografia" style="resize: none; " placeholder="Biografía " rows="3"></textarea>
                    <div class="form-group">
                        <input type="url" class="form-control rounded-pill mb-2" name="inputUrl" id="inputEmail1" aria-describedby="URL" placeholder="WEB">
                    </div>
                </div>
                <div class="form-register d-flex justify-content-md-center align-items-center mt-5">
                    <button type="submit" class="btn btn-outline-secondary rounded-pill">
                        Finalizar
                    </button>
                </div>
            </form>
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

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
    </body>

</html>

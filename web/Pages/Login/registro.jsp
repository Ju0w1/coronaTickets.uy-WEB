<%-- 
    Document   : registro
    Created on : Oct 1, 2021, 2:28:33 PM
    Author     : pabli
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
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
                    <div class="form-group">
                        <input type="url" class="form-control rounded-pill mb-2" id="inputImagenPerfil" name="inputImagenPerfil" placeholder="Imagen de perfil">
                    </div>


                </div>


            </div>
            <div class="form-register d-flex justify-content-md-center align-items-center">
                <button type="submit" class="btn btn-outline-secondary rounded-pill">
                    Registrate
                </button>
            </div>

        </form>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
</body>

</html>

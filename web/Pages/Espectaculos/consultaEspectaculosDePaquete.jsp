<%-- 
    Document   : consultaEspectaculosDePaquete
    Created on : Oct 6, 2021, 5:59:49 PM
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
    <%@include file="/Pages/Common/HeaderMain.jsp" %>
    <div class="d-flex justify-content-md-center align-items-center vh-100 ">
        <div class="container" style="width: 100vh;">
            <div class="row">
                <div class="col-12 d-flex justify-content-md-center">
                    <h1 class="mb-5">ESPECTÁCULOS DEL PAQUETE "NOMBRE"</h1>
                </div>
            </div>
            <div class="row mb-3">
                <div class="d-flex justify-content-md-center align-items-center">
                    <div class="col-3 d-flex justify-content-md-center">
                        <select class="form-select" aria-label="Default select example">
                            <option selected>Espectáculos</option>
                            <option value="1">One</option>
                            <option value="2">Two</option>
                            <option value="3">Three</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-6">
                    <form class="p-2">
                        <div class="form-group row mb-2 justify-content-between">
                            <label for="inputNombre" class="col-sm-2 col-form-label">Nombre</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="inputNombre" placeholder="" readonly>
                            </div>
                        </div>
                        <div class="form-group row mb-2 justify-content-between">
                            <label for="inputNombre" class="col-sm-2 col-form-label">Descripción</label>
                            <div class="col-sm-8">
                                <textarea class="form-control rounded-3" id="inputDescripcion " style="resize: none; " placeholder="Descripción " rows="2 " readonly></textarea>
                            </div>
                        </div>
                        <div class="form-group row mb-2 justify-content-between">
                            <label for="inputNombre" class="col-sm-2 col-form-label">Organizador</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="inputNombre" placeholder="" readonly>
                            </div>
                        </div>
                        <div class="form-group row mb-2 justify-content-between">
                            <label for="inputNombre" class="col-sm-4 col-form-label">Duración</label>
                            <div class="col-sm-8">
                                <input type="time" class="form-control" id="inputNombre" placeholder="" readonly>
                            </div>
                        </div>
                        <div class="form-group row mb-2 justify-content-between">
                            <label for="inputNombre" class="col-sm-8 col-form-label">Cantidad mínima de espectadores</label>
                            <div class="col-sm-4">
                                <input type="number" class="form-control" id="inputNombre" placeholder="" readonly>
                            </div>
                        </div>
                        <div class="form-group row mb-2 justify-content-between">
                            <label for="inputNombre" class="col-sm-8 col-form-label">Cantidad máxima de espectadores</label>
                            <div class="col-sm-4">
                                <input type="number" class="form-control" id="inputNombre" placeholder="" readonly>
                            </div>
                        </div>
                    </form>

                </div>
                <div class="col-6 p-2">
                    <div class="form-group row mb-2 justify-content-between">
                        <label for="inputNombre" class="col-sm-2 col-form-label">URL</label>
                        <div class="col-sm-10">
                            <input type="url" class="form-control" id="inputNombre" placeholder="" readonly>
                        </div>
                    </div>
                    <div class="form-group row mb-2 justify-content-between">
                        <label for="inputNombre" class="col-sm-5 col-form-label">Fecha de registro</label>
                        <div class="col-sm-7">
                            <input type="date" class="form-control" id="inputNombre" placeholder="" readonly>
                        </div>
                    </div>
                    <div class="form-group row mb-2 justify-content-between">
                        <label for="inputNombre" class="col-sm-2 col-form-label">Costo</label>
                        <div class="col-sm-10">
                            <input type="number" class="form-control" id="inputNombre" placeholder="" readonly>
                        </div>
                    </div>
                    <div class="w-100 h-50 d-flex justify-content-md-center align-items-center" style="background-color: #eee;">Imagen</div>
                </div>
            </div>
            <div class="row mt-5">
                <div class="col-12 d-flex justify-content-md-center">
                    <button type="submit " class="btn btn-outline-secondary rounded-pill ">
                        VOLVER
                    </button>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js " integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj " crossorigin="anonymous "></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js " integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN " crossorigin="anonymous "></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js " integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF " crossorigin="anonymous "></script>
</body>

</html>

<%-- 
    Document   : Funciones-list
    Created on : 09/10/2021, 12:13:41 PM
    Author     : milto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LIST FUNCIONES</title>
    <link rel="stylesheet" href="Funciones-list.css">
    <script async="" defer="" src="https://buttons.github.io/buttons.js"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.js"
        integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous"> </script>
    <script>
        $(function () {
            $("#header").load("Pages/Common/Header2.jsp");
        });
    </script>
</head>

<body>
    <div id="header"></div>
    <br>
    <h3 style="text-align: center;">
        CONSULTA DE FUNCIÓN:
    </h3>
        <div class="container">
            <div class="row">
                <div class="col-2">
                    <h3>
                        Filtrar por:
                    </h3>
                </div>
                <div class="col-2">
                    <div class="dropdown">
                        <select aria-label="Default select example"
                            style="height: 42px; font-size: large; border-color: rgb(226, 227, 236); border-radius: 5%; background-color: #fafafa;">
                            <option selected>Categorias</option>
                            <option value="1">Categoria 1</option>
                            <option value="2">Categoria 2</option>
                            <option value="3">Categoria 3</option>
                        </select>
                    </div>
                </div>
                <div class="col-2">
                    <div class="dropdown">
                        <select aria-label="Default select example"
                            style="height: 42px; font-size: large; border-color: rgb(226, 227, 236); border-radius: 5%; background-color: #fafafa;">
                            <option selected>Plataformas</option>
                            <option value="1">Twitch</option>
                            <option value="2">YouTube</option>
                            <option value="3">Facebook</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="col-4">
            </div>
        </div>
    <div class="container">
        <div class="row">
            <div class="col-lg-6">
                <br> <br>
                <div class="articles card">
                    <div class="card-header d-flex align-items-center">
                        <h2 class="h3">Espectaculos</h2>
                    </div>
                    <!--ESPECTACULOS-->
                    <div class="card-body no-padding">
                        <!--ESPECTACULO-EJEMPLO-->
                        <div class="item d-flex align-items-center">
                            <!--IMAGEN-->
                            <div class="image"><img src="https://thumbs.dreamstime.com/z/carnaval-del-cartel-con-las-m%C3%A1scaras-de-la-mascarada-aisladas-en-fondo-ve-108720610.jpg"
                                alt="fotoPerfil" class="img-thumbnail" style="height: 100px ;width: 100px;"></div>
                                <div class="text"><a href="#">
                                    <!--NOMBRE-->
                                    <h3 class="h5">Carnaval</h3>
                                </a>
                                <!--PLATAFORMA-->
                                <small>Twitch</small><br>
                                <!--PRECIO-->
                                <small>$500</small>
                            </div>
                        </div>
                        <!--ESPECTACULO-EJEMPLO-->
                        <div class="item d-flex align-items-center">
                            <!--IMAGEN-->
                            <div class="image"><img src="https://pbs.twimg.com/media/D-TzSqUXkAI2Tmw.jpg"
                                alt="fotoPerfil" class="img-thumbnail" style="height: 100px ;width: 100px;"></div>
                                <div class="text"><a href="#">
                                    <!--NOMBRE-->
                                    <h3 class="h5">Viña del Mar</h3>
                                </a>
                                <!--PLATAFORMA-->
                                <small>Instagram</small><br>
                                <!--PRECIO-->
                                <small>$500</small>
                            </div>
                        </div>
                        <!--ESPECTACULO-EJEMPLO-->
                        <div class="item d-flex align-items-center">
                            <!--IMAGEN-->
                            <div class="image"><img src="https://www.eltiempo.com/files/image_640_428/uploads/2021/05/03/60904eaa310f4.jpeg"
                                alt="fotoPerfil" class="img-thumbnail" style="height: 100px ;width: 100px;"></div>
                                <div class="text"><a href="#">
                                    <!--NOMBRE-->
                                    <h3 class="h5">Concierto Gira</h3>
                                </a>
                                <!--PLATAFORMA-->
                                <small>Facebook</small><br>
                                <!--PRECIO-->
                                <small>$500</small>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <br> <br>
                <div class="articles card">
                    <div class="card-header d-flex align-items-center">
                        <h2 class="h3">Funciones</h2>
                    </div>
                    <!--FUNCIONES-->
                    <div class="card-body no-padding">
                        <!--FUNCION-EJEMPLO-->
                        <div class="item d-flex align-items-center">
                            <!--IMAGEN-->
                            <div class="image"><img src="https://sc2.elpais.com.uy/files/article_main/uploads/2018/01/25/5a6a82b9c13ba.jpeg"
                                alt="fotoPerfil" class="img-thumbnail" style="height: 100px ;width: 100px;"></div>
                                <div class="text"><a href="#">
                                    <!-- NOMBRE -->
                                    <h3 class="h5">El Entierro</h3>
                                </a>
                                <!--FECHA-->
                                <small>04/01/2022</small><br>
                                <!--HORA-->
                                <small>22:00</small>
                            </div>
                        </div>
                        <!--FUNCION-EJEMPLO-->
                        <div class="item d-flex align-items-center">
                            <!--IMAGEN-->
                            <div class="image"><img src="https://fotos.perfil.com/2019/04/04/trim/1040/780/20190404-agarrate-catalina-656295.jpg"
                                alt="fotoPerfil" class="img-thumbnail" style="height: 100px ;width: 100px;"></div>
                                <div class="text"><a href="#">
                                    <!-- NOMBRE -->
                                    <h3 class="h5">Tablado</h3>
                                </a>
                                <!--FECHA-->
                                <small>06/02/2022</small><br>
                                <!--HORA-->
                                <small>21:30</small>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

</html>

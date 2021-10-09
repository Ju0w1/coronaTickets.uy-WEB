<%-- 
    Document   : Users-list
    Created on : 09/10/2021, 10:50:18 AM
    Author     : milto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>LIST USER</title>
   <link rel="stylesheet" href="User-list.css">
   <script async="" defer="" src="https://buttons.github.io/buttons.js"></script>
   <script src="https://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
      crossorigin="anonymous"> </script>
   <script>
      $(function () {
         $("#header").load("Pages/Common/Header2.jsp");
      });
   </script>
</head>

<body>
   <div id="header"></div>
   <br>
   <div class="container">
      <div class="row">
         <div class="col-lg-6">
            <br> <br>
            <div class="articles card">
               <div class="card-header d-flex align-items-center">
                  <h2 class="h3">Artistas</h2>
               </div>
               <!--ARTISTAS-->
               <div class="card-body no-padding">
                  <!--USUARIO-->
                  <div class="item d-flex align-items-center">
                     <div class="image"><img src="https://bootdey.com/img/Content/avatar/avatar2.png" alt="fotoPerfil"
                           class="img-fluid rounded-circle"></div>
                     <div class="text"><a href="#">
                           <h3 class="h5">Facu</h3>
                        </a><small>Facundo@gmail.com</small>
                     </div>
                  </div>
                  <!--USUARIO-->
                  <div class="item d-flex align-items-center">
                     <div class="image"><img src="https://bootdey.com/img/Content/avatar/avatar3.png" alt="fotoPerfil"
                           class="img-fluid rounded-circle"></div>
                     <div class="text"><a href="#">
                           <h3 class="h5">JuanPa</h3>
                        </a><small>Pablo.Juan@gmail.com</small>
                     </div>
                  </div>
                  <!--USUARIO-->
                  <div class="item d-flex align-items-center">

                     <div class="image"><img src="https://bootdey.com/img/Content/avatar/avatar4.png" alt="fotoPerfil"
                           class="img-fluid rounded-circle"></div>
                     <div class="text"><a href="#">
                           <h3 class="h5"> Dieter </h3>
                        </a><small>Dieter@crack.com</small>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         <div class="col-lg-6">
            <br> <br>
            <div class="articles card">
               <div class="card-header d-flex align-items-center">
                  <h2 class="h3">Espectadores</h2>
               </div>
               <!--ESPECTADORES-->
               <div class="card-body no-padding">
                  <!--USUARIO-->
                  <div class="item d-flex align-items-center">

                     <div class="image"><img src="https://bootdey.com/img/Content/avatar/avatar6.png" alt="fotoPerfil"
                           class="img-fluid rounded-circle"></div>
                     <div class="text"><a href="#">
                           <h3 class="h5">Milton</h3>
                        </a><small>milton.ayala@gmail.com</small></div>
                  </div>
                  <!--USUARIO-->
                  <div class="item d-flex align-items-center">
                     <div class="image"><img src="https://bootdey.com/img/Content/avatar/avatar5.png" alt="fotoPerfil"
                           class="img-fluid rounded-circle"></div>
                     <div class="text"><a href="#">
                           <h3 class="h5">FedeR</h3>
                        </a><small>Federkiller@gmail.com</small>
                     </div>
                  </div>
                  <!--USUARIO-->
                  <div class="item d-flex align-items-center">
                     <div class="image"><img src="https://bootdey.com/img/Content/avatar/avatar6.png" alt="fotoPerfil"
                           class="img-fluid rounded-circle"></div>
                     <div class="text"><a href="#">
                           <h3 class="h5"> Dávila </h3>
                        </a><small>Rafa.davila@hotmail.com</small></div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</body>

</html>

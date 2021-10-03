<%-- 
    Document   : login
    Created on : Oct 1, 2021, 10:45:14 AM
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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Montserrat', sans-serif;
        }
    </style>
    <title>Log in</title>
    <script>

            function enviarDatos() {
                let user = document.getElementById("user");
                let password = document.getElementById("password");
            }

            function abrirModal(){
                $("#myModal").modal("show");
            }
            
            function test(){
                alert("Hello"); // added sample text
            }
    </script>
</head>

<body>
    <div class="d-flex justify-content-md-center align-items-center vh-100">

        <form name="login" method="POST" action="/CoronaTickets-Web/login" >
            <h1 class="mb-5">INICIAR SESIÓN</h1>
            <div class="form-group">
                <input type="text" name="user" class="form-control rounded-pill mb-2" id="user" placeholder="Nickname/Email">
            </div>
            <div class="form-group">
                <input type="password" name="password" class="form-control rounded-pill mb-4" id="password" placeholder="Contraseña">
            </div>
            <div class="d-flex justify-content-md-center align-items-center">
                <button type="submit" id="login" onclick="enviarDatos" class="btn btn-secondary rounded-pill mb-4">
                    Ingresar
                    <i class="bi bi-chevron-right"></i>
                </button>
            </div>
            <div class="form-register d-flex justify-content-md-center align-items-center">
                <small id="emailHelp" class="form-text text-muted mb-1">Si no tienes cuenta</small>
            </div>
            <div class="form-register d-flex justify-content-md-center align-items-center">
                <button type="registro" class="btn btn-outline-secondary rounded-pill">
                    Registrate
                </button>
            </div>

        </form>
    </div>
    
    <div id="myModal" class="modal fade" role="dialog">
        <div class="modal-dialog">

          <!-- Modal content-->
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal">&times;</button>
              <h4 class="modal-title">Modal Header</h4>
            </div>
            <div class="modal-body">
              <p>error</p>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
          </div>

        </div>
      </div>

    
    
    <%
        //MODAL PARA ERRORES
        String error = (String) request.getAttribute("error");
        System.out.println(error);
        if (error != "") {
    %>
        
    <script>
        abrirModal(); 
    </script>
    <%
        }
    %>
    
    
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
</body>

</html>

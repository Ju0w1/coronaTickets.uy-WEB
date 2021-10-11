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
    
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700&display=swap" rel="stylesheet">
    
    
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>


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
                var myModal = new bootstrap.Modal(document.getElementById("myModal"));
                myModal.show();
            }
            
            function test(){
                alert("Hello"); // added sample text
            }
    </script>
</head>

<body>
    <div class="d-flex justify-content-md-center align-items-center vh-100">
        
        <form name="login" method="POST" action="/CoronaTickets-Web/login">
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
    
    <div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <!-- Modal content-->
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel">Error</h5>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
              <p>${error}</p>
            </div>
          </div>

        </div>
     </div>
    
    
    <%
        //MODAL PARA ERRORES
        String error = (String) request.getAttribute("error");
        System.out.println(error);
        if (error != null) {
    %>
       
    <script>
        abrirModal(); 
    </script>
    <%
        }
    %>
    
    
    
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>

</html>


<%@page import="java.util.HashMap"%>
<%@page import="Logica.Clases.Plataforma"%>
<%@page import="Logica.Clases.Categoria"%>
<%@page import="java.util.Map"%>
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
    <%@include file="/Pages/Common/Header2.jsp" %>
    <div class="d-flex justify-content-md-center align-items-center mt-5">

        <form name="altaEspectaculo" method="POST" action="/CoronaTickets-Web/AltaEspectaculo" >
            <div style="width: 80vh;" class="form-register d-flex justify-content-md-center align-items-center">
                <h1 class="mb-5">ALTA DE ESPECTÁCULO</h1>
            </div>
            <div class="row">
                <div class="col-6">
                    <div class="form-group ">
                        <input type="text" class="form-control rounded-pill mb-2 " id="inputNombre" name="inputNombre" placeholder="Nombre ">
                    </div>
                    <textarea class="form-control rounded-3 mb-2" id="inputDescripcion" name="inputDescripcion" style="resize: none; " placeholder="Descripción " rows="2 "></textarea>
                    <div class="form-group ">
                        <div class="input-group ">
                            <input type="number" class="form-control rounded-pill mb-2 " id="inputDuracion" name="inputDuracion" placeholder="Duración(minutos)">
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
                                    <option selected>Plataformas</option>
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
                                    <option value="<%=i%>" id="<%=key%>"><%=key%></option>
                                    <%
                                                i++;
                                            }
                                        }
                                    %>
                                </select>
                            </div>
                            <div class="col">
                                <div class="row">
                                    <%
                                    Map<String, Categoria> categorias = (Map<String, Categoria>) request.getAttribute("categorias");
                                    if(plataformas == null){
                                        System.out.println("VACIO");
                                    }else{
                                        for (Map.Entry<String, Categoria> entry : categorias.entrySet()) {
                                            String key2 = entry.getKey();
                                            Categoria value2 = entry.getValue();

                                %>


                                <div class="form-check">
                                    <input class="form-check-input" name="categoria" type="checkbox" value="<%=value2.getNombre()%>" >
                                    <label class="form-check-label" for="flexCheckDefault">
                                      <%=value2.getNombre()%>
                                    </label>
                                </div>
                                <%
                                        }
                                    }
                                %>
                                </div>
                                
                            </div>

                        </div>
                    </div>
                </div>

                <div class="col-6">
                    <div class="input-group ">
                        <input type="number" class="form-control rounded-pill mb-2 " id="inputEspecMin" name="inputEspecMin" placeholder="Espectadores mínimos ">
                        <span class="input-group-append ">
                            <button class="btn btn-outline-secondary bg-white border-0 rounded-pill " style="margin-left: -41px; margin-top: 1.5px; height: 32px " type="button "disabled>
                                <i class="bi bi-person-fill "></i>
                            </button>
                        </span>
                    </div>
                    <div class="input-group ">
                        <input type="number " class="form-control rounded-pill mb-2 " id="inputEspecMax" name="inputEspecMax" placeholder="Espectadores máximos ">
                        <span class="input-group-append ">
                            <button class="btn btn-outline-secondary bg-white border-0 rounded-pill " style="margin-left: -41px; margin-top: 1.5px; height: 32px " type="button "disabled>
                                <i class="bi bi-person-fill "></i>
                            </button>
                        </span>
                    </div>
                    <div class="input-group">
                        <input type="url " class="form-control rounded-pill mb-2 " id="inputURL" name="inputURL" placeholder="URL">
                        <span class="input-group-append ">
                            <button class="btn btn-outline-secondary bg-white border-0 rounded-pill " style="margin-left: -41px; margin-top: 1.5px; height: 32px " type="button "disabled>
                                <i class="bi bi-link-45deg "></i>
                            </button>
                        </span>
                    </div>
                    <div class="input-group">
                        <input type="number" step="0.01" class="form-control rounded-pill mb-2 " id="inputCosto" name="inputCosto" placeholder="Costo">
                        <span class="input-group-append ">
                            <button class="btn btn-outline-secondary bg-white border-0 rounded-pill " style="margin-left: -41px; margin-top: 1.5px; height: 32px " type="button "disabled>
                                <i class="bi bi-currency-dollar "></i>
                            </button>
                        </span>
                    </div>
                    <label for="altaEspectaculo" class="form-label">URL de imagen (Opcional):</label>
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
            <div class="form-register mt-5 d-flex justify-content-md-center align-items-center ">
                <button type="submit" class="btn btn-outline-secondary rounded-pill ">
                    CREAR
                </button>
            </div>

        </form>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js " integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj " crossorigin="anonymous "></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js " integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN " crossorigin="anonymous "></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js " integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF " crossorigin="anonymous "></script>
</body>

</html>
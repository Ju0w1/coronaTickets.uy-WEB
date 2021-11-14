<%-- 
    Document   : consultaEspectaculosDePaquete
    Created on : Oct 6, 2021, 5:59:49 PM
    Author     : pabli
--%>

<%@page import="DTOs.EspectaculoPaqueteDTO"%>
<%@page import="java.util.List"%>
<%@page import="DTOs.TransporteListEspectaculosDePaqueteDTO"%>
<%@page import="Logica.Clases.Espectaculo"%>
<%@page import="java.util.Map"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <link rel="icon" href="https://i.imgur.com/KXDtCAj.png">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CoronaTickets - Espectáculos de Paquete</title>
    <!-- CSS only -->
    
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700&display=swap" rel="stylesheet">
    
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.css">
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.js"></script>
    
    <style>
        body {
            font-family: 'Montserrat', sans-serif;
        }
    </style>
    <script>
        function mostrarFila(){
            var escondido = document.getElementById('nombreE');
            console.log(escondido);
        }
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
        <div class="container" style="">
            <div class="row">
                <div class="col-12 d-flex justify-content-md-center">
                    <h1 class="mb-5">ESPECTÁCULOS DEL PAQUETE "<%=(String) objSesion.getAttribute("nombrePaquete")%>"</h1>
                </div>
            </div>
            <%
                if((Espectaculo) request.getAttribute("espec") == null){
                    if(request.getAttribute("espectaculosPaquete") == null){
                        %>
                            <div class="d-flex justify-content-md-center align-items-center">
                                <div>
                                    <h1>No existen espectáculos para este paquete</h1>
                                </div>
                            </div>
                        <%
                    }else{
                        
                    
            %>
             <div class="row">
                 <form class="form-inline" method="GET" action="/CoronaTickets-Web/ConsultaEspectaculosDePaquete">
                    <input id="especHidden" name="espectaculoGET" type="hidden" value="">
                 <div class="col-12 d-flex justify-content-md-center table-responsive">
                     <table id="tablaEspec" class="table table-bordered">
                        <thead>
                            <tr>
                              <th scope="col">Nombre</th>
                              <th scope="col">Descripción</th>
                              <th scope="col">Costo</th>
                              <th scope="col">Imagen</th>
                              <th scope="col">Ver más</th>
                            </tr>
                        </thead>
                        
                        <tbody id="myTable">
                            <%
                                TransporteListEspectaculosDePaqueteDTO nuevoDTO = (TransporteListEspectaculosDePaqueteDTO)request.getAttribute("espectaculosPaquete");
                                List<EspectaculoPaqueteDTO> especs = nuevoDTO.getEspectaculos();
                                
                                for (EspectaculoPaqueteDTO espec : especs) {

                            %>
                            <tr class="align-middle clickable-row">
                                <td id="nombreE" class="nombre"><%=espec.getNombre()%></td>
                                    <td><%=espec.getDescripcion()%></td>
                                    <td><%=espec.getCosto()%></td>
                                    <td>
                                        <div class="">
                                            <img style="max-height:100%; max-width:100%;object-fit: contain;" src="<%=espec.getImagen()%>">
                                        </div>
                                    </td>
                                    <td>
                                        
                                            <button type="submit" id="verMas" onclick="mostrarFila()" class="btn btn-outline-secondary">
                                                Ver más
                                            </button>   
                                        
                                    </td>
                                </tr>
                            <%
                                    }
                                }
                            %>
                        </tbody>
                    </table>
                </div>
                </form>
            </div>
            
            <%
                }else{
                    Espectaculo espectaculo = (Espectaculo) request.getAttribute("espec");
                    //espectaculo.getUrlIamgen()
                    //value.getFecha_Inicio().getAnio()+"-"+mes1+"-"+dia1;
                    String dia;
                    String mes;
                    if(espectaculo.getFecha().getDate() <10){
                        dia = "0"+espectaculo.getFecha().getDate();
                    }else{
                        dia = Integer.toString(espectaculo.getFecha().getDate());
                    }
                    if(espectaculo.getFecha().getMonth() <10){
                        mes = "0"+espectaculo.getFecha().getMonth();
                    }else{
                        mes = Integer.toString(espectaculo.getFecha().getMonth());
                    }
                    String fecha = espectaculo.getFecha().getYear()+1900+"-"+mes+"-"+dia;

            %>  
            <div class="row">
                <div class="col-6">
                    <form class="p-2">
                        <div class="form-group row mb-2 justify-content-between">
                            <label for="inputNombre" class="col-sm-2 col-form-label">Nombre</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="inputNombre" placeholder="<%=espectaculo.getNombre()%>" readonly>
                            </div>
                        </div>
                        <div class="form-group row mb-2 justify-content-between">
                            <label for="inputNombre" class="col-sm-2 col-form-label">Descripción</label>
                            <div class="col-sm-8">
                                <textarea class="form-control rounded-3" id="inputDescripcion " style="resize: none; " placeholder="<%=espectaculo.getDescripcion()%>" rows="4 " readonly></textarea>
                            </div>
                        </div>
                        <div class="form-group row mb-2 justify-content-between">
                            <label for="inputNombre" class="col-sm-2 col-form-label">Organizador</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="inputNombre" placeholder="<%=espectaculo.getArtista()%>" readonly>
                            </div>
                        </div>
                        <div class="form-group row mb-2 justify-content-between">
                            <label for="inputNombre" class="col-sm-4 col-form-label">Duración</label>
                            <div class="col-sm-8">
                                <input type="number" class="form-control" id="inputNombre" placeholder="<%=espectaculo.getDuracion()%> Minutos" readonly>
                            </div>
                        </div>
                        <div class="form-group row mb-2 justify-content-between">
                            <label for="inputNombre" class="col-sm-8 col-form-label">Cantidad mínima de espectadores</label>
                            <div class="col-sm-4">
                                <input type="number" class="form-control" id="inputNombre" placeholder="<%=espectaculo.getMin()%>" readonly>
                            </div>
                        </div>
                        <div class="form-group row mb-2 justify-content-between">
                            <label for="inputNombre" class="col-sm-8 col-form-label">Cantidad máxima de espectadores</label>
                            <div class="col-sm-4">
                                <input type="number" class="form-control" id="inputNombre" placeholder="<%=espectaculo.getMax()%>" readonly>
                            </div>
                        </div>
                    </form>

                </div>
                <div class="col-6 p-2">
                    <div class="form-group row mb-2 justify-content-between">
                        <label for="inputNombre" class="col-sm-2 col-form-label">URL</label>
                        <div class="col-sm-10">
                            <input type="url" class="form-control" id="inputNombre" placeholder="<%=espectaculo.getUrl()%>" readonly>
                        </div>
                    </div>
                    <div class="form-group row mb-2 justify-content-between">
                        <label for="inputNombre" class="col-sm-5 col-form-label">Fecha de registro</label>
                        <div class="col-sm-7">
                            <input type="date" class="form-control" id="inputNombre" value="<%=fecha%>" readonly>
                        </div>
                    </div>
                    <div class="form-group row mb-2 justify-content-between">
                        <label for="inputNombre" class="col-sm-2 col-form-label">Costo</label>
                        <div class="col-sm-10">
                            <input type="number" class="form-control" id="inputNombre" placeholder="<%=espectaculo.getCosto()%>" readonly>
                        </div>
                    </div>
                    <!--<div class="w-100 h-50 d-flex justify-content-md-center align-items-center" style="background-color: #eee;">Imagen</div>-->

                    <div class="w-100 d-flex justify-content-md-center align-items-center">
                        <img style="max-height:100%; max-width:100%;object-fit: contain;" src="<%=espectaculo.getUrlIamgen()%>">
                    </div>
                </div>
                
            </div>
            <div class="row mt-3">
                <div class="col-12 d-flex justify-content-md-center">
                    <a href="home">
                        <button class="btn btn-outline-secondary rounded-pill ">
                            VOLVER
                        </button>
                    </a>
                </div>
            </div>
            <%
                }
            %>
        </div>
    </div>

    <script>
        $(document).ready( function () {
            $('#tablaEspec').DataTable({
                searching: true,
                ordering:  false
            });
            $("#verMas").click(function() {
                var $row = $(this).closest("tr"); 
                // Find the row
                var $text = $row.find("#nombreE").text(); // Find the text
                
                $("#especHidden").attr("value",$text);
                // Let's test it out
            });
        } );
        
    </script>
</body>

</html>

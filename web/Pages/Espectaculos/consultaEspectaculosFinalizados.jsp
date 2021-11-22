<%-- 
    Document   : consultaEspectaculosDePaquete
    Created on : Oct 6, 2021, 5:59:49 PM
    Author     : pabli
--%>

<%@page import="DTOs.ConsultaEspectaculoDTO"%>
<%@page import="DTOs.EspectaculoPaqueteDTO"%>
<%@page import="java.util.List"%>
<%@page import="DTOs.TransporteListEspectaculosDePaqueteDTO"%>
<%@page import="Logica.Clases.Espectaculo"%>
<%@page import="java.util.Map"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

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
                    <h1 class="mb-5">ESPECTÁCULOS FINALIZADOS"</h1>
                </div>
            </div>
            
             <div class="row">
                 <div class="col-12 d-flex justify-content-md-center table-responsive">
                     <table id="tablaEspec" class="table table-bordered">
                        <thead>
                            <tr>
                              <th scope="col">Nombre</th>
                              <th scope="col">Descripción</th>
                              <th scope="col">Imagen</th>
                            </tr>
                        </thead>
                        
                        <tbody id="myTable">
                            <%
                                TransporteListEspectaculosDePaqueteDTO nuevoDTO = (TransporteListEspectaculosDePaqueteDTO)request.getAttribute("espectaculosPaquete");
                                List<EspectaculoPaqueteDTO> especs = nuevoDTO.getEspectaculos();
                                
                                for (EspectaculoPaqueteDTO espec : especs) {
                                    if(espec.getImagen()==null){
                                        espec.setImagen("https://i.imgur.com/Hh3cYL8.jpeg");
                                    }
                                    espec.setDescripcion(espec.getDescripcion().replaceAll("Ã¡", "\u00E1"));
                                    espec.setDescripcion(espec.getDescripcion().replaceAll("Ã©", "\u00E9"));
                                    espec.setDescripcion(espec.getDescripcion().replaceAll("Ã³", "\u00F3"));
                                    espec.setDescripcion(espec.getDescripcion().replaceAll("Ãº", "\u00FA"));
                                    espec.setDescripcion(espec.getDescripcion().replaceAll("Ã±", "\u00F1"));
                                    espec.setDescripcion(espec.getDescripcion().replaceAll("Ã", "\u00ED"));

                                    espec.setNombre(espec.getNombre().replaceAll("Ã¡", "\u00E1"));
                                    espec.setNombre(espec.getNombre().replaceAll("Ã©", "\u00E9"));
                                    espec.setNombre(espec.getNombre().replaceAll("Ã³", "\u00F3"));
                                    espec.setNombre(espec.getNombre().replaceAll("Ãº", "\u00FA"));
                                    espec.setNombre(espec.getNombre().replaceAll("Ã±", "\u00F1"));
                                    espec.setNombre(espec.getNombre().replaceAll("Ã", "\u00ED"));

                            %>
                            <tr class="align-middle clickable-row">
                                <td id="nombreE" class="nombre"><%=espec.getNombre()%></td>
                                    <td><%=espec.getDescripcion()%></td>
                                    <td>
                                        <div class="">
                                            <img style="max-height:75%; max-width:75%;object-fit: contain;" src="<%=espec.getImagen()%>">
                                        </div>
                                    </td>
                                </tr>
                            <%
                                    
                                }
                            %>
                        </tbody>
                    </table>
                </div>

            </div>
            
        </div>
    </div>

    <script>
        
        $(document).ready( function () {
            $("#btnValoresSeleccionados").removeAttr("type");
            if(!$('#inputNombre').val()){
                alert("Debes seleccionar (haciendo click sobre la fila) un espectáculo antes de clickear el botón 'Mostrar datos'");   
            }
            
            $('#tablaEspec').DataTable({
                searching: true,
                ordering:  false
            });
            $('#tablaEspec tbody').on( 'click', 'tr', function () {
                $(this).toggleClass('selected');
             });
             
             //Contar filas seleccionadas
             $('#btnValoresSeleccionados').click(function() {
                //alert(myTable.rows().data().length+' row(s) selected' );

               //Recorre las filas de la tabla
                var contador = 0;
                 $('#tablaEspec tbody tr').each(function(indexFila){
                   //verifica si  la fila seleccionada tiene la clase 'selected'
                   if($(this).hasClass('selected')) {
                        contador++;
                        //Recorre las columnas de la tabla
                    }

                 });//fin de '#myTable tbody tr'
                if(contador!==1){
                    alert("Debes seleccionar un espectáculo");
                }else if(contador===1){
                    $('#tablaEspec tbody tr').each(function(indexFila){
                        //verifica si  la fila seleccionada tiene la clase 'selected'
                        if($(this).hasClass('selected')) {
                             //Recorre las columnas de la tabla
                             $(this).children('td').each(function(indexColumna){
                                if(indexColumna===0){
                                    campo1=$(this).text();
                                    $("#nombreEspectaculoABuscar").attr("value",campo1);
                                };
                            });
                         }
                    });
                    $("#btnValoresSeleccionados").attr("type","submit");
                }
             });//fin (btnSeleccionados)
             // alert(myTable.rows('.selected').data().length+' row(s) selected' );

             //Obtener valor de las filas a las que se hace click
             var myFila= myTable.row( this ).data(); //Obtiene datos de una fila
             $.each(myFila,function(index, contenido){ //Recorre un array
                if(index===2){
                   alert(contenido);
                };
             }); 
             
            
             
        } );
    </script>
</body>

</html>

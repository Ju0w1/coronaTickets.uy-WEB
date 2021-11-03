<%-- 
    Document   : consultaEspectaculosDePaquete
    Created on : Oct 6, 2021, 5:59:49 PM
    Author     : pabli
--%>

<%@page import="java.lang.String"%>
<%@page import="Logica.Clases.Registro"%>
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
                    <h1 class="mb-5">REGISTRO A FUNCIÓN</h1>
                </div>
            </div>
            <form class="form-inline" method="POST" action="/CoronaTickets-Web/RegistroAFuncionDescuentoPaquete">
                <!--
                <input name="nombreFuncionNueva" type="hidden" value="request.getAttribute("nombreFuncionHaciaRegistro")">
                <input id="1" name="funcion2" type="hidden" value="">
                <input id="2" name="funcion3" type="hidden" value="">
                -->
                <input id="0" name="paq" type="hidden" value="">
                <button id="btnValoresSeleccionados" type="submit" class="btn btn-primary">Aplicar descuento</button>
                
            </form>
             <div class="row mt-3">
                    
                 <div class="col-12">
                     <table id="tablaEspec" class="table table-bordered">
                        <thead>
                            <tr>
                                <th>Nombre</th>
                                <th>Descripción</th>
                                <th>Imagen</th>
                            </tr>
                        </thead>
                        
                        <tbody id="myTable">
                            
                            <%
                                Map<String, Paquete> paquetes= (Map<String, Paquete>) request.getAttribute("paquetes");
                                if(paquetes == null){
                                    System.out.println("VACIO");
                                }else{
                                    int i=0;
                                    for (Map.Entry<String, Paquete> entry : paquetes.entrySet()) {
                                        String key = entry.getKey();
                                        Paquete value = entry.getValue();
                                        i++;
                            %>
                                        <tr class="align-middle clickable-row">
                                            <td id="nombreE" class="nombre"><%=value.getNombre()%></td>
                                            <td><%=value.getDescripcion()%></td>
                                            <td>
                                                <div class="w-100">
                                                    <img style="max-height:100%; max-width:100%;object-fit: contain;" src="<%=value.getUrl()%>">
                                                </div>
                                            </td>
                                        </tr>
                            <%
                                    }
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
                    alert("Debe seleccionar un solo paquete");
                }else{
                    alert("Agregado correctamente");
                    var contador2 = 0;
                    $('#tablaEspec tbody tr').each(function(indexFila){
                        //verifica si  la fila seleccionada tiene la clase 'selected'
                        if($(this).hasClass('selected')) {
                             //Recorre las columnas de la tabla
                             $(this).children('td').each(function(indexColumna){
                                if(indexColumna===0){
                                    campo1=$(this).text();
                                    $("#"+contador2).attr("value",campo1);
                                    contador2++;
                                };
                            });
                         }

                    });
                   
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

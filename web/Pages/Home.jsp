<%-- 
    Document   : Login
    Created on : Sep 1, 2021, 11:30:19 PM
    Author     : LucasCiceri
--%>

<%@page import="Logica.Clases.Espectaculo"%>
<%@page import="Logica.Interfaz.IControladorPaquete"%>
<%@page import="Logica.Fabrica"%>
<%@page import="java.util.HashMap"%>
<%@page import="Logica.Clases.Paquete"%>
<%@page import="java.util.Map"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>

    <!DOCTYPE html>

    <html>
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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>


        <!-- JavaScript Bundle with Popper -->
        
        <link href="http://localhost:8080/CoronaTickets-Web/Pages/malihu-custom-scrollbar-plugin-master/jquery.mCustomScrollbar.css" rel="stylesheet" type="text/css"/>
        <style>
            body {
                font-family: 'Montserrat', sans-serif;
            }
            /* Custom Scrollbar using CSS */
            .custom-scrollbar-css {
              overflow-y: scroll;
            }
            /* scrollbar width */
            .custom-scrollbar-css::-webkit-scrollbar {
              width: 5px;
            }
            /* scrollbar track */
            .custom-scrollbar-css::-webkit-scrollbar-track {
              background: #eee;
            }
            /* scrollbar handle */
            .custom-scrollbar-css::-webkit-scrollbar-thumb {
              border-radius: 1rem;
              background-color: #00d2ff;
              background-image: linear-gradient(to top, #00d2ff 0%, #3a7bd5 100%);
            }

            #content-3{
                height: 20vh;
            }
        </style>
    </head>
    <%
            HttpSession objSesion = request.getSession();
            String usuario;
            String imgPerfil;
            if (objSesion.getAttribute("nickname") != null) {%>
                <%@include file="/Pages/Common/Header2.jsp" %>
            <%}
            else{%>
                <%@include file="/Pages/Common/Header.jsp" %>
            <%}
        %>
    <body>
        <div class="d-flex justify-content-md-center align-items-center mt-5">
            <div class="container w-75 ">
                    <div class="row ">
                        <div class="col-6 " id="content-3" style="height: 85vh">
                            <h1>Paquetes</h1>
                            <%
                                Map<String, Paquete> paquetes = (Map<String, Paquete>) request.getAttribute("paquetes");
                                if(paquetes == null){
                                    System.out.println("VACIO");
                                }else{
                                    for (Map.Entry<String, Paquete> entry : paquetes.entrySet()) {
                                        String key = entry.getKey();
                                        Paquete value = entry.getValue();
                                        String nombre =value.getNombre();
                                        String desc = value.getDescripcion();
                                        
                                        String mes1;
                                        if(value.getFecha_Inicio().getMes()<10){
                                           mes1 = "0"+value.getFecha_Inicio().getMes();
                                        }else{
                                           mes1 = Integer.toString(value.getFecha_Inicio().getMes());
                                        }
                                        String dia1;
                                        if(value.getFecha_Inicio().getDia()<10){
                                           dia1 = "0"+value.getFecha_Inicio().getDia();
                                        }else{
                                           dia1 = Integer.toString(value.getFecha_Inicio().getDia());
                                        }
                                        String mes2;
                                        if(value.getFecha_Fin().getMes()<10){
                                           mes2 = "0"+value.getFecha_Fin().getMes();
                                        }else{
                                           mes2 = Integer.toString(value.getFecha_Fin().getMes());
                                        }
                                        String dia2;
                                        if(value.getFecha_Fin().getDia()<10){
                                           dia2 = "0"+value.getFecha_Fin().getDia();
                                        }else{
                                           dia2 = Integer.toString(value.getFecha_Inicio().getDia());
                                        }
                                        
                                        String fechaIni = value.getFecha_Inicio().getAnio()+"-"+mes1+"-"+dia1;
                                        String fechaFin = value.getFecha_Fin().getAnio()+"-"+mes2+"-"+dia2;
                                        //String fechaFin = value.getFecha_Fin().getDia()+"/"+value.getFecha_Fin().getMes()+"/"+value.getFecha_Fin().getAnio();
                                        
                                        float descuento = value.getDescuento();
                                        float costo = value.getCosto();
                                        String urlImagen = value.getUrl();
                                        String concat = nombre+","+desc+","+fechaIni+","+fechaFin+","+Float.toString(descuento)+","+Float.toString(costo)+","+urlImagen;
                            %>
                            <div class="row ">
                                <div class="container w-100 mt-3 mb-3">
                                    <div class="card bg-dark text-white">
                                        <img src="<%= value.getUrl()%>" id="<%= key%>" class="card-img">
                                        <div class="card-img-overlay d-flex justify-content-md-center align-items-center">
                                            <form name="ver_mas" method="POST" action="/CoronaTickets-Web/Paquete" >
                                                <input type="hidden" value="<%= concat %>" name="ver_mas">
                                                <input type="submit" value="Ver más" id="btn_ver_mas" class="btn btn-secondary">
                                            </form>
                                        </div>
                                    </div>
                                    
                                </div>
                            </div>
                            <%
                                    }
                                }
                            %> 
                        </div>
                        <div class="col-6" id="content-4" style="height: 85vh">
                            <h1>Espectáculos</h1>
                            <%
                                Map<String, Espectaculo> espectaculos = (Map<String, Espectaculo>) request.getAttribute("espectaculos");
                                if(espectaculos == null){
                                    System.out.println("VACIO");
                                }else{
                                    for (Map.Entry<String, Espectaculo> entry : espectaculos.entrySet()) {
                                        String key = entry.getKey();
                                        Espectaculo value = entry.getValue();
                                        String nombre = value.getNombre();
                                        String artista = Integer.toString(value.getArtista());
                                        String descripcion = value.getDescripcion();
                                        String especmax = Integer.toString(value.getMax());
                                        String especmin = Integer.toString(value.getMin());
                                        String url = value.getUrl();
                                        String costo = Double.toString(value.getCosto());
                                        String duracion = Double.toString(value.getDuracion());
                                        String fecha = value.getFecha().toString();
                                        String urlImagen = value.getUrlIamgen();
                                        String concat = nombre+","+artista+","+descripcion+","+especmax+","+especmin+","+url+","+costo+","+duracion+","+fecha+","+urlImagen;
                            %>
                            <div class="row ">
                                <div class="container w-100 mt-3 mb-3">
                                    <div class="card bg-dark text-white">
                                        <img src="<%= value.getUrlIamgen()%>" id="<%= key%>" class="card-img">
                                        <div class="card-img-overlay d-flex justify-content-md-center align-items-center">
                                            <form name="ver_mas" method="POST" action="/CoronaTickets-Web/Espectaculo" >
                                                <input type="hidden" value="<%= concat %>" name="ver_mas">
                                                <input type="submit" value="Ver más" id="btn_ver_mas" class="btn btn-secondary">
                                            </form>
                                        </div>
                                    </div>
                                    
                                </div>
                            </div>
                            <%
                                    }
                                }

                            %> 
                        </div>
                    </div>
                             
            </div>
        </div>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="http://localhost:8080/CoronaTickets-Web/Pages/malihu-custom-scrollbar-plugin-master/jquery.mCustomScrollbar.concat.min.js" type="text/javascript"></script>
        <script type="text/javascript">
        
        $(document).ready(function() {
            $("#content-3").mCustomScrollbar({
              theme: "inset-3-dark"
            });
            $("#content-4").mCustomScrollbar({
              theme: "inset-3-dark"
            });
        });
        
    </script>  
    
    </body>

    </html>
<%-- 
    Document   : Login
    Created on : Sep 1, 2021, 11:30:19 PM
    Author     : LucasCiceri
--%>

<%@page import="DTOs.HomeEspectaculoDTO"%>
<%@page import="DTOs.HomePaqueteDTO"%>
<%@page import="java.util.List"%>
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
        <meta http-equiv="Content-Type"  content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>CoronaTickets - Home</title>
        <!-- CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700&display=swap" rel="stylesheet">


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
                                List<HomePaqueteDTO> arregloPaquetes = (List<HomePaqueteDTO>)request.getAttribute("paquetes");
                               
                                if(arregloPaquetes.isEmpty()){
                                    System.out.println("VACIO");
                                }else{
                                    for (HomePaqueteDTO paquete : arregloPaquetes) {
                                        if(paquete.getImagen()==null){
                                            paquete.setImagen("https://i.imgur.com/Hh3cYL8.jpeg");
                                        }
                            %>
                            <div class="row">
                                <div class="container w-100 mt-3 mb-3">
                                    <div class="card bg-dark text-white align-items-center">
                                        <h4><%= paquete.getNombre() %></h4>
                                        <img src="<%= paquete.getImagen() %>" id="" class="card-img">
                                        <div class="card-img-overlay d-flex justify-content-md-center align-items-center">
                                            <form name="ver_mas" method="POST" action="/CoronaTickets-Web/Paquete" >
                                                <input type="hidden" id="nombrePaquete" name="nombrePaquete" class="nombrePaqueteLista" value="<%= paquete.getNombre() %>">
                                                <input type="hidden" value="" name="ver_mas">
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
                                List<HomeEspectaculoDTO> arregloEspectaculos = (List<HomeEspectaculoDTO>)request.getAttribute("espectaculos");
                                
                                //Map<String, Espectaculo> espectaculos = (Map<String, Espectaculo>) request.getAttribute("espectaculos");
                                if(arregloEspectaculos.isEmpty()){
                                    System.out.println("VACIO");
                                }else{
                                    for (HomeEspectaculoDTO espectaculo : arregloEspectaculos) {
                                        if(espectaculo.getImagen()==null){
                                            espectaculo.setImagen("https://i.imgur.com/Hh3cYL8.jpeg");
                                        }
                                    /*
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
                                        String concat = nombre+"@"+artista+"@"+descripcion+"@"+especmax+"@"+especmin+"@"+url+"@"+costo+"@"+duracion+"@"+fecha+"@"+urlImagen;
                                    */
                            %>
                            <div class="row ">
                                <div class="container w-100 mt-3 mb-3">
                                    <div class="card bg-dark text-white align-items-center">
                                        <h4><%= espectaculo.getNombre() %></h4>
                                        <img src="<%= espectaculo.getImagen() %>" class="card-img">
                                        <div class="card-img-overlay d-flex justify-content-md-center align-items-center">
                                            <form name="ver_mas" method="POST" action="/CoronaTickets-Web/Espectaculo" >
                                                <input type="hidden" id="nombrePaqueteLista" name="nombreEspectaculo" class="nombrePaqueteLista" value="<%= espectaculo.getNombre() %>">
                                                <input type="hidden" value="" name="ver_mas">
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
        function filter() {

            let input = document.querySelector('.searchbar').value //<-- Changed to querySelector
            input = input.toLowerCase();
            let cards = document.querySelectorAll('.card'); //<-- Changed to querySelectorAll with '.card' selector.
            //loop over cards and compare search with title.
            console.log(cards);
            cards.forEach((el) => {
              let title = el.querySelector('.nombrePaqueteLista');
              var selectedValue = title.value.toLowerCase();
              //console.log(selectedValue);
              el.style.display = selectedValue.includes(input) ? "list-item" : "none";
            });
          }
    </script>  
    
    </body>

    </html>
<%-- 
    Document   : consultaEspectaculosDePaquete
    Created on : Oct 6, 2021, 5:59:49 PM
    Author     : pabli
--%>

<%@page import="Logica.Clases.Espectaculo"%>
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
    <%
            HttpSession objSesion = request.getSession();
            String usuario;
            String imgPerfil;
            if (objSesion.getAttribute("nickname") != null) {%>
                <%@include file="/Pages/Common/Header2.jsp" %>
            <%}
            else{%>
               <%@include file="/Pages/Common/HeaderSearch.jsp" %>
            <%}
        %>

    <div class="d-flex justify-content-md-center align-items-center mt-5">
        <div class="container" style="width: 100vh;">
            <div class="row">
                <div class="col-12 d-flex justify-content-md-center">
                    <h1 class="mb-5">ESPECTÁCULOS DEL PAQUETE "<%=(String) objSesion.getAttribute("nombrePaquete")%>"</h1>
                </div>
            </div>
            <%
                if((Espectaculo) request.getAttribute("espec") == null){

            %>  
            <div class="row">
                <div class="col-md-12 d-flex justify-content-md-center">
                    <form class="form-inline" method="GET" action="/CoronaTickets-Web/ConsultaEspectaculosDePaquete">
                            <select class="form-select" name="espectaculo" aria-label="Espectaculos">
                                <option selected>Espectaculos</option>
                                <%
                                    int i=0;
                                     Map<String, Espectaculo> espectaculos= (Map<String, Espectaculo>) request.getAttribute("espectaculosPaquete");
                                    if(espectaculos == null){
                                        System.out.println("VACIO");
                                    }else{
                                        for (Map.Entry<String, Espectaculo> entry : espectaculos.entrySet()) {
                                            String key = entry.getKey();
                                            Espectaculo value = entry.getValue();
                                %>
                                <option value="<%=key%>" id="<%=key%>"><%=key%></option>
                                <%
                                            i++;
                                        }
                                    }
                                %>
                            </select>
                            <div class="col-md-12 d-flex justify-content-md-center mt-2">
                                <button type="submit " class="btn btn-secondary rounded-pill d-flex justify-content-md-center">
                                BUSCAR
                            </button>
                            </div>
                            
                      </form>       
                </div>      
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
                                <textarea class="form-control rounded-3" id="inputDescripcion " style="resize: none; " placeholder="<%=espectaculo.getDescripcion()%>" rows="2 " readonly></textarea>
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

</body>

</html>

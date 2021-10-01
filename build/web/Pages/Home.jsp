<%-- 
    Document   : Login
    Created on : Sep 1, 2021, 11:30:19 PM
    Author     : LucasCiceri
--%>


<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="Logica.Clases.Usuario"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Users</title>
    </head>
    <body>
        <link rel="stylesheet" type="text/css" href="Users.css" />

        <%@include file="/Pages/Common/Header.jsp" %>
        <h1>Hola usuario <b> ${name}</b></h1>

        <table class="table">
            <thead>
                <tr>
                    <th scope="col">Nombre</th>
                    <th scope="col">Apellido</th>
                </tr>
            </thead>
            <tbody>

                <%
                    
                    Map<String, Usuario> usuarios = (Map<String, Usuario>) request.getAttribute("usuarios");
                    int tamanioUsuarios = usuarios.size();
                    Object[][] data = new Object[tamanioUsuarios][2];
                    
                    for(int i = 0; i < tamanioUsuarios; i++){
                        for(Map.Entry<String, Usuario> entry : usuarios.entrySet()){

                        data[i][0] = entry.getKey();
                        data[i][1] = entry.getValue();
                        //String datos[] = data[i][1].
                        i++;
                     }
                    }
                    
                    
                     for(int i = 0; i < tamanioUsuarios; i++){
                        //String data[] = {this.usuarios.get(i).getNombre(), this.usuarios.get(i).getApellido(), this.usuarios.get(i).getCedula()};

                        Usuario e = (Usuario) data[i][1];
                        System.out.println(e.getEmail());
                        
                    
                    
                %>
                <tr>
                    <th scope="col"><%= e.getNombre()%></th>
                    <th scope="col"><%= e.getApellido()%></th>
                </tr>

                <%
                    }
                %>
            </tbody>
        </table>

        <%@include file="/Pages/Common/Footer.jsp" %>
    </body>
</html>
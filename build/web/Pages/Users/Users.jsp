<%-- 
    Document   : Login
    Created on : Sep 1, 2021, 11:30:19 PM
    Author     : LucasCiceri
--%>


<%@page import="Logica.Clases.Usuario"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Users</title>
    </head>
    <body>
        <link rel="stylesheet" type="text/css" href="Users.css" />

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
                    List<Usuario> usuarios = (List<Usuario>) request.getAttribute("usuarios");
                    for (Usuario elem : usuarios) {
                %>
                <tr>
                    <th scope="col"><%= elem.getNombre()%></th>
                    <th scope="col"><%= elem.getApellido()%></th>
                </tr>

                <%
                    }
                %>
            </tbody>
        </table>

        <%@include file="/Pages/Common/Footer.jsp" %>
    </body>
</html>
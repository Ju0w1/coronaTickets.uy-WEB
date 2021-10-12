<%-- 
    Document   : cerrarSesion
    Created on : 09-29-2017, 04:53:15 PM
    Author     : VA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<%  
    HttpSession objSesion = request.getSession();  
    objSesion.invalidate();
    out.print("<script>location.replace('/CoronaTickets-Web/home');</script>");
%>

<%-- 
    Document   : HeaderMain
    Created on : 12/10/2021, 12:05:49 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

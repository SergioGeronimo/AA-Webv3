<%-- 
    Document   : index
    Created on : 22/11/2018, 10:00:26 PM
    Author     : dev
--%>

<%@page import="com.ezpadaz.web.UserControl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Indexe</title>
        <link rel="stylesheet" href="CSS/prueba.css">
    </head>
    <body>
<%
    if(UserControl.isLogged(session.getId())){
        response.sendRedirect("./Usuario/index.jsp");
    } else {
    %>
    <div>
        <a href="./Login/login.jsp">Login</a>
        <a href="./Login/register.jsp">Registro</a>
    </div>
    <%
    }
%>


    </body>
</html>

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
        <title>JSP Page</title>
        <link rel="stylesheet" href="CSS/prueba.css">
    </head>
    <body>
<%
    if(UserControl.isLogged(session.getId())){
        response.sendRedirect("./Usuario/index.jsp");
    } else {
    %>
    <div>
        Formulario de Ingreso <br><br><br>
        <form action="./login" method="POST">
            Usuario: 
            <input type="text" name="email" required><br>
            Contraseña:
            <input type="password" name="pwd" required><br>
            <input type="submit" value="Ingresar">
        </form>
    </div>
    <%
    }
%>


    </body>
</html>

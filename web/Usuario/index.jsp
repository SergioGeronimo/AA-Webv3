<%-- 
    Document   : index.html
    Created on : 22/11/2018, 10:04:45 PM
    Author     : dev
--%>

<%@page import="com.ezpadaz.web.UserControl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pagina Secreta</title>
    </head>
    <body>
        <%
    if(UserControl.isLogged(session.getId())){
        %>
        Bienvenido prro, Usuarios loggeados: <%=UserControl.usuariosOnline()%>
        <form action="../logout" method="post">
            <input type="submit" value="Salir">
        </form>
        <%
    } else {
       response.sendRedirect("/AAWeb");
    }
%>
    </body>
</html>

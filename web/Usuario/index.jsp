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
        </form><br><br><br>
        
        <form action="../upload" method="post" enctype="multipart/form-data">
            Selecciona un archivo:<br>
            <input typ="file" name="archivo">
            <br>
            <input type="submit" value="Enviar">
        </form>
        <%
    } else {
       response.sendRedirect(request.getContextPath());
    }
%>
    </body>
</html>

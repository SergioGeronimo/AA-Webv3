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
        <title>Pagina Principal</title>
        <link rel="stylesheet" href="./CSS/style.css">
    </head>
    <body>
        <%
    if(UserControl.isLogged(session.getId())){
        %>
        <!--HTML AQUI-->
        <div class="menu">
            <a href="#" target="frame">Calcular Carga Termica</a>
            <a href="#" target="frame">Calcular Consumo Electrico</a>
            <a href="#" target="frame">nothing yet.</a>
            <a href="#" target="frame">nope</a>
        </div>
        
        <div class="contenido">
            <iframe id="fram" name="frame" src="" frameborder="0" scrolling="no"></iframe>
        </div>
        <%
    } else {
       response.sendRedirect(request.getContextPath());
    }
%>
    </body>
</html>

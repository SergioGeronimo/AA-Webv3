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
        <title>Index</title>
        <link rel="stylesheet" href="CSS/index.css">
        
    </head>
    <body>
<%
    if(UserControl.isLogged(session.getId())){
        response.sendRedirect("./Usuario/index.jsp");
    } else {
    %>
    <div><br><br><br><br>
        <center>
            <table>
                <tr>                  
                        <font size="40">
                        Aplicación Web
                </tr>
                <br><br>
                <tr>
                    <td>
                        <font size="5">
                        <a href="./Login/login.jsp">Iniciar Sesión</a>
                    </td>
                    <td>
                        <font size="5">
                        <a href="./Login/register.jsp">Registrate</a>
                        
                    </td>
                </tr>
            </table>
        </center>
    </div>
    <%
    }
%>


    </body>
</html>

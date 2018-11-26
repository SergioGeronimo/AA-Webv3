<%-- 
    Document   : login
    Created on : Nov 25, 2018, 5:29:58 PM
    Author     : jorge
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         Formulario de Ingreso <br><br><br>
        <form action="./login" method="POST">
            Usuario: 
            <input type="text" name="email" required><br>
            Contraseña:
            <input type="password" name="pwd" required><br>
            <input type="submit" value="Ingresar">
            <input type="reset">
        </form>
         <br>
         <br>
    </body>
</html>

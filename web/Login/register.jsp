<%-- 
    Document   : register
    Created on : Nov 25, 2018, 5:30:06 PM
    Author     : jorge
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro</title>
    </head>
    <body>
        Formulario de Ingreso <br><br><br>
        <form action="../registro" method="POST">
            Nombre Completo:
            <input type="text" name="nombre" required><br>
            Correo Electronico: 
            <input type="text" name="email" required><br>
            Contraseña:
            <input type="password" name="pwd" required><br>
            <input type="submit" value="Ingresar">
            <input type="reset">
        </form>
    </body>
</html>

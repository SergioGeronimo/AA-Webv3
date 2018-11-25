<%-- 
    Document   : CalcCargaTerm
    Created on : 24/11/2018, 04:43:40 PM
    Author     : Sergio_Gerónimo_González
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="CSS/prueba.css">
        <title>JSP Page</title>
    </head>
    <body>
        <form>
            <input type="text">
            <input type="text">
            <input type="text">
            <input type="date">
        </form>
        <table>
            <th>null</th>
            <th>null</th>
            <th>alto</th>
            <th>ancho</th>
            <th>fondo</th>
            <th>factor multiplicador</th>
            <th>btuh</th>
            
            <tr>
                <th>1</th>
                <td>AREA DEL PISO</td>
                <td>*</td>
                <td>*</td>
                <td>*</td>
                <td>*</td>
                <td>*</td>
            </tr>
            <tr>
                <th>2</th>
                <td>VOLUMEN DEL RECINTO</td>
                <td>    </td>
                <td>    </td>
                <td>    </td>
                <td>    </td>
                <td>    </td>
            </tr>
            <tr>
                <th>3</th>
                <td>VENTANA LADO SUR O ESTE</td>
                <td>    </td>
                <td>    </td>
                <td>NA</td>
                <td>    </td>
                <td>    </td>
            </tr>
            <tr>
                <th>3</th>
                <td>VENTANA LADO SUROESTE</td>
                <td>    </td>
                <td>    </td>
                <td>NA</td>
                <td>    </td>
                <td>    </td>
            </tr>
            <tr>
                <th>3</th>
                <td>VENTANA LADO OESTE</td>
                <td>    </td>
                <td>    </td>
                <td>na</td>
                <td>    </td>
                <td>    </td>
            </tr>
            <tr>
                <th>3</th>
                <td>VENTANA LADO NORESTE O SUROESTE</td>
                <td>    </td>
                <td>    </td>
                <td>NA</td>
                <td>    </td>
                <td>    </td>
            </tr>
            <tr>
                <th>4</th>
                <td>AREA DEL RESTO DE LAS VENTANAS</td>
                <td>    </td>
                <td>    </td>
                <td>NA</td>
                <td>    </td>
                <td>    </td>
            </tr>
            <tr>
                <th>5</th>
                <td>AREA DE LA PARED UTILIZADA EN EL PUNTO 3 (NO INCLUIR LA DIMENSIÓN DE LA VENTANA)</td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <th>6</th>
                <td>AREA DEL RESTO DE LAS PAREDES EXTERIORES (NO INCLUIR LA DIMENSION DE LA VENTANA)</td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <th>7</th>
                <td>AREA DE TODAS LAS PAREDES ADYACENTES A UN RECINTO NO ACONDICIONADO</td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <th>8</th>
                <td>TECHO CON CONSTRUCCIÓN ARRIBA SIN ACONDICIONAR</td>
                <td>NA</td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <th>8</th>
                <td>TECHO CON PLAFON NO AISLADO</td>
                <td>NA</td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <th>8</th>
                <td>NA</td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <th>8</th>
                <td>TECHADO CON PLAFON Y 50 mm. (2") O MÁS DE AISLAMIENTO</td>
                <td>NA</td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <th>8</th>
                <td>TECHADO NO AISLADO</td>
                <td>NA</td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <th>9</th>
                <td>NUM. DE PERSONAS DENTRO DEL RECINTO</td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <th>10</th>
                <td>LUZ Y EQUIPOS ELECTRICOS EN USO (WATTS)</td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            
        </table>
        <h2>Clic el equipo inverter de acuerdo a los BTU calculados para acceder a los modelos</h2>
        <a href="#">12000 BTU</a>
        <a href="#">18000 BTU</a>
        <a href="#">24000 BTU</a>
        <a href="#">36000 BTU</a>
    </body>
</html>

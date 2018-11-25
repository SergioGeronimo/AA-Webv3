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
        <title>Calculo de carga térmica</title>
    </head>
    <body>
        <form>
        <div id="dimensiones">
            <h2>ingrese las dimensiones de la sala</h2>
            Alto: <input type="text"><br>
            Ancho: <input type="text"><br>
            Fondo: <input type="text"><br>
        </div>
        <div id="pasoA">
            <h2>Ingresar datos de la empresa</h2>
            Nombre de la empresa: <input type="text"><br>
            ID area climatizada: <input type="text"><br>
            Planta: <input type="text"><br>
            Fecha de mantenimiento: <input type="date"><br>
        </div>
        
        <div id="pasoB">
            <h2> Escoge estado y ciudad de la lista desplegable</h2>
            <select name="estado">
                <option value="estadoA">Estado A</option>
                <option value="estadoB">Estado B</option>
            </select>
            <select name="ciudad">
                <option value="ciudadA">Ciudad A</option>
                <option value="ciudadB">Ciudad B</option>
            </select>
        </div>
        <div id="pasoC">
            <h2>Calculo de carga térmica</h2>
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
                    <td><input type="text"></td>
                    <td><input type="text"></td>
                    <td><input type="text"></td>
                    <td><input type="text"></td>
                    <td><input type="text"></td>
                </tr>
                <tr>
                    <th>2</th>
                    <td>VOLUMEN DEL RECINTO</td>
                    <td><input type="text"></td>
                    <td><input type="text"></td>
                    <td><input type="text"></td>
                    <td><input type="text"></td>
                    <td><input type="text"></td>
                </tr>
                <tr>
                    <th>3</th>
                    <td>VENTANA LADO SUR O ESTE</td>
                    <td><input type="text"></td>
                    <td><input type="text"></td>
                    <td>NA</td>
                    <td><input type="text"></td>
                    <td><input type="text"></td>
                </tr>
                <tr>
                    <th>3</th>
                    <td>VENTANA LADO SUROESTE</td>
                    <td><input type="text"></td>
                    <td><input type="text"></td>
                    <td>NA</td>
                    <td><input type="text"></td>
                    <td><input type="text"></td>
                </tr>
                <tr>
                    <th>3</th>
                    <td>VENTANA LADO OESTE</td>
                    <td><input type="text"></td>
                    <td><input type="text"></td>
                    <td>na</td>
                    <td><input type="text"></td>
                    <td><input type="text"></td>
                </tr>
                <tr>
                    <th>3</th>
                    <td>VENTANA LADO NORESTE O SUROESTE</td>
                    <td><input type="text"></td>
                    <td><input type="text"></td>
                    <td>NA</td>
                    <td><input type="text"></td>
                    <td><input type="text"></td>
                </tr>
                <tr>
                    <th>4</th>
                    <td>AREA DEL RESTO DE LAS VENTANAS</td>
                    <td><input type="text"></td>
                    <td><input type="text"></td>
                    <td>NA</td>
                    <td><input type="text"></td>
                    <td><input type="text"></td>
                </tr>
                <tr>
                    <th>5</th>
                    <td>AREA DE LA PARED UTILIZADA EN EL PUNTO 3 (NO INCLUIR LA DIMENSIÓN DE LA VENTANA)</td>
                    <td><input type="text"></td>
                    <td><input type="text"></td>
                    <td><input type="text"></td>
                    <td><input type="text"></td>
                    <td><input type="text"></td>
                </tr>
                <tr>
                    <th>6</th>
                    <td>AREA DEL RESTO DE LAS PAREDES EXTERIORES (NO INCLUIR LA DIMENSION DE LA VENTANA)</td>
                    <td><input type="text"></td>
                    <td><input type="text"></td>
                    <td><input type="text"></td>
                    <td><input type="text"></td>
                    <td><input type="text"></td>
                </tr>
                <tr>
                    <th>7</th>
                    <td>AREA DE TODAS LAS PAREDES ADYACENTES A UN RECINTO NO ACONDICIONADO</td>
                    <td><input type="text"></td>
                    <td><input type="text"></td>
                    <td><input type="text"></td>
                    <td><input type="text"></td>
                    <td><input type="text"></td>
                </tr>
                <tr>
                    <th>8</th>
                    <td>TECHO CON CONSTRUCCIÓN ARRIBA SIN ACONDICIONAR</td>
                    <td>NA</td>
                    <td><input type="text"></td>
                    <td><input type="text"></td>
                    <td><input type="text"></td>
                    <td><input type="text"></td>
                </tr>
                <tr>
                    <th>8</th>
                    <td>TECHO CON PLAFON NO AISLADO</td>
                    <td>NA</td>
                    <td><input type="text"></td>
                    <td><input type="text"></td>
                    <td><input type="text"></td>
                    <td><input type="text"></td>
                </tr>
                <tr>
                    <th>8</th>
                    <td>NA</td>
                    <td><input type="text"></td>
                    <td><input type="text"></td>
                    <td><input type="text"></td>
                    <td><input type="text"></td>
                    <td><input type="text"></td>
                </tr>
                <tr>
                    <th>8</th>
                    <td>TECHADO CON PLAFON Y 50 mm. (2") O MÁS DE AISLAMIENTO</td>
                    <td>NA</td>
                    <td><input type="text"></td>
                    <td><input type="text"></td>
                    <td><input type="text"></td>
                    <td><input type="text"></td>
                </tr>
                <tr>
                    <th>8</th>
                    <td>TECHADO NO AISLADO</td>
                    <td>NA</td>
                    <td><input type="text"></td>
                    <td><input type="text"></td>
                    <td><input type="text"></td>
                    <td><input type="text"></td>
                </tr>
                <tr>
                    <th>9</th>
                    <td>NUM. DE PERSONAS DENTRO DEL RECINTO</td>
                    <td><input type="text"></td>
                    <td><input type="text"></td>
                    <td><input type="text"></td>
                    <td><input type="text"></td>
                    <td><input type="text"></td>
                </tr>
                <tr>
                    <th>10</th>
                    <td>LUZ Y EQUIPOS ELECTRICOS EN USO (WATTS)</td>
                    <td><input type="text"></td>
                    <td><input type="text"></td>
                    <td><input type="text"></td>
                    <td><input type="text"></td>
                    <td><input type="text"></td>
                </tr>

            </table>
        </div>
        <div id="pasoD">
        <h2>Clic el equipo inverter de acuerdo a los BTU calculados para acceder a los modelos</h2>
            <a href="#">12000 BTU</a>
            <a href="#">18000 BTU</a>
            <a href="#">24000 BTU</a>
            <a href="#">36000 BTU</a>
        </div>
         </form>    
    </body>
</html>

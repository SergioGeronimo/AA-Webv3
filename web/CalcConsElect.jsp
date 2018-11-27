
<html>
    <head>
        <title>Calculo de consumo eléctrico</title>
        
        <meta pageEncoding="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel ="stylesheet" href="CSS/general.css">
        <link rel ="stylesheet" href="CSS/div.css">
        <link rel ="stylesheet" href="CSS/botones.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    </head>
    <body>
        
        <div class="header">
                <h1 class="title"><a class="toIndex" href="index.jsp"> AERE</a></h1>
        </div>
        
        <div class="dimensionesRow">
            
            <div class="dimensionesColumna">
                <h2> DATOS DE FACTURACIÓN ELÉCTRICA </h2>
            </div>
            <div class="dimensionesColumna">
                Precio promedio tarifa:<br>
                <input type="text" name="precioTarifa" placeholder="($/KWh)"><br>
                Tarifa:
                    <select>
                        <option value="Om"> OM </option>
                        <option value="HM"> HM </option>
                    </select>
            </div>
            <button type="button" class="navButton"><i class="material-icons">chevron_right</i></button>
        </div>
        
        
        <div class="dimensionesRow">
            <button type="button" class="navButton"><i class="material-icons">chevron_left</i></button>
            <div class="dimensionesColumna">
                <h2>Datos de placa</h2>
                <input type="text" placeholder="Tipo de equipo" value="Minisplit"><br>
                <input type="text" placeholder="Marca" value="Prime"><br>
                <input type="text" placeholder="Refrigerante" value="R-22"><br>
                <input type="text" placeholder="ERR por datos de placa">
            </div>
            <div class="dimensionesColumna">
                <input type="text" placeholder="Capacidad de enfriamiento (Btu/h)"><br>
                <input type="text" placeholder="Potencia activa (W)"><br>
                <input type="text" placeholder="Pot. activa por tension y corriente (W)" value="238.4"><br>
                <input type="text" placeholder="Tensión (V)"><br>
                <input type="text" placeholder="Corriente nominal (A)"><br>
            </div>
            <button type="button" class="navButton"><i class="material-icons">chevron_right</i></button>
        </div>
        
        <div class="dimensionesRow">
            <button type="button" class="navButton"><i class="material-icons">chevron_left</i></button>
            <div class="dimensionesColumna">
                <h2>Mantenimiento</h2>
                <input type="text" placeholder="Antigüedad en años"><br>
                <input type="text" placeholder="Condiciones actuales del equipo"><br>
                <input type="text" placeholder="Dias de operación al año">
                ¿Existe programa de mantenimiento?<br>
                <select>
                    <option value="Si"> Si </option>
                    <option value="No"> No </option>
                </select><br>
                
            </div>
            <div class="dimensionesColumna">
                
                Último mantenimiento:<br>
                <input type="date"><br>
                Tipo de Mantenimiento:<br>
                <select>
                    <option>Preventivo</option>
                    <option>Correctivo</option>
                    <option>Predictivo</option>
                </select>
                Descripción general:<br>
                <textarea rows='5' cols='25' placeholder="Describe el mantenimiento aquí"></textarea>
            </div>
            <button type="button" class="navButton"><i class="material-icons">chevron_right</i></button>
        </div>
        
        
        <div>
            
                            
                <table>
                    <tr>
                        <th colspan="9">Mediciones Puntuales</th>
                    </tr>
                    
                    <tr>
                        <th colspan="9">Eléctricas</th>
                    </tr>
                    
                    <tr>
                        <th colspan="9">Ingresar los valores medidos de potencia en las celdas en color amarillo </th>
                    </tr>
                    
                    
                    
                    
                    <tr>
                        <td colspan="5"> Medicion con aperimetro de potencia </td>
                        <td colspan="4"> Ahorros estimados</td>
                    </tr>
                    
                    <tr>
                        <td>Medición</td>
                        <td colspan="4">Potencia[KW]</td>
                        <td>Consumo estimado</td>
                        <td>Ahorro por equipo sucio o antigúo</td>
                        <td>Ahorro energetico mensual con equipo limpio</td>
                        <td>Ahorro economico mensual con equipo limpio</td>
                        <td>Costo mensual usando inverter</td>
                        <td>Costo mensual equipo convencional</td>
                            
                    </tr>
                    
                    <tr>
                        <td>Horiario</td>
                        <td>A</td>
                        <td>B</td>
                        <td>C</td>
                        <td>Total</td>
                        <td>KWh/dia</td>
                        <td>KWh/dia</td>
                        <td>KWh/mes</td>
                        <td>$/mes</td>
                        <td>$/mes</td>
                        <td>$/mes</td>
                    </tr>
                    
                    <tr>
                        <td>12:00</td>
                        <td><input type="text"></td>
                        <td><input type="text"></td>
                        <td><input type="text"></td>
                        <td><input type="text"></td>
                        <td rowspan="3"><input type="text"></td>
                        <td rowspan="3"><input type="text"></td>
                        <td rowspan="3"><input type="text"></td>
                        <td rowspan="3"><input type="text"></td>
                        <td rowspan="3"><input type="text"></td>
                        <td rowspan="3"><input type="text"></td>
                    </tr>
                    
                    <tr>
                        <td>13:30</td>
                        <td><input type="text"></td>
                        <td><input type="text"></td>
                        <td><input type="text"></td>
                        <td><input type="text"></td>
                    </tr>
                    
                    <tr>
                        <td>15:00</td>
                        <td><input type="text"></td>
                        <td><input type="text"></td>
                        <td><input type="text"></td>
                        <td><input type="text"></td>
                    </tr>
                    
                    <tr>
                        <td>Promedio</td>
                        <td><input type="text"></td>
                        <td><input type="text"></td>
                        <td><input type="text"></td>
                        <td><input type="text"></td>
                    </tr>
                    
                </table>
            
        </div>
        
    </body>
</html>
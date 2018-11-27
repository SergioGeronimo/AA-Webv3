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
        <link rel="stylesheet" href="CSS/general.css">
        <link rel="stylesheet" href="CSS/botones.css">
        <link rel="stylesheet" href="CSS/div.css">
        <title>Cálculo de carga térmica</title>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    </head>
    <body>
        
            <div class="header">
                <h1 class="title"><a class="toIndex" href="index.jsp"> AERE</a></h1>
            </div>
        
        <form>                       
        <div class="dimensionesRow" id="pasoA">
            
            <div class="dimensionesColumna">
                <h2>Ingresar datos de la empresa</h2>
                <input type="text" placeholder="Nombre de la empresa"><br>
                <input type="text" placeholder="ID area climatizada"><br>
            </div>
            <div class="dimensionesColumna">
                <h2>Ingresar datos del mantenimiento</h2>
                <input type="text" placeholder="Planta"><br>
                <input type="date" placeholder="Fecha de mantenimiento"><br>
            </div>
            <button type="button" class="navButton"><i class="material-icons">chevron_right</i></button>
        </div>
        
        <div class="dimensionesRow" id="pasoB">
            <button type="button" class="navButton"><i class="material-icons">chevron_left</i></button>
            <div class="dimensionesColumna">
                <h2> Escoge estado y ciudad de la lista desplegable</h2>
            </div>
            
            <div class="dimensionesColumna">
                <select name="estado">
                    <option value="estadoA">Estado A</option>
                    <option value="estadoB">Estado B</option>
                </select>
                <select name="ciudad">
                    <option value="ciudadA">Ciudad A</option>
                    <option value="ciudadB">Ciudad B</option>
                </select>
            </div>
            <button type="button" class="navButton"><i class="material-icons">chevron_right</i></button>
        </div>
        
        <div class="dimensionesRow">
            <button type="button" class="navButton"><i class="material-icons">chevron_left</i></button>
            <div class="dimensionesColumna">
                <h2>Ingrese las dimensiones de la sala</h2>
                <input type="text" placeholder="Alto"><br>
                <input type="text" placeholder="Ancho"><br>
                <input type="text" placeholder="Fondo"><br>
            </div>
            
            <div class="dimensionesColumna">
                <img src="assets/room.svg" class="roomIcon">
            </div>
            
            <button type="button" class="navButton"><i class="material-icons">chevron_right</i></button>
            
        </div>
        
        <div id="pasoC">
            <h2>Cálculo de carga térmica</h2>
            
                
           
            <div class="calc">
                <h3>1 - Ventanas<i class="material-icons">expand_less</i></h3>
                <div class="formTable">
                    <table class="form">
                        <tr>
                            <td>Area de la ventana del lado sur o este</td>
                            <td><input type="text" placeholder="Alto"></td>
                            <td><input type="text" placeholder="Ancho"></td>
                        </tr>
                        <tr>
                            <td>Area de la ventana del lado suroeste</td>
                            <td><input type="text" placeholder="Alto"></td>
                            <td><input type="text" placeholder="Ancho"></td>
                        </tr>
                        <tr>
                            <td>Area de la ventana del lado oeste</td>
                            <td><input type="text" placeholder="Alto"></td>
                            <td><input type="text" placeholder="Ancho"></td>
                        </tr>
                        <tr>
                            <td>Area de la ventana del lado noreste o sureste</td>
                            <td><input type="text" placeholder="Alto"></td>
                            <td><input type="text" placeholder="Ancho"></td>
                        </tr>
                        <tr>
                            <td>Area del resto de las ventanas</td>
                            
                            <td><input type="text" placeholder="Area"></td>
                        </tr>
                    </table>
                </div>
            </div>
            
            
            
            <div class="calc">
                <h3>2 - Paredes<i class="material-icons">expand_less</i></h3>
                <div class="formTable">
                    <table class="form">
                        <tr>
                            <td>Area de la pared utilizada anteriormente</td>
                            <td><input type="text" placeholder="Area"></td>
                            
                        </tr>
                        <tr>
                            <td>Area del resto de las paredes exteriores</td>
                            <td><input type="text" placeholder="Area"></td>
                            
                        </tr>
                        <tr>
                            <td>Area de todas las paredes adyacentes a un recinto no acondicionado</td>
                            <td><input type="text" placeholder="Area"></td>
                            
                        </tr>
                    </table>
                </div>
            </div>
           
            
            <div class="calc">
                <h3>3 - Techos <i class="material-icons">expand_less</i></h3>
                <div class="formTable">
                    <table class="form">
                        <tr>
                            <td>Techo con construccion arriba sin acondicionar</td>
                            <td><input type="text" placeholder="Ancho"></td>
                            <td><input type="text" placeholder="Fondo"></td>
                        </tr>
                        <tr>
                            <td>Techo con plaflón no aislado</td>
                            <td><input type="text" placeholder="Ancho"></td>
                            <td><input type="text" placeholder="Fondo"></td>
                        </tr>
                        <tr>
                            <td>Techo con plaflón y 50mm o más de aislamiento</td>
                            <td><input type="text" placeholder="Ancho"></td>
                            <td><input type="text" placeholder="Fondo"></td>
                        </tr>
                        <tr>
                            <td>Techo no aislado</td>
                            <td><input type="text" placeholder="Ancho"></td>
                            <td><input type="text" placeholder="Fondo"></td>
                        </tr>
                    </table>
                </div>
            </div>
            
            
            <div class="calc">
                <h3>4 - Otros emisores de calor<i class="material-icons">expand_less</i></h3>
                <div class="formTable">
                    <table class="form">
                        <tr>
                            <td>Numero de personas dentro del recinto</td>
                            <td><input type="text" placeholder="Numero"></td>
                        </tr>
                        <tr>
                            <td>Luz y equipos electricos en uso (Watts)</td>
                            <td><input type="text" placeholder="Watts"></td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="buttonNav">
            <button type="button" class="navButton"><i class="material-icons">chevron_left</i></button>
            <button type="button" class="navButton"><i class="material-icons">chevron_right</i></button>
            </div>
        </div>
        <div id="pasoD">
            
        <h2>Clic el equipo inverter de acuerdo a los BTU calculados para acceder a los modelos</h2>
        
            <div class="buttonList">
                <button type="button" onclic="#">12000 BTU</button>
                <button type="button" onclic="#">18000 BTU</button>
                <button type="button" onclic="#">24000 BTU</button>
                <button type="button" onclic="#">36000 BTU</button>
            </div>
        <button type="button" class="navButton"><i class="material-icons">chevron_left</i></button>
        </div>
            
         </form>    
    </body>
</html>

<%-- 
    Document   : calelect
    Created on : 26/11/2018, 06:42:02 AM
    Author     : pc
--%>
<%@page import="com.moran.db.ConsElect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel ="stylesheet" href="CSS/prueba.css">
        <title>JSP Page</title>
        <script>
            function validateNumber() {
                var x, text;

                x = document.getElementsByName("precioTarifa").value;

                
                if (isNaN(x)) {
                    text = "Nope";
                } else {
                    text = "OK";
                }
                document.getElementById("lol").innerHTML = text;
            }
            
            function isFloat(n){
                  var text = Number(n).toString() === n.toString() && n % 1 !== 0;
                  document.getElementById("lol").innerHTML = text;
            }
        </script>

    </head>
    <body>
        <p id="lol"></p>
        <%! 
            private ConsElect ce = new ConsElect();
        public boolean isNum(String num){
            boolean isN = false;
            try{
                num.replace(" ", "");
                Integer.parseInt(num);
                isN = true;
            }catch(NumberFormatException e){
                isN = false;
            }
            return isN;
        }
        %>
        <div>
            <form method="post" action = "calelect.jsp">
                <table>
                    <tr>
                        <td> DATOS DE FACTURACIÓN ELÉCTRICA </td>
                    </tr>
                   
                    <tr>
                         <td> Tarifa </td>
                        <td>
                            
                            <select name = "tarifa" onchange="this.form.submit()">
                                <option value= "#" >  </option>
                                <option value= "OM" > OM </option>
                                <option value="HM" > HM </option>
                                
                            </select>
                            <%
                                
                                String items = request.getParameter("tarifa"); 
                                out.println(items + "<BR>");
                                    
                                if(items!=null){
                                    ce.setTarifa(items);
                                }
                            %>
                        </td>
                        <td> Precio promedio tarifa ($/KWh): </td>
                        
                        <td> <input type="text" name="precioTarifa" onchange="validateNumber()">  </td>
                       
                    </tr>
                </table>
            </form>
        </div>
        
        <div>        
        <form method="post"  action = "calelect.jsp" >
            <table>
                <th> DATOS DE PLACA - INGRESE LOS VALORES EN LAS CELDAS EN COLOR AMARILLO </th>
                
                <TR>
                    <TD> TIPO DE EQUIPO: </TD>
                    <TD> Minisplit </TD>
                </TR>
                
                <TR>
                    <TD colspan="2"> UNIDAD CONDENSADORA </TD>
                </TR>
                
                <TR>
                    <TD> Marca: </TD>
                    <TD colspan="2"> Prime </TD>
                </TR>
                
                <TR>
                    <TD> Modelo </TD>
                    <TD colspan="2"></TD>
                </TR>
                
                <TR>
                    <%
                    String cap = request.getParameter("capacidadEn");
                    if(cap!=null){
                        out.println(cap + "<BR>");
                        cap.replace(" ", "");
                        out.println(cap + "<BR>");
                        if(cap != " "){
                            ce.setCapEnfriamiento(cap);
                        }
                    } 
                        
                    %>
                    <TD>Capacidad de enfiramiento: </TD>
                    <TD> <input type="text" name="capacidadEn" onchange="this.form.submit()" value="<%=ce.getCapEnfriamiento()%>" required> </TD>
                    <TD> [Btu/h] </TD>
                </TR>
                
                <TR>
                    <%
                    String pot = request.getParameter("potenciaA");
                    
                    if(pot!=null){
                        out.println(pot+ "<BR>");
                        pot.replace(" ","");
                        out.println(pot+ "<BR>");
                        if(isNum(pot)){
                            ce.setPotenciaActual(pot);
                        }else{
                            out.println("NO NUM"); 
                        }
                    } 
                    %>
                    <TD> Potencia activa: </TD>
                    <TD> <input type="text" name="potenciaA" onchange="this.form.submit()" value="<%=ce.getPotenciaActual()%>" required> </TD>
                    <TD> [W] </TD>
                </TR>
                
                <TR>
                    
                    <TD> Pot. activa po tension y corriente: </TD>
                    <TD> 2138.4 </TD>
                    <TD> [W] </TD>
                </TR>             
                
                <TR>
                    <%
                    String tension = request.getParameter("tension");
                    
                    if(tension!=null){
                        out.println(tension + "<BR>");
                        tension.replace(" ","");
                        out.println(tension + "<BR>");
                        if(isNum(tension)){
                           ce.setTension(Integer.parseInt(tension));
                        }
                    } 
                    %>
                    <TD> Tensión: </TD>
                    <TD> <input type="text" name="tension" required> </TD>
                    <TD> V </TD>
                </TR>
                
                <TR>
                    <TD> Corriente nominal: </TD>
                    <TD> <input type="text" name="corrienteNominal" required> </TD>
                    <TD> A </TD>
                </TR>
                
                <TR>
                    <TD> Refrigerante: </TD>
                    <TD colspan="2"> R-22 </TD>
                </TR>
                
                <TR>
                    <TD> EER por datos de placa: </TD>
                    <TD colspan="2"> </TD>
                </TR>
        </table>
        </form>           
        </div>
        
        <div>
        <form method="post">
            
            <table>
                 
                <th colspan="3"> Mantenimiento </th>
                <tr>
                    <td> Antigüedad: </td>
                    <td> <input type="text" name="age"> </td>
                    <td> Años </td>
                </tr>
                
                <tr>
                    <td> Condiciones actuales del equipo: </td>
                    <td colspan="2"> Sucio </td>
                </tr>
                
                <tr>
                    <td> Ciclo de operación: </td>
                    <td> <input type="text" name="cicloOperacion"> </td>
                    <td> [horas/día] </td>
                </tr>
                
                <tr>
                    <td> Días de operacion al año: </td>
                    <td colspan="2"> <input type="text" name="diasOperacion"> </td>
                </tr>
                
                <tr>
                    <td> ¿Existe programa de mantenimiento? </td>
                    <td>
                        <select>
                            <option value="Si"> Si </option>
                            <option value="No"> No </option>
                        </select>
                    </td>
                </tr>
                
                <div>
                    <tr>
                        <td> Ultimo mantenimiento: </td>
                        <td><input type="date"> </td>
                    </tr>
                    
                    <tr>
                        <td> Tipo de mantenimiento: </td>
                        <td> Preventivo </td>
                    </tr>
                    
                    <tr>
                        <td> Descripcion General </td>
                        <td> <textarea rows="4" cols="25"> </textarea> </td>
                    </tr>
                </div>
                
            </table>
                
        </form>
        </div>
        
        <div>
            <form method="post">
                            
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
                        <td>Ahorro por equipo sucio o antigüo</td>
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
            </form>
        </div>
        
    </body>
</html>

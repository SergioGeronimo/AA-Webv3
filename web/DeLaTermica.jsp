<%--
    Document   : DeLaTermica
    Created on : 27/11/2018, 03:21:29 PM
    Author     : De La Cruz Ek
--%>
<%@page import="com.moran.db.PoolDB"%>
<%@ page import= "java.sql.Connection" %>
<%@page import="com.moran.db.Factor" %>
<%@page import="com.moran.db.BTU" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

                  <% //coneccion con la Base de Datos
                      PoolDB db = PoolDB.getPool();
                      Connection con = db.getCon();
                      // variables para la temperatura y la suma total    
                      int temperatura=0;
                      float total=0;
                      // variables para la sumas
                      //  codigo para la conectar la base de datos float Area_Ancho = Factor.getArea_piso(con, temperatura);
                      
                      float Area_Ancho=0, Area_Fondo=0, Volumen_Alto=0, Volumen_Ancho=0, Volumen_Fondo=0, V1_Ancho=0,
                        V1_Alto=0, V2_Ancho=0, V2_Alto=0, V3_Ancho=0, V3_Alto=0, V4_Ancho=0, V4_Alto=0, RV_Ancho=0, 
                        RV_Alto=0, Area_De_Pared_3=0, Area_Paredes_exteriores=0, Area_Paredes_Adyacentes=0,
                        Techo_Arriba_Ancho=0, Techo_Arriba_Fondo=0, Techo_plafon_Ancho=0, Techo_plafon_Fondo=0,
                        Techo_Aislado_Ancho=0, Techo_Aislado_Fondo=0, Techo_Ancho=0, Techo_Fondo=0, Personas=0,
                        watts=0;

                  %>
                  <% //variables con el btuh total
                  float a = BTU.BTU1(Area_Ancho, Area_Fondo, Factor.getArea_piso(con , temperatura)); 
                  float b = BTU.BTU2(Volumen_Alto, Volumen_Ancho, Volumen_Fondo, Factor.getVolumen(con, temperatura));
                  float v1= BTU.BTU3(V1_Ancho, V1_Alto, Factor.getVen_Sur_est(con, temperatura));
                  float v2= BTU.BTU4(V2_Ancho, V2_Alto, Factor.getVent_sroest(con, temperatura));
                  float v3= BTU.BTU5(V3_Ancho, V3_Alto, Factor.getVent_oest(con, temperatura));
                  float v4= BTU.BTU6(V4_Ancho, V4_Alto, Factor.getVent_Nor_Sur(con, temperatura));
                  float c= BTU.BTU7(RV_Ancho, RV_Alto, Factor.getResto_Vent(con, temperatura));
                  float d= BTU.BTU8(Area_De_Pared_3, Factor.getDimension_PA_VEN(con, temperatura));
                  float e= BTU.BTU9(Area_Paredes_exteriores, Factor.getPared_ext(con, temperatura));
                  float f= BTU.BTU10(Area_Paredes_Adyacentes, Factor.getPared_ADYN(con, temperatura));
                  float g= BTU.BTU11(Techo_Arriba_Ancho, Techo_Arriba_Fondo, Factor.getTecho_CNTR_SIN_ACD(con, temperatura));
                  float h= BTU.BTU12(Techo_plafon_Ancho, Techo_plafon_Fondo, Factor.getTecho_PLF_NOA(con, temperatura));
                  float i= BTU.BTU13(Techo_Aislado_Ancho, Techo_Aislado_Fondo, Factor.getTecho_AISLado(con, temperatura));
                  float j= BTU.BTU14(Techo_Ancho, Techo_Fondo, Factor.getTecho_No_AISLD(con, temperatura));
                  float k= BTU.BTU15(Personas, Factor.getPersonas(con, temperatura));
                  float l= BTU.BTU16(watts, Factor.getLUZ_YELECTR(con, temperatura));
                  float Ventana= comparar(v1,v2,v3,v4);
                  // suma de los btuh para y dividido entre 1200
                  total= (a+b+Ventana+c+d+e+f+g+h+i+j+k+l)/1200;
                  %>
                  
            <%--          Metodo para buscar la ventana mas optima         --%>
                <%!
                    public static float comparar(float ventana_Sur_o_Este, float Suroeste, float Oeste, float Noreste_O_Sureste) {
                    float min = ventana_Sur_o_Este;
                    float max = ventana_Sur_o_Este;
                    if (Suroeste < min) {
                            min = Suroeste;
                    } else if (Suroeste > max) {
                            max = Suroeste;
                    }
                    if (Oeste < min) {
                            min = Oeste;
                    } else if (Oeste > max) {
                            max = Oeste;
                    }
                    if (Noreste_O_Sureste < min) {
                            min = Noreste_O_Sureste;
                    } else if (Noreste_O_Sureste > max) {
                            max = Noreste_O_Sureste;
                    }
                    return max;
                    }       
                %>           
         

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Calculdora</title>
            <%-- script para actualizar --%>
            <script>
                function Escritura(){
                    var x=0;
                }
            </script>
        
    </head>
    <body>
            <%--          Tabla          --%>
            <%--VARIABLE TEMPERATURA--%>
            <%

            %>
            <caption>
                   <span style="font-weight: bold;">Calculadora de Carga Termica</span>
                <br>
                    <td> BTU/H =</td>
                <br>
            </caption>  
    <table>
           <tr align="center">
                <span style="font-weight: bold;">
                    <td> 
                        Temperatura Exterior Promedio
                    </td> 
                    <td> <%--lista de temperaturas seleccionables--%>
                        <select name="<%= temperatura%>" form="lista de Temperaturas" onchange="this.form.submit()">
                            <option value=""    > </option>
                            <option value="32"   >32°</option>
                            <option value="35"   >35°</option>
                            <option value="38"   >38°</option>
                            <option value="41"   >41°</option>
                            <option value="43"   >43°</option>
                        </select> 
                    </td>
                </span>
            </tr>
                <%-- Area Del Recinto--%>
            <tr>
                <td>
                    <span style="font-weight: bold;">Area</span>
                </td>

                <td>
                      <input type="float" name="<%= Area_Ancho%>" value="" required>
                </td>
                <td>
                    <input type="float" name="<%= Area_Fondo%>" value="" required>
                </td>
            </tr>
            
                       <%--          Volumen del recinto         --%>

                       
                        <tr>
                <td>
                        <span style="font-weight: bold;">Volumen Del Recinto</span>
                </td>
                <td>
                    <input type="float" name="<%= Volumen_Alto%>" value="" required>
                </td>
                <td>
                    <input type="float" name="<%= Volumen_Ancho%>" value="" required>
                </td>
                <td>
                    <input type="float" name="<%= Volumen_Fondo%>" value="" required>
                </td>
                        </tr>

 
            
            <%--          Esqueleto Ventana         --%>
                    <tr align="center">
                    <th colspan="4">Ventanas</th>
<%--          Ventana lado sur o este                --%>                                   

                    <tr>
                        <td>
                                <span style="font-weight: bold;">Ventana Sur Este</span>
                        </td>
                        <td>
                            <input type="float" name="<%= V1_Ancho%>" value="" required>
                        </td>
                        <td>
                            <input type="float" name="<%= V1_Alto%>" value="" required>
                        </td>                    
                    </tr>    
<%--          Ventana lado suroeste                  --%>

                    <tr>
                        <td>
                                <span style="font-weight: bold;">Ventana Suroeste</span>
                        </td>
                        <td>
                            <input type="float" name="<%= V2_Ancho %>" value="" required>
                        </td>
                        <td>
                            <input type="float" name="<%= V2_Alto %>" value="" required>
                        </td>
                    </tr>
<%--          Ventana lado oeste                     --%>

                    <tr>
                        <td>
                                <span style="font-weight: bold;">Ventana Oeste</span>
                        </td>
                        <td>
                            <input type="float" name="<%= V3_Ancho%>" value="" required>
                        </td>
                        <td>
                            <input type="float" name="<%= V3_Alto%>" value="" required>
                        </td>
                    </tr>
<%--          Ventana lado Noreste o sureste         --%>

                    <tr>
                        <td>
                                <span style="font-weight: bold;">Ventana Noreste o Sureste</span>
                        </td>
                        <td>
                            <input type="float" name="<%= V4_Ancho%>" value="" required>
                        </td>
                        <td>
                            <input type="float" name="<%= V4_Alto%>" value="" required>
                        </td>
                    </tr>
            </tr>
            
            <%--          Resto Ventanas         --%>
          
            <tr>
                <td>
                        <span style="font-weight: bold;">Area Del Resto De Las Ventanas</span>
                </td>
                <td>
                    <input type="float" name="<%= RV_Ancho%>" value="" required>
                </td>
                <td>
                    <input type="float" name="<%= RV_Alto%>" value="" required>
                </td>
            </tr>
            <tr> <th colspan="4"></th> </tr>
            <tr> <th colspan="4"></th> </tr>
            <tr> <th colspan="4"></th> </tr>                                                
            <tr> <th colspan="4"></th> </tr>

              <%--          Paredes    Punto3      --%>
         

            <tr>
                <td>
                    <span style="font-weight: bold;">Area De La Pared Utilizada En El Punto 3 <br>(No Incluir La Dimensíon De La Ventana)</span>
                </td>
                <td>
                    <input type="float" name="<%= Area_De_Pared_3 %>" value="" required>
                </td>
            </tr>
            
            <%--          Paredes          --%>

            <tr>
                <td>
                        <span style="font-weight: bold;">Area Del Resto De Las Paredes Exteriores <br>(No Incluir La Dimension De La Ventana</span>
                </td>
                <td>
                    <input type="float" name="<%= Area_Paredes_exteriores %>" value="" required>
                </td>
            </tr>
           
            <%--          Paredes Adyacentes         --%>

            <tr>
                <td>
                    <span style="font-weight: bold;">Area De Todas Las Paredes Adyacentes<br> A Un Recinto No Acondicionado</span>
                </td>
                <td>
                    <input type="float" name="<%= Area_Paredes_Adyacentes %>" value="" required>
                </td>
            </tr>
           
            <%--          Techos         --%>
            <tr algin="center">
                <th colspan="4">Techos</th>
<%--          Techo con construccion arriba sin acondicionar         --%>

                        <tr> 
                            <td>
                               <span style="font-weight: bold;">Techo Con Construccion Arriba Sin Acondicionar</span>
                            </td>
                            <td>
                                <input type="float" name="<%= Techo_Arriba_Ancho%>" value="" required>
                            </td>
                            <td>
                                <input type="float" name="<%= Techo_Arriba_Fondo%>" value="" required>
                            </td>
                        </tr>
<%--                    Techo con plafon no aislado                  --%>

                            <tr>
                            <td>
                               <span style="font-weight: bold;">Techo Con Plafon NO Aislado</span>
                            </td>
                            <td>
                                <input type="float" name="<%= Techo_plafon_Ancho%>" value="" required>
                            </td>
                            <td>
                                <input type="float" name="<%= Techo_plafon_Fondo%>" value="" required>
                            </td>
                        </tr>
<%--          Techo con plafon y 50 mm.(2")omas de aislamiento         --%>

                            <tr>
                            <td>
                               <span style="font-weight: bold;">Techado Con Plafon Y 50 mm. (2") O Más De Aislamiento</span>
                            </td>
                            <td>
                                <input type="float" name="<%= Techo_Aislado_Ancho%>" value="" required>
                            </td>
                            <td>
                                <input type="float" name="<%= Techo_Aislado_Fondo %>" value="" required>
                            </td>
                        </tr>
<%--                              Techo no aislado                       --%>
 
                            <tr>
                            <td>
                               <span style="font-weight: bold;">Techado No Aislado</span>
                            </td>
                            <td>
                                <input type="float" name="<%= Techo_Ancho%>" value="" required>
                            </td>
                            <td>
                                <input type="float" name="<%= Techo_Fondo%>" value="" required>
                            </td>
                        </tr>
            </tr>
                <tr> <th colspan="4"></th> </tr>            
            
               <%--          Num de personas dentro del recinto         --%>
           
            <tr>
                <td>
                        <span style="font-weight: bold;">NUM. De Personas Dentro Del Recinto</span>
                </td>
                <td>
                    <input type="float" name="<%= Personas%>" value="" required>
                </td>

            </tr>
            
           <%--          Luz y equipos electricos en uso (watts)         --%>

            <tr>
                <td>
                        <span style="font-weight: bold;">Luz Y Equipos Electricos En Uso (WATTS)</span>
                </td>
                <td>
                    <input type="float" name="<%= watts %>" value="" required>
                </td>
            </tr>
    </table>        

    </body>
</html>

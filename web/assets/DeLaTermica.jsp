<%-- 
    Document   : DeLaTermica
    Created on : 26/11/2018, 07:26:51 PM
    Author     : De La Cruz Ek
--%>
<%@page import="com.moran.db.BTU" %>
<%@ page import= "java.sql.Connection" %>
<%@ page import ="java.sql.ResultSet" %>
<%@ page import ="java.sql.SQLException" %>
<%@ page import ="java.sql.Statement" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
            <%--          Tabla               --%>
        <table style="text-align: left; width: 100%; margin-left: auto; margin-right: auto;"border="3" cellpadding="2" cellspacing="2">
            <caption>
                   <span style="font-weight: bold;">Calculadora de Carga Termica
                   </span>
                    <br>
            </caption>  
         <tbody>
             
             
             <%int Temperatura=0;%> <%/* variable para las temperaturas promedio anuales */%>
          
            <%--          Temperaturas entrantes(Temperatura exterior promedio               --%>            
             <tr align="center">
                        <span style="font-weight: bold;">
                            <td> Temperatura Exterior Promedio
                            </td> 
                            <td>
                                <select name="<%= Temperatura%>" form="lista de Temperaturas" onchange="this.form.submit()">
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
            <%
             String Factor_Multi1=("SELECT area_piso FROM multiplicador WHERE promedio_temp = '"+Temperatura+"' ");
             int Factor_Multi1E = Integer.parseInt(Factor_Multi1);
             
             String Factor_Multi2=("SELECT Volumen FROM multiplicador WHERE promedio_temp = '"+Temperatura+"' ");
             int Factor_Multi2E = Integer.parseInt(Factor_Multi2);
             
             String Factor_Multi3=("SELECT vent_Sur_est FROM multiplicador WHERE promedio_temp = '"+Temperatura+"' ");
             int Factor_Multi3E = Integer.parseInt(Factor_Multi3);
             
             String Factor_Multi4=("SELECT Vent_sroest FROM multiplicador WHERE promedio_temp = '"+Temperatura+"' ");
             int Factor_Multi4E = Integer.parseInt(Factor_Multi4);
             
             String Factor_Multi5=("SELECT Vent_oest FROM multiplicador WHERE promedio_temp = '"+Temperatura+"' ");
             int Factor_Multi5E = Integer.parseInt(Factor_Multi5);
             
             String Factor_Multi6=("SELECT vent_Nor_Sur FROM multiplicador WHERE promedio_temp = '"+Temperatura+"' ");
             int Factor_Multi6E = Integer.parseInt(Factor_Multi6);
             
             String Factor_Multi7=("SELECT resto_Vent FROM multiplicador WHERE promedio_temp = '"+Temperatura+"' ");
             int Factor_Multi7E = Integer.parseInt(Factor_Multi7);
             
             String Factor_Multi8=("SELECT dimension_PA_VEN FROM multiplicador WHERE promedio_temp = '"+Temperatura+"' ");
             int Factor_Multi8E = Integer.parseInt(Factor_Multi8);
             
             String Factor_Multi9=("SELECT Pared_ext FROM multiplicador WHERE promedio_temp = '"+Temperatura+"' ");
             int Factor_Multi9E = Integer.parseInt(Factor_Multi9);
             
             String Factor_Multi10=("SELECT Pared_ADYN FROM multiplicador WHERE promedio_temp = '"+Temperatura+"' ");
             int Factor_Multi10E = Integer.parseInt(Factor_Multi10);
             
             String Factor_Multi11=("SELECT Techo_CNTR_SIN_ACD FROM multiplicador WHERE promedio_temp = '"+Temperatura+"' ");
             int Factor_Multi11E = Integer.parseInt(Factor_Multi11);
             
             String Factor_Multi12=("SELECT Techo_PLF_NOA FROM multiplicador WHERE promedio_temp = '"+Temperatura+"' ");
             int Factor_Multi12E = Integer.parseInt(Factor_Multi12);
             
             String Factor_Multi13=("SELECT TechoAISLado FROM multiplicador WHERE promedio_temp = '"+Temperatura+"' ");
             int Factor_Multi13E = Integer.parseInt(Factor_Multi13);
             
             String Factor_Multi14=("SELECT Techo_NO_AISLD FROM multiplicador WHERE promedio_temp = '"+Temperatura+"' ");
             int Factor_Multi14E = Integer.parseInt(Factor_Multi14);
             
             String Factor_Multi15=("SELECT personas FROM multiplicador WHERE promedio_temp = '"+Temperatura+"' ");
             int Factor_Multi15E = Integer.parseInt(Factor_Multi15);
             
             String Factor_Multi16=("SELECT LUZ_YELECTR FROM multiplicador WHERE promedio_temp = '"+Temperatura+"' ");
             int Factor_Multi16E = Integer.parseInt(Factor_Multi16);
            %>
           
                       <%--          Area del piso               --%>
            <tr>
                <td>
                        <span style="font-weight: bold;">Area</span>
                </td>
                <% 
                float Area_Ancho= 0;
                %>
                <td>
                    <input type="float" name="<%= Area_Ancho%>" value="" required>
                </td>
                <td>
                    <input type="float" name="Area_Fondo" value="" required>
                </td>
            </tr>
            
                       <%--          Volumen del recinto         --%>
            <tr>
                <td>
                        <span style="font-weight: bold;">Volumen Del Recinto</span>
                </td>
                <td>
                    <input type="float" name="Volumen_Alto" value="" required>
                </td>
                <td>
                    <input type="float" name="Volumen_Ancho" value="" required>
                </td>
                <td>
                    <input type="float" name="Volumen_Fondo" value="" required>
                </td>
            </tr>
          
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
 
            
            <%--          Esqueleto Ventana         --%>
                    <tr align="center">
                    <th colspan="4">Ventanas</th>
<%--          Ventana lado sur o este                --%>                                   
                    <tr>
                        <td>
                                <span style="font-weight: bold;">Ventana Sur Este</span>
                        </td>
                        <td>
                            <input type="float" name="V1_Ancho" value="" required>
                        </td>
                        <td>
                            <input type="float" name="V1_Alto" value="" required>
                        </td>                    
                    </tr>    
<%--          Ventana lado suroeste                  --%>
                    <tr>
                        <td>
                                <span style="font-weight: bold;">Ventana Suroeste</span>
                        </td>
                        <td>
                            <input type="float" name="V2_Ancho" value="" required>
                        </td>
                        <td>
                            <input type="float" name="V2_Alto" value="" required>
                        </td>
                    </tr>
<%--          Ventana lado oeste                     --%>
                    <tr>
                        <td>
                                <span style="font-weight: bold;">Ventana Oeste</span>
                        </td>
                        <td>
                            <input type="float" name="V3_Ancho" value="" required>
                        </td>
                        <td>
                            <input type="float" name="V3_Alto" value="" required>
                        </td>
                    </tr>
<%--          Ventana lado Noreste o sureste         --%>                    
                    <tr>
                        <td>
                                <span style="font-weight: bold;">Ventana Noreste o Sureste</span>
                        </td>
                        <td>
                            <input type="float" name="V4_Ancho" value="" required>
                        </td>
                        <td>
                            <input type="float" name="V4_Alto" value="" required>
                        </td>
                    </tr>
            </tr>
            
            <%--          Resto Ventanas         --%>
            <tr>
                <td>
                        <span style="font-weight: bold;">Area Del Resto De Las Ventanas</span>
                </td>
                <td>
                    <input type="float" name="RV_Ancho" value="" required>
                </td>
                <td>
                    <input type="float" name="RV_Alto" value="" required>
                </td>
            </tr>
            <tr> <th colspan="4"></th> </tr>
            <tr>
                <td>
                    <span style="font-weight: bold;">Area De La Pared Utilizada En El Punto 3 <br>(No Incluir La Dimensíon De La Ventana)</span>
                </td>
                <td>
                    <input type="float" name="Area_De_Pared_3" value="" required>
                </td>
            </tr>
            
            <%--          Paredes Exteriores         --%>
            <tr>
                <td>
                        <span style="font-weight: bold;">Area Del Resto De Las Paredes Exteriores <br>(No Incluir La Dimension De La Ventana</span>
                </td>
                <td>
                    <input type="float" name="Area_Paredes_exteriores" value="" required>
                </td>
            </tr>
           
            <%--          Paredes Adyacentes         --%>
            <tr>
                <td>
                    <span style="font-weight: bold;">Area De Todas Las Paredes Adyacentes<br> A Un Recinto No Acondicionado</span>
                </td>
                <td>
                    <input type="float" name="Area_Paredes_Adyacentes" value="" required>
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
                                <input type="float" name="Techo_Arriba_Ancho" value="" required>
                            </td>
                            <td>
                                <input type="float" name="Techo_Arriba_Fondo" value="" required>
                            </td>
                        </tr>
<%--                    Techo con plafon no aislado                  --%>
                            <tr>
                            <td>
                               <span style="font-weight: bold;">Techo Con Plafon NO Aislado</span>
                            </td>
                            <td>
                                <input type="float" name="Techo_plafon_Ancho" value="" required>
                            </td>
                            <td>
                                <input type="float" name="Techo_plafon_Fondo" value="" required>
                            </td>
                        </tr>
<%--          Techo con plafon y 50 mm.(2")omas de aislamiento         --%>
                            <tr>
                            <td>
                               <span style="font-weight: bold;">Techado Con Plafon Y 50 mm. (2") O Más De Aislamiento</span>
                            </td>
                            <td>
                                <input type="float" name="Techo_Aislado_Ancho" value="" required>
                            </td>
                            <td>
                                <input type="float" name="Techo_Aislado_Fondo" value="" required>
                            </td>
                        </tr>
<%--                              Techo no aislado                       --%>
                            <tr>
                            <td>
                               <span style="font-weight: bold;">Techado No Aislado</span>
                            </td>
                            <td>
                                <input type="float" name="Techo_Ancho" value="" required>
                            </td>
                            <td>
                                <input type="float" name="Techo_Fondo" value="" required>
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
                    <input type="float" name="Personas" value="" required>
                </td>

            </tr>
            
           <%--          Luz y equipos electricos en uso (watts)         --%>
            <tr>
                <td>
                        <span style="font-weight: bold;">Luz Y Equipos Electricos En Uso (WATTS)</span>
                </td>
                <td>
                    <input type="float" name="watts" value="" required>
                </td>
            </tr>
        </tbody>
        </table>
    </body>
</html>

<%-- 
    Document   : DeLaTermica
    Created on : 26/11/2018, 07:26:51 PM
    Author     : De La Cruz Ek
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <table style="text-align: left; width: 100%; margin-left: auto; margin-right: auto;"border="3" cellpadding="2" cellspacing="2">
            <caption>
                   <span style="font-weight: bold;">Calculadora de Carga Termica
                   </span>
                    <br>
            </caption>  
         <tbody>
            <tr align="center">
                        <span style="font-weight: bold;">
                            <td> Temperatura Exterior Promedio
                            </td> 
                            <td>
                                <select name="select" form="lista de Temperaturas" onchange="this.form.submit()">
                                    <option value=""    > </option>
                                    <option value="0"   >32°</option>
                                    <option value="1"   >35°</option>
                                    <option value="2"   >38°</option>
                                    <option value="3"   >41°</option>
                                    <option value="4"   >43°</option>
                                </select> 
                            </td>
                        </span>
            </tr>
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
            
            <tr align="center">
                    <th colspan="4">Ventanas</th>
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
            <tr>
                <td>
                        <span style="font-weight: bold;">Area Del Resto De Las Paredes Exteriores <br>(No Incluir La Dimension De La Ventana</span>
                </td>
                <td>
                    <input type="float" name="Area_Paredes_exteriores" value="" required>
                </td>
            </tr>
            <tr>
                <td>
                    <span style="font-weight: bold;">Area De Todas Las Paredes Adyacentes<br> A Un Recinto No Acondicionado</span>
                </td>
                <td>
                    <input type="float" name="Area_Paredes_Adyacentes" value="" required>
                </td>
            </tr>
            <tr algin="center">
                <th colspan="4">Techos</th>
                        <tr> <td>
                               <span style="font-weight: bold;">Techo Con Construccion Arriba Sin Acondicionar</span>
                            </td>
                            <td>
                                <input type="float" name="Techo_Arriba_Ancho" value="" required>
                            </td>
                            <td>
                                <input type="float" name="Techo_Arriba_Fondo" value="" required>
                            </td>
                        </tr>
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
            <tr>
                <td>
                        <span style="font-weight: bold;">NUM. De Personas Dentro Del Recinto</span>
                </td>
                <td>
                    <input type="float" name="Personas" value="" required>
                </td>

            </tr>
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
        
        <%/*
        <div>
            <form method="post" action = "DeLa<Termica.jsp">
                <table>
                <tr>
                    
                </tr> 
                
                <tr>
                    <td> Nombre del area</td>
                    <td> Alto</td>
                    <td> Ancho</td>
                    
                </tr>
                </table>
            </form>
           
        </div>
        */%>
        
    </body>
</html>

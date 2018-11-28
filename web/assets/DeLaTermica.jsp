<%-- 
    Document   : DeLaTermica
    Created on : 26/11/2018, 07:26:51 PM
    Author     : De La Cruz Ek
--%>
<%@page import="com.moran.db.PoolDB"%>
<%@ page import= "java.sql.Connection" %>
<%--@page import="com.moran.db.BTU" %>
<%@page import="com.moran.db.Factor" %>
<%@page import="com.moran.db.Termica"%>
<%@ page import ="java.sql.ResultSet" %>
<%@ page import ="java.sql.SQLException" %>
<%@ page import ="java.sql.Statement" %>
<%@page contentType="text/html" pageEncoding="UTF-8"--%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Calculadora De BTU/H</title>
    </head>
    <body>
            <%--          Tabla          --%>
        
            <caption>
                   <span style="font-weight: bold;">Calculadora de Carga Termica
                   </span>
                    <br>
            </caption>  
             
    <%-- variable para las temperaturas promedio anuales --%>             
            <%--          Lista De Temperaturas entrantes(Temperatura exterior promedio               --%>            
            <%
            Connection con = PoolDB.getCon();
            int temperatura =0;
            float temperatura_1=32;
            float temperatura_2=35;
            float temperatura_3=38;
            float temperatura_4=41;
            float temperatura_5=43;
            %>
 
            <tr align="center">
                        <span style="font-weight: bold;">
                            <td> Temperatura Exterior Promedio
                            </td> 
                            <td> <%--lista de temperaturas seleccionables--%>
                                <select name="<%= temperatura%>" form="lista de Temperaturas" onchange="this.form.submit()">
                                    <option value=""    > </option>
                                    <option value="<%= temperatura_1%>"   >32°</option>
                                    <option value="<%= temperatura_2%>"   >35°</option>
                                    <option value="<%= temperatura_3%>"   >38°</option>
                                    <option value="<%= temperatura_4%>"   >41°</option>
                                    <option value="<%= temperatura_5%>"   >43°</option>
                                </select> 
                            </td>
                        </span>
            </tr>
             
            <tr>
                <td>
                        <span style="font-weight: bold;">Area</span>
                </td>
                   <%
                    float Area_Ancho=com.moran.db.Termica.getAreaPiso_ancho();
                    float Area_Fondo=com.moran.db.Termica.getAreaPiso_fondo();
                    int Factor1=com.moran.db.Factor.getArea_piso(com.moran.db.PoolDB.getCon(),temperatura);
                     /* Posible error de calculo en esta parte por Factor1 */
                    float BTU0=com.moran.db.BTU.BTU1(Area_Ancho, Area_Fondo, Factor1);
                    %>
                <td>
                    <input type="float" name="Area_Ancho" value="" required>
                </td>
                <td>
                    <input type="float" name="Area_Fondo%>" value="" required>
                </td>
            </tr>
            
                       <%--          Volumen del recinto         --%>
                <%  
                float Volumen_Alto=com.moran.db.Termica.getVolRecinto_alto();
                float Volumen_Ancho=com.moran.db.Termica.getVolRecinto_ancho();
                float Volumen_Fondo=com.moran.db.Termica.getVolRecinto_fondo();
                int Factor2=com.moran.db.Factor.getVolumen(com.moran.db.PoolDB.getCon(),temperatura);
                float volXAncho=Volumen_Alto*Volumen_Ancho;
                float BTU2=com.moran.db.BTU.BTU2(volXAncho,Volumen_Fondo,Factor2);
                %>
                       
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

 
            
            <%--          Esqueleto Ventana         --%>
                    <tr align="center">
                    <th colspan="4">Ventanas</th>
<%--          Ventana lado sur o este                --%>                                   
                <%  
                float V1_Ancho=com.moran.db.Termica.getVenLadoSoE_ancho();
                float V1_Alto=com.moran.db.Termica.getVenLadoSoE_alto();
                int Factor3=com.moran.db.Factor.getVen_Sur_est(com.moran.db.PoolDB.getCon(),temperatura);
                float BTU3=com.moran.db.BTU.BTU3(V1_Ancho,V1_Alto,Factor3);
                %>
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
                <%  
                float V2_Ancho=com.moran.db.Termica.getVenLadoSuroEste_ancho();
                float V2_Alto=com.moran.db.Termica.getVenLadoSuroEste_alto();
                int Factor4=com.moran.db.Factor.getVent_sroest(com.moran.db.PoolDB.getCon(),temperatura);
                float BTU4=com.moran.db.BTU.BTU4(V2_Ancho,V2_Alto,Factor4);
                %>
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
                <%  
                float V3_Ancho=com.moran.db.Termica.getVenLadoOeste_ancho();
                float V3_Alto=com.moran.db.Termica.getVenLadoOeste_alto();
                int Factor5=com.moran.db.Factor.getVent_oest(com.moran.db.PoolDB.getCon(),temperatura);
                float BTU5=com.moran.db.BTU.BTU5(V3_Ancho,V3_Alto,Factor5);
                %>
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
                <%  
                float V4_Ancho=com.moran.db.Termica.getVenLadoNoEoSurE_ancho();
                float V4_Alto=com.moran.db.Termica.getVenLadoNoEoSurE_alto();
                int Factor6=com.moran.db.Factor.getVent_Nor_Sur(com.moran.db.PoolDB.getCon(),temperatura);
                float BTU6=com.moran.db.BTU.BTU6(V4_Ancho,V4_Alto,Factor6);
                %>
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
                <%  
                float resto_ven_alto=com.moran.db.Termica.getAreaRestoVen_ancho();
                float resto_ven_ancho=com.moran.db.Termica.getAreaRestoVen_alto();
                int Factor7=com.moran.db.Factor.getResto_Vent(com.moran.db.PoolDB.getCon(),temperatura);
                float BTU7=com.moran.db.BTU.BTU6(resto_ven_ancho,resto_ven_alto,Factor7);
                %>           
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
              <%--          Paredes    Punto3      --%>
         
            <%  
                float area_pared_p3=com.moran.db.Termica.getAreaPared();
                int Factor8=com.moran.db.Factor.getDimension_PA_VEN(com.moran.db.PoolDB.getCon(),temperatura);
                float BTU8=com.moran.db.BTU.BTU8(area_pared_p3,Factor8);
            %>
            <tr>
                <td>
                    <span style="font-weight: bold;">Area De La Pared Utilizada En El Punto 3 <br>(No Incluir La Dimensíon De La Ventana)</span>
                </td>
                <td>
                    <input type="float" name="Area_De_Pared_3" value="" required>
                </td>
            </tr>
            
            <%--          Paredes          --%>
            <%  
                float area_pared_rest_ext=com.moran.db.Termica.getRestoPared();
                int Factor9=com.moran.db.Factor.getPared_ext(com.moran.db.PoolDB.getCon(),temperatura);
                float BTU9=com.moran.db.BTU.BTU9(area_pared_rest_ext,Factor9);
            %>
            <tr>
                <td>
                        <span style="font-weight: bold;">Area Del Resto De Las Paredes Exteriores <br>(No Incluir La Dimension De La Ventana</span>
                </td>
                <td>
                    <input type="float" name="Area_Paredes_exteriores" value="" required>
                </td>
            </tr>
           
            <%--          Paredes Adyacentes         --%>
            <%  
                float area_pared_ady=com.moran.db.Termica.getAreaAdyacente();
                int Factor10=com.moran.db.Factor.getPared_ADYN(com.moran.db.PoolDB.getCon(),temperatura);
                float BTU10=com.moran.db.BTU.BTU10(area_pared_ady,Factor10);
            %>
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
                <%  
                float techo_arriba_fondo=com.moran.db.Termica.getTechoArriba_fondo();
                float techo_Arriba_ancho=com.moran.db.Termica.getTechoArriba_ancho();
                int Factor11=com.moran.db.Factor.getTecho_CNTR_SIN_ACD(com.moran.db.PoolDB.getCon(),temperatura);
                float BTU11=com.moran.db.BTU.BTU11(techo_arriba_fondo,techo_Arriba_ancho,Factor11);
                %>
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
                <%  
                float techo_no_aislado_fondo=com.moran.db.Termica.getTechoNoAislado_fondo();
                float techo_no_aislado_ancho=com.moran.db.Termica.getTechoNoAislado_ancho();
                int Factor12=com.moran.db.Factor.getTecho_PLF_NOA(com.moran.db.PoolDB.getCon(),temperatura);
                float BTU12=com.moran.db.BTU.BTU12(techo_no_aislado_fondo,techo_no_aislado_ancho,Factor12);
                %>
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
                <%  
                float techo_plafon_ais_fondo=com.moran.db.Termica.getTechadoPlafon_fondo();
                float techo_plafon_ais_ancho=com.moran.db.Termica.getTechadoPlafon_ancho();
                int Factor13=com.moran.db.Factor.getTecho_AISLado(com.moran.db.PoolDB.getCon(),temperatura);
                float BTU13=com.moran.db.BTU.BTU13(techo_plafon_ais_fondo,techo_plafon_ais_ancho,Factor13);
                %>
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
                <%  
                float techo_no_ais_fondo=com.moran.db.Termica.getTechadoNoAislado_fondo();
                float techo_no_ais_ancho=com.moran.db.Termica.getTechadoNoAislado_ancho();
                int Factor14=com.moran.db.Factor.getTecho_No_AISLD(com.moran.db.PoolDB.getCon(),temperatura);
                float BTU14=com.moran.db.BTU.BTU14(techo_no_ais_fondo,techo_no_ais_ancho,Factor14);
                %>
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
                <%  
                float num_personas=com.moran.db.Termica.getNumPerson();
                int Factor15=com.moran.db.Factor.getPersonas(com.moran.db.PoolDB.getCon(),temperatura);
                float BTU15=com.moran.db.BTU.BTU15(num_personas,Factor15);
                %>               
            <tr>
                <td>
                        <span style="font-weight: bold;">NUM. De Personas Dentro Del Recinto</span>
                </td>
                <td>
                    <input type="float" name="Personas" value="" required>
                </td>

            </tr>
            
           <%--          Luz y equipos electricos en uso (watts)         --%>
                <%  
                float luz_equipos=com.moran.db.Termica.getLuzEquipos();
                int Factor16=com.moran.db.Factor.getLUZ_YELECTR(com.moran.db.PoolDB.getCon(),temperatura);
                float BTU16=com.moran.db.BTU.BTU16(luz_equipos,Factor16);
                %> 
            <tr>
                <td>
                        <span style="font-weight: bold;">Luz Y Equipos Electricos En Uso (WATTS)</span>
                </td>
                <td>
                    <input type="float" name="watts" value="" required>
                </td>
            </tr>
        
        
    </body>
</html>

<%--JAVA--%>
          
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
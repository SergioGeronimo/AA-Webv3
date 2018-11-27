package com.moran.db;

    
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Factor {
    private Statement smt;
    private ResultSet rs;
   
    
    //punto 1 Area del piso.
    public int getArea_piso(Connection con, int temAnual){
        int aux = 0;
         try {
            smt = con.createStatement();
            String sql = "SELECT area_piso FROM multiplicador WHERE promedio_temp = '"+temAnual+"'";
            rs = smt.executeQuery(sql);
            while(rs.next())
                aux = Integer.parseInt(rs.getString(1));
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
         return aux;
    }
    
    //punto 2. Volumen del recinto
    public int getVolumen(Connection con, int temAnual){
        int aux = 0;
         try {
            smt = con.createStatement();
            String sql = "SELECT Volumen FROM multiplicador WHERE promedio_temp = '"+temAnual+"'";
            rs = smt.executeQuery(sql);
            while(rs.next())
                aux = Integer.parseInt(rs.getString(1));
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
         return aux;
    }
    
    
    //punto 3.
    //ventana lado sur o este
    public int getVen_Sur_est(Connection con, int temAnual){
        int aux = 0;
         try {
            smt = con.createStatement();
            String sql = "SELECT vent_Sur_est FROM multiplicador WHERE promedio_temp = '"+temAnual+"'";
            rs = smt.executeQuery(sql);
            while(rs.next())
                aux = Integer.parseInt(rs.getString(1));
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
         return aux;
    }
    //ventana lado suroeste
    public int getVent_sroest(Connection con, int temAnual){
        int aux = 0;
         try {
            smt = con.createStatement();
            String sql = "SELECT vent_sroest FROM multiplicador WHERE promedio_temp = '"+temAnual+"'";
            rs = smt.executeQuery(sql);
            while(rs.next())
                aux = Integer.parseInt(rs.getString(1));
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
         return aux;
    }
    //ventana  lado oeste
    public int getVent_oest(Connection con, int temAnual){
        int aux = 0;
         try {
            smt = con.createStatement();
            String sql = "SELECT Vent_oest FROM multiplicador WHERE promedio_temp = '"+temAnual+"'";
            rs = smt.executeQuery(sql);
            while(rs.next())
                aux = Integer.parseInt(rs.getString(1));
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
         return aux;
    }
    //Ventada lado noroeste o suroeste
    public int getVent_Nor_Sur(Connection con, int temAnual){
        int aux = 0;
         try {
            smt = con.createStatement();
            String sql = "SELECT vent_Nor_Sur FROM multiplicador WHERE promedio_temp = '"+temAnual+"'";
            rs = smt.executeQuery(sql);
            while(rs.next())
                aux = Integer.parseInt(rs.getString(1));
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
         return aux;
    }
    
    //punto 4. resto de las vventanas
    public int getResto_Vent(Connection con, int temAnual){
        int aux = 0;
         try {
            smt = con.createStatement();
            String sql = "SELECT resto_Vent FROM multiplicador WHERE promedio_temp = '"+temAnual+"'";
            rs = smt.executeQuery(sql);
            while(rs.next())
                aux = Integer.parseInt(rs.getString(1));
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
         return aux;
    }
    
    //punt 5. area de la pared utilizada en el punto 3
    public int getDimension_PA_VEN(Connection con, int temAnual){
        int aux = 0;
         try {
            smt = con.createStatement();
            String sql = "SELECT dimension_PA_VEN FROM multiplicador WHERE promedio_temp = '"+temAnual+"'";
            rs = smt.executeQuery(sql);
            while(rs.next())
                aux = Integer.parseInt(rs.getString(1));
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
         return aux;
    }
    
    //resto de las paredes exteriores 
    public int getPared_ext(Connection con, int temAnual){
        int aux = 0;
         try {
            smt = con.createStatement();
            String sql = "SELECT Pared_ext FROM multiplicador WHERE promedio_temp = '"+temAnual+"'";
            rs = smt.executeQuery(sql);
            while(rs.next())
                aux = Integer.parseInt(rs.getString(1));
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
         return aux;
    }
    
    //punto 7. area de todas las peredes adyacentes
    public int getPared_ADYN(Connection con, int temAnual){
        int aux = 0;
         try {
            smt = con.createStatement();
            String sql = "SELECT Pared_ADYN FROM multiplicador WHERE promedio_temp = '"+temAnual+"'";
            rs = smt.executeQuery(sql);
            while(rs.next())
                aux = Integer.parseInt(rs.getString(1));
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
         return aux;
    }
    
    //punto 8.
    //techo sin acondicionar
    public int getTecho_CNTR_SIN_ACD(Connection con, int temAnual){
        int aux = 0;
         try {
            smt = con.createStatement();
            String sql = "SELECT Techo_CNTR_SIN_ACD FROM multiplicador WHERE promedio_temp = '"+temAnual+"'";
            rs = smt.executeQuery(sql);
            while(rs.next())
                aux = Integer.parseInt(rs.getString(1));
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
         return aux;
    }
    //techo con plafon no aislado
    public int getTecho_PLF_NOA(Connection con, int temAnual){
        int aux = 0;
         try {
            smt = con.createStatement();
            String sql = "SELECT Techo_PLF_NOA FROM multiplicador WHERE promedio_temp = '"+temAnual+"'";
            rs = smt.executeQuery(sql);
            while(rs.next())
                aux = Integer.parseInt(rs.getString(1));
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
         return aux;
    }
    //techado con plafon aislado
    public int getTecho_AISLado(Connection con, int temAnual){
        int aux = 0;
         try {
            smt = con.createStatement();
            String sql = "SELECT Techo_AISLado FROM multiplicador WHERE promedio_temp = '"+temAnual+"'";
            rs = smt.executeQuery(sql);
            while(rs.next())
                aux = Integer.parseInt(rs.getString(1));
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
         return aux;
    }
    //techado no aislado
    public int getTecho_No_AISLD(Connection con, int temAnual){
        int aux = 0;
         try {
            smt = con.createStatement();
            String sql = "SELECT Techo_No_AISLD FROM multiplicador WHERE promedio_temp = '"+temAnual+"'";
            rs = smt.executeQuery(sql);
            while(rs.next())
                aux = Integer.parseInt(rs.getString(1));
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
         return aux;
    }
    
    //punto 9. numero de personas 
    public int getPersonas(Connection con, int temAnual){
        int aux = 0;
         try {
            smt = con.createStatement();
            String sql = "SELECT personas FROM multiplicador WHERE promedio_temp = '"+temAnual+"'";
            rs = smt.executeQuery(sql);
            while(rs.next())
                aux = Integer.parseInt(rs.getString(1));
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
         return aux;
    }
    
    //punt 10. luz y equipos electricos
    public int getLUZ_YELECTR(Connection con, int temAnual){
        int aux = 0;
         try {
            smt = con.createStatement();
            String sql = "SELECT LUZ_YELECTR FROM multiplicador WHERE promedio_temp = '"+temAnual+"'";
            rs = smt.executeQuery(sql);
            while(rs.next())
                aux = Integer.parseInt(rs.getString(1));
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
         return aux;
    }
}

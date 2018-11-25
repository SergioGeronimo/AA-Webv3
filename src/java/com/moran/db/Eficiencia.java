package com.moran.db;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author pc
 */
public class Eficiencia {
    
    private static int temInput, humInput, temOutput, humOutput;
    private static float humEspInput, humEspOutput, velInyection, largo, ancho;
    private static float area;
    private static Statement smt;
    private static ResultSet rs;
    
    public static void main(String[] args) {
        Connection con = PoolDB.getPool().getCon();
       
        setTemInput(22);
        setHumInput(80);
        setTemOutput(11);
        setHumOutput(45);
        setVelInyection(2.1f);
        setAncho(.1f);
        setLargo(.85f);
        setArea();
        try{
            System.out.println("Diferencia de humedad especifica: " + diferenciaTemperatura());
            System.out.println("humedad especifica de entrada: " + getHumEspInput(con));
            System.out.println("Humedad especifica de salida: " + getHumEspOutput(con));
            System.out.println("Diferencia humedad especifica: " + diferenciaHumEsp());
            System.out.println("Flujo maximo de aire: " + flujoMaxAire());
            System.out.println("Calor sencible: " + calorSensible());
            System.out.println("Calor Latente: " + calorLatente());
            System.out.println("Cantidad de calor extraida por el equipo: " + cantidadCalorExtraida());
            
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(Eficiencia.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
    }

    public Eficiencia(){
        
    }
    public Eficiencia(int temInput, int humInput, int temOutput, int humOutput, float velInyection, float largo, float ancho) {
        Eficiencia.temInput = temInput;
        Eficiencia.humInput = humInput;
        Eficiencia.temOutput = temOutput;
        Eficiencia.humOutput = humOutput;
        Eficiencia.velInyection = velInyection;
        Eficiencia.largo = largo;
        Eficiencia.ancho = ancho;
    }
    
    
    
    public static float getHumEspInput(Connection con) {
        try {
            smt = con.createStatement();
            String sql = "SELECT humEspecifica FROM aire_entrada WHERE temperaturaEntrada = '"+ Eficiencia.temInput + "' AND humRelativa = '" + Eficiencia.humInput+"'";
            rs = smt.executeQuery(sql);
            while(rs.next())
                humEspInput = Float.parseFloat(rs.getString(1));
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        
        return humEspInput;
    }
    
    public static float getHumEspOutput(Connection con) {
        try {
            smt = con.createStatement();
            String sql = "SELECT humEspecificaS FROM aire_inyeccion WHERE temperaturaSalida = '"+ Eficiencia.temOutput + "' AND humRelativaS = '" + Eficiencia.humOutput+"'";
            rs = smt.executeQuery(sql);
            while(rs.next())
                humEspOutput = Float.parseFloat(rs.getString(1));
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        
        return humEspOutput;
    }
    
    public static int diferenciaTemperatura(){
        return Eficiencia.temInput - Eficiencia.temOutput;
    }

    public static String diferenciaHumEsp(){
        return  String.format("%.4f", Eficiencia.humEspInput - Eficiencia.humEspOutput);
    }
    
    public static String flujoMaxAire(){
        return String.format("%.3f",Eficiencia.velInyection*Eficiencia.area*1.196f);
    }
    
    public static String calorSensible(){
        return String.format("%.2f", Float.parseFloat(flujoMaxAire())*diferenciaTemperatura()*1.007f);
    }
    
    public static String calorLatente(){
        return String.format("%.2f", Float.parseFloat(flujoMaxAire())*Float.parseFloat(diferenciaHumEsp())*2257);
    }
    
    public static float cantidadCalorExtraida(){
        return ((Float.parseFloat(calorLatente())+(Float.parseFloat(calorSensible())))*1000);
    }

    public static float eficienciaREE1(){
        return cantidadCalorExtraida()/(ConsElect.promedioABC()*1000);
    }
    
    public static float eficienciaREE2(){
        return cantidadCalorExtraida()/(ConsElect.potenciaEstimadaGancho()*1000);
    }
    //SELECT  `humEspecifica` FROM `aire_entrada` WHERE temperaturaEntrada = "20" AND humRelativa = "40"

    public static int getTemInput() {
        return temInput;
    }

    public static void setTemInput(int temInput) {
        Eficiencia.temInput = temInput;
    }

    public static int getHumInput() {
        return humInput;
    }

    public static void setHumInput(int humInput) {
        Eficiencia.humInput = humInput;
    }

    public static int getTemOutput() {
        return temOutput;
    }

    public static void setTemOutput(int temOutput) {
        Eficiencia.temOutput = temOutput;
    }

    public static int getHumOutput() {
        return humOutput;
    }

    public static void setHumOutput(int humOutput) {
        Eficiencia.humOutput = humOutput;
    }
    
    public static void setVelInyection(float velInyection) {
        Eficiencia.velInyection = velInyection;
    }
    
     public static void setLargo(float largo) {
        Eficiencia.largo = largo;
    }

    public static void setAncho(float ancho) {
        Eficiencia.ancho = ancho;
    }
    
    public static void setArea(){
        Eficiencia.area = Eficiencia.ancho*Eficiencia.largo;
    }
}
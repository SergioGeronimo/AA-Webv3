package com.moran.db;
import java.sql.Connection;
import java.sql.SQLException;

/**
 *
 * @author pc
 */
public class BTU {
    private static final float [] BTU = new float[16];
    
    
    public static float BTU1(Connection con){
        try {
            BTU[0] = (Termica.getAreaPiso_ancho()*Termica.getAreaPiso_fondo()*Factor.getArea_piso(con));
        }catch(Exception ex) {
            ex.printStackTrace();
        }
        return BTU[0];
    }
    
    
    public static float BTU2(Connection con){
        try {
            BTU[1] = (Termica.getVolRecinto_alto()*Termica.getVolRecinto_ancho()*Termica.getVolRecinto_fondo()*Factor.getVolumen(con));
        }catch(Exception ex) {
            ex.printStackTrace();
        }
        return BTU[1];
    }
    
    
    public static float BTU3(Connection con){
        try {
            BTU[2] = Termica.getVenLadoSoE_alto()*Termica.getVenLadoSoE_ancho()*Factor.getVen_Sur_est(con);
        }catch(Exception ex) {
            ex.printStackTrace();
        }
        return BTU[2];
    }
    
    public static float BTU4(Connection con){
        try {
            BTU[3] = Termica.getVenLadoSuroEste_alto()*Termica.getVenLadoSuroEste_ancho()*Factor.getVent_sroest(con);
        }catch(Exception ex) {
            ex.printStackTrace();
        }
        return BTU[3];
    }
    
    public static float BTU5(Connection con){
        try {
            BTU[4] = Termica.getVenLadoOeste_alto()*Termica.getVenLadoOeste_ancho()*Factor.getVent_oest(con);
        }catch(Exception ex) {
            ex.printStackTrace();
        }
        return BTU[4];
    }
    
    public static float BTU6(Connection con){
        try {
            BTU[5] = Termica.getVenLadoNoEoSurE_alto()*Termica.getVenLadoNoEoSurE_ancho()*Factor.getVent_Nor_Sur(con);
        }catch(Exception ex) {
            ex.printStackTrace();
        }
        return BTU[5];
    }
    
    public static float BTU7(Connection con){
        try {
            BTU[6] = Termica.getAreaRestoVen_alto()*Termica.getAreaRestoVen_ancho()*Factor.getResto_Vent(con);
        }catch(Exception ex) {
            ex.printStackTrace();
        }
        return BTU[6];
    }
    
     public static float BTU8(Connection con){
        try {
            BTU[7] = Termica.getAreaPared()*Factor.getDimension_PA_VEN(con);
        }catch(Exception ex) {
            ex.printStackTrace();
        }
        return BTU[7];
    }
     
    public static float BTU9(Connection con){
        try {
            BTU[8] = Termica.getRestoPared()*Factor.getPared_ext(con);
        }catch(Exception ex) {
            ex.printStackTrace();
        }
        return BTU[8];
    }
    
    public static float BTU10(Connection con){
        try {
            BTU[9] = Termica.getAreaAdyacente()*Factor.getPared_ADYN(con);
        }catch(Exception ex) {
            ex.printStackTrace();
        }
        return BTU[9];
    }
     
    public static float BTU11(Connection con){
        try {
            BTU[10] = Termica.getTechoArriba_ancho()*Termica.getTechoArriba_fondo()*Factor.getTecho_CNTR_SIN_ACD(con);
        }catch(Exception ex) {
            ex.printStackTrace();
        }
        return BTU[10];
    }
    
     public static float BTU12(Connection con){
        try {
            BTU[11] = Termica.getTechoNoAislado_ancho()*Termica.getTechoNoAislado_fondo()*Factor.getTecho_PLF_NOA(con);
        }catch(Exception ex) {
            ex.printStackTrace();
        }
        return BTU[11];
    }
     
    public static float BTU13(Connection con){
        try {
            BTU[12] = Termica.getTechadoPlafon_ancho()*Termica.getTechadoPlafon_fondo()*Factor.getTecho_AISLado(con);
        }catch(Exception ex) {
            ex.printStackTrace();
        }
        return BTU[12];
    }
    
     public static float BTU14(Connection con){
        try {
            BTU[13] = Termica.getTechadoNoAislado_ancho()*Termica.getTechadoNoAislado_fondo()*Factor.getTecho_No_AISLD(con);
        }catch(Exception ex) {
            ex.printStackTrace();
        }
        return BTU[13];
    }
     
    public static float BTU15(Connection con){
        try {
            BTU[14] = Termica.getNumPerson()*Factor.getPersonas(con);
        }catch(Exception ex) {
            ex.printStackTrace();
        }
        return BTU[14];
    }
    
    public static float BTU16(Connection con){
        try {
            BTU[15] = Termica.getLuzEquipos()*Factor.getLUZ_YELECTR(con);
        }catch(Exception ex) {
            ex.printStackTrace();
        }
        return BTU[15];
    }
    
    public static float totalBTU(){
        float total = 0;
        for(int i = 0; i < BTU.length; i++){
            total += BTU[i];
        }
        return total;
    }
    
    public static float totalTR(){
        return totalBTU()/12000;
    }
}
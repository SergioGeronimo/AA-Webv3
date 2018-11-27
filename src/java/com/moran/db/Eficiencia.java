package datos;


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
    
    private int temInput, humInput, temOutput, humOutput;
    private float humEspInput, humEspOutput, velInyection, largo, ancho;
    private float area;
    private Statement smt;
    private ResultSet rs;
    
    
    public Eficiencia(){
        
    }
    
    public  float getHumEspInput(Connection con) {
        try {
            smt = con.createStatement();
            String sql = "SELECT humEspecifica FROM aire_entrada WHERE temperaturaEntrada = '"+ this.temInput + "' AND humRelativa = '" + this.humInput+"'";
            rs = smt.executeQuery(sql);
            while(rs.next())
                humEspInput = Float.parseFloat(rs.getString(1));
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        
        return humEspInput;
    }
    
    public float getHumEspOutput(Connection con) {
        try {
            smt = con.createStatement();
            String sql = "SELECT humEspecificaS FROM aire_inyeccion WHERE temperaturaSalida = '"+ this.temOutput + "' AND humRelativaS = '" + this.humOutput+"'";
            rs = smt.executeQuery(sql);
            while(rs.next())
                humEspOutput = Float.parseFloat(rs.getString(1));
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        
        return humEspOutput;
    }
    
    public int diferenciaTemperatura(){
        return this.temInput - this.temOutput;
    }

    public String diferenciaHumEsp(){
        return  String.format("%.4f", this.humEspInput - this.humEspOutput);
    }
    
    public String flujoMaxAire(){
        return String.format("%.3f",this.velInyection*this.area*1.196f);
    }
    
    public String calorSensible(){
        return String.format("%.2f", Float.parseFloat(flujoMaxAire())*diferenciaTemperatura()*1.007f);
    }
    
    public String calorLatente(){
        return String.format("%.2f", Float.parseFloat(flujoMaxAire())*Float.parseFloat(diferenciaHumEsp())*2257);
    }
    
    public float cantidadCalorExtraida(){
        return ((Float.parseFloat(calorLatente())+(Float.parseFloat(calorSensible())))*1000);
    }

    public float eficienciaREE1(float promedioABC){
        return cantidadCalorExtraida()/(promedioABC*1000);
    }
    
    public float eficienciaREE2(float poEsG){
        return cantidadCalorExtraida()/(poEsG*1000);
    }
    //SELECT  `humEspecifica` FROM `aire_entrada` WHERE temperaturaEntrada = "20" AND humRelativa = "40"

    public int getTemInput() {
        return temInput;
    }

    public void setTemInput(int temInput) {
        this.temInput = temInput;
    }

    public int getHumInput() {
        return humInput;
    }

    public void setHumInput(int humInput) {
        this.humInput = humInput;
    }

    public int getTemOutput() {
        return temOutput;
    }

    public void setTemOutput(int temOutput) {
        this.temOutput = temOutput;
    }

    public int getHumOutput() {
        return humOutput;
    }

    public void setHumOutput(int humOutput) {
        this.humOutput = humOutput;
    }
    
    public void setVelInyection(float velInyection) {
        this.velInyection = velInyection;
    }
    
     public void setLargo(float largo) {
        this.largo = largo;
    }

    public void setAncho(float ancho) {
        this.ancho = ancho;
    }
    
    public void setArea(){
        this.area = this.ancho*this.largo;
    }
}
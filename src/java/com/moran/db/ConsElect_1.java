package com.moran.db;

public class ConsElect_1 {
    /*datos de factura electrica*/
    //datos de las tarifas
    private String tarifa = "";
    private final float [] tarifaFloat = {1.44f,1.18f};
    private String tipoEquipo = "";
    //Datos de placa
    private String capEnfriamiento = "";
    private String potenciaActual = "";
    private float tension;
    private float corrNominal;
    
    //mantenimiento
    private int antiguedad;
    private float cicloOper;
    private int diasOper;
    
    /*mediciones puntuales*/
    //medicion con amperimetro de potencia
    private final float [] a = new float[3];
    private final float [] b = new float[3];
    private final float [] c = new float[3];
    
    //medicion con multimetro de gancho
    private final float [] ab = new float[3];
    private final float [] bc = new float[3];
    private final float [] ca = new float[3];
    private final float proCorrienteA = 15.4f;
    private final float proCorrienteB = 15.27f;
    private final float  proCorrienteC = 0;
    private final float proTotalCorriente = 15.47f;
    
    
    
    //retorna la potencia activa por tension y corriente 
    public float getPotTensionCorriente(){
        return this.tension*this.corrNominal*0.9f;
    }
    //retorna el valor de la tarifa
    public float getTarifaFloat(){
        if(this.tarifa.equalsIgnoreCase("OM")){
            return this.tarifaFloat[0];
        }else if(this.tarifa.equalsIgnoreCase("HM")){
            return this.tarifaFloat[1];
        }
        return 0;
    }
    
    /*Mediciones con el amperimetro*/
    //consumi estimado con el amperimetro
    public float consumoEstimadoAmpe(){
        return promedioABC()*this.cicloOper;
    }
    //Ahorro por equipo sucio o antiguo de la potencia 
    public float ahorroSAAmpe(){
        return consumoEstimadoAmpe()*0.08f;
    }
    //Ahorro mensual por equipo limpio
    public float ahorroLAmpe(){
        return ahorroSAAmpe()*26;
    }
    //ahorro economico mensual equipo limpio
    public float AhorroMensualLAmpe(){
        return ahorroLAmpe()*getTarifaFloat();
    }
    //Costo mensual usando inverter(medicion amperimetro)
    public String costoMensualAmpe(){
        if(this.tipoEquipo.equalsIgnoreCase("inverte")){
            return "Equipo inverte";
        }else{
            return String.format("%.4f", ((consumoEstimadoAmpe()*getTarifaFloat())-(consumoEstimadoAmpe()*getTarifaFloat()*0.55f))*26);
        }
    }
    //costo mensual equipo convencional
    public float costoConvenAmpe(){
        return consumoEstimadoAmpe()*getTarifaFloat()*26;
    }
    
    /*Mediciones con multimetro de gancho*/
    //potencia estimada 
    public float potenciaEstimadaGancho(){
        return ((promedioAB()*this.proCorrienteA)+(promedioBC()*this.proCorrienteB)+(promedioCA()*this.proCorrienteC)*0.9f)/1000;
    }
    //Consumo estimado
    public float consumoEstGancho(){
        return potenciaEstimadaGancho()*this.cicloOper;
    }
    //Ahorro de energia por equipo sucio
    public float ahorroSAGancho(){
        return consumoEstGancho()*0.08f*26;
    }
    //ahorro economico con equipo limpio
    public float ahorroLGancho(){
        return ahorroSAGancho()*getTarifaFloat();
    }
    //costo mensual usuario inverte
    public String costoMensualGancho(){
        if(this.tipoEquipo.equalsIgnoreCase("inverte")){
            return "Equipo inverte";
        }else{
            return String.format("%.4f", ((consumoEstGancho()*getTarifaFloat())-(consumoEstGancho()*getTarifaFloat()*0.55f))*26);
        }
    }
    //costo mensual equipo convencional
    public float costoConveGancho(){
        return consumoEstGancho()*getTarifaFloat()*26;
    }
            
    //promedio ABC.
    public float promedioABC(){
        return (totalABC1()+totalABC2()+totalABC3())/3;
    }
    //promedio AC, BC,CA
    public float promedioAbBcCa(){
        return (mayorTension1()+mayorTension2()+mayorTension3())/3;
    }
    //Retorna el total de los valores en abc
    public float totalABC1(){
        return (a[0]+b[0]+c[0]);
    }
    //promedio en A.
    public float promedioA(){
        return (a[0]+a[1]+a[2])/this.a.length;
    }
    //Retorna el total de los valores en abc.
    public float totalABC2(){
        return (a[1]+b[1]+c[1]);
    }
    //promedio en B.
    public float promedioB(){
        return (b[0]+b[1]+b[2])/this.b.length;
    }
    //Retorna el total de los valores en c.
    public float totalABC3(){
        return (a[2]+b[2]+c[2]);
    }
    //promedio en C.
    public float promedioC(){
        return (c[0]+c[1]+c[2])/this.c.length;
    }
    
    //mayor numero entre AB y CA en la primera fila.
    public float mayorTension1(){
        if(ab[0] > bc[0] && ab[0] > ca[0]){
            return ab[0];
        }else if(bc[0] > ab[0] && bc[0] > ca[0]){
            return bc[0];
        }else if(ca[0] > ab[0] && ca[0] > bc[0]){
            return ca[0];
        }else{
            return ab[0];
        }
    }
    //mayor numero entre AB y CA en la segunda fila.
    public float mayorTension2(){
        if(ab[1] > bc[1] && ab[1] > ca[1]){
            return ab[1];
        }else if(bc[1] > ab[1] && bc[1] > ca[1]){
            return bc[1];
        }else if(ca[1] > ab[1] && ca[1] > bc[1]){
            return ca[1];
        }else{
            return ab[1];
        }
    }
    //mayor numero entre AB y CA en la tercera fila.
    public float mayorTension3(){
        if(ab[2] > bc[2] && ab[2] > ca[2]){
            return ab[2];
        }else if(bc[2] > ab[2] && bc[2] > ca[2]){
            return bc[2];
        }else if(ca[2] > ab[2] && ca[2] > bc[2]){
            return ca[2];
        }else{
            return ab[2];
        }
    }
    //promedio AB
    public float promedioAB(){
        return (ab[0]+ab[1]+ab[2])/ab.length;
    }
    //promedio BC
    public float promedioBC(){
        return (bc[0]+bc[1]+bc[2])/bc.length;
    }
    //promedio CA
    public float promedioCA(){
        return (ca[0]+ca[1]+ca[2])/ca.length;
    }
    
    //rellena los valores de la potencia en A
    public void setA(float a1, float a2, float a3){
        this.a[0] = a1;
        this.a[1] = a2;
        this.a[2] = a3;
    }
     //rellena los valores de la potencia en B
    public void setB(float b1, float b2, float b3){
        this.b[0] = b1;
        this.b[1] = b2;
        this.b[2] = b3;
    }
    //rellena los valores de la potencia en C
    public void setC(float c1, float c2, float c3){
        this.c[0] = c1;
        this.c[1] = c2;
        this.c[2] = c3;
    }
    
    //rellena los valores de tension en AB
    public void setAB(float ab1, float ab2, float ab3){
        this.ab[0] = ab1;
        this.ab[1] = ab2;
        this.ab[2] = ab3;
    }
    //rellena los valores de tension en BC
    public void setBC(float bc1, float bc2, float bc3){
        this.bc[0] = bc1;
        this.bc[1] = bc2;
        this.bc[2] = bc3;
    }
    //rellena los valores de tension en CA
    public void setCA(float ca1, float ca2, float ca3){
        this.ca[0] = ca1;
        this.ca[1] = ca2;
        this.ca[2] = ca3;
    }
     
    public void setTarifa(String tarifa) {
        this.tarifa = tarifa;
    }

    public String getCapEnfriamiento() {
        return capEnfriamiento;
    }

    public void setCapEnfriamiento(String capEnfriamiento) {
        this.capEnfriamiento = capEnfriamiento;
    }

    public String getPotenciaActual() {
        return potenciaActual;
    }

    public void setPotenciaActual(String potenciaAct) {
        this.potenciaActual = potenciaAct;
    }

    public float getTension() {
        return tension;
    }

    public void setTension(int tension) {
        this.tension = tension;
    }

    public float getCorrNominal() {
        return corrNominal;
    }

    public void setCorrNominal(float corrNominal) {
        this.corrNominal = corrNominal;
    }

    public int getAntiguedad() {
        return antiguedad;
    }

    public void setAntiguedad(int antiguedad) {
        this.antiguedad = antiguedad;
    }

    public float getCicloOper() {
        return cicloOper;
    }

    public void setCicloOper(float cicloOper) {
        this.cicloOper = cicloOper;
    }

    public int getDiasOper() {
        return diasOper;
    }

    public void setDiasOper(int diasOper) {
        this.diasOper = diasOper;
    }
    
    public void setTipoEquipo(String tipoEquipo){
        this.tipoEquipo = tipoEquipo;
    }
    
}
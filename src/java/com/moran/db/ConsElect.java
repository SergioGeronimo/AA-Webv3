package com.moran.db;

public class ConsElect {
    /*datos de factura electrica*/
    //datos de las tarifas
    private static String tarifa;
    private static final float [] tarifaFloat = {1.44f,1.18f};
    private static String tipoEquipo;
    //Datos de placa
    private static String capEnfriamiento;
    private static String potenciaActual;
    private static float tension;
    private static float corrNominal;
    
    //mantenimiento
    private static int antiguedad;
    private static float cicloOper;
    private static int diasOper;
    
    /*mediciones puntuales*/
    //medicion con amperimetro de potencia
    private static final float [] a = new float[3];
    private static final float [] b = new float[3];
    private static final float [] c = new float[3];
    
    //medicion con multimetro de gancho
    private static final float [] ab = new float[3];
    private static final float [] bc = new float[3];
    private static final float [] ca = new float[3];
    private static final float proCorrienteA = 15.4f;
    private static final float proCorrienteB = 15.27f;
    private static final float  proCorrienteC = 0;
    private static final float proTotalCorriente = 15.47f;
    
    public static void main(String[] args) {
        
        setTarifa("HM");
        setTipoEquipo("minisplit");
        setCapEnfriamiento("36000");
        setPotenciaActual("3800");
        setTension(220);
        setCorrNominal(17.45f);
        setAntiguedad(10);
        setCicloOper(8);
        setDiasOper(313);
        setA(3.23f, 03.2f, 3.3f);
        setB(3.17f, 3f, 3.25f);
        setC(5, 0, 0);
        setAB(221.7f, 221.7f, 221.7f);
        setBC(4, 221.7f, 221.7f);
        setCA(0,0,0);
        
        System.out.println("------------------");
        System.out.println("promedio a:" + promedioA());
        System.out.println("promedio b:" + promedioB());
        System.out.println("promedio c:" + promedioC());
        System.out.println("Promedio: " + promedioABC());
        System.out.println("------------------");
        
        System.out.println("promedio ab:" + promedioAB());
        System.out.println("promedio bc:" + promedioBC());
        System.out.println("promedio ca:" + promedioCA());
        System.out.println("promedio: " + promedioAbBcCa());
        System.out.println("------------------");
        
        System.out.println("precio nominal: " + getTarifaFloat());
        System.out.println("pot. activa por tension y corriente: " + getPotTensionCorriente());
        System.out.println("Mediciones con amperimetro");
        System.out.println("Consumo estimado: " + consumoEstimadoAmpe());
        System.out.println("Ahorro por equipo sucio o antiguo: " + ahorroSAAmpe());
        System.out.println("Ahorro mensula equipo limpio: " + ahorroLAmpe());
        System.out.println("Ahorro economico mensual equipo limpio: " + AhorroMensualLAmpe());
        System.out.println("Costo mensual: " + costoMensualAmpe());
        System.out.println("Costo mensual equipo convencional: " + costoConvenAmpe());
        
        System.out.println("Potencia estimada: " + potenciaEstimadaGancho());
        System.out.println("Consumo estimado: " + consumoEstGancho());
        System.out.println("Ahorro por equipo sucio o antiguo: " + ahorroSAGancho());
        System.out.println("Ahorro economico mensual equipo limpio: " + ahorroLGancho());
        System.out.println("Costo mensual: " + costoMensualGancho());
        System.out.println("Costo mensual equipo convencional: " + costoConveGancho());
    
    }
    
    //retorna la potencia activa por tension y corriente 
    public static float getPotTensionCorriente(){
        return ConsElect.tension*ConsElect.corrNominal*0.9f;
    }
    //retorna el valor de la tarifa
    public static float getTarifaFloat(){
        if(ConsElect.tarifa.equalsIgnoreCase("OM")){
            return ConsElect.tarifaFloat[0];
        }else if(ConsElect.tarifa.equalsIgnoreCase("HM")){
            return ConsElect.tarifaFloat[1];
        }
        return 0;
    }
    
    /*Mediciones con el amperimetro*/
    //consumi estimado con el amperimetro
    public static float consumoEstimadoAmpe(){
        return promedioABC()*ConsElect.cicloOper;
    }
    //Ahorro por equipo sucio o antiguo de la potencia 
    public static float ahorroSAAmpe(){
        return consumoEstimadoAmpe()*0.08f;
    }
    //Ahorro mensual por equipo limpio
    public static float ahorroLAmpe(){
        return ahorroSAAmpe()*26;
    }
    //ahorro economico mensual equipo limpio
    public static float AhorroMensualLAmpe(){
        return ahorroLAmpe()*getTarifaFloat();
    }
    //Costo mensual usando inverter(medicion amperimetro)
    public static String costoMensualAmpe(){
        if(ConsElect.tipoEquipo.equalsIgnoreCase("inverte")){
            return "Equipo inverte";
        }else{
            return String.format("%.4f", ((consumoEstimadoAmpe()*getTarifaFloat())-(consumoEstimadoAmpe()*getTarifaFloat()*0.55f))*26);
        }
    }
    //costo mensual equipo convencional
    public static float costoConvenAmpe(){
        return consumoEstimadoAmpe()*getTarifaFloat()*26;
    }
    
    /*Mediciones con multimetro de gancho*/
    //potencia estimada 
    public static float potenciaEstimadaGancho(){
        return ((promedioAB()*ConsElect.proCorrienteA)+(promedioBC()*ConsElect.proCorrienteB)+(promedioCA()*ConsElect.proCorrienteC)*0.9f)/1000;
    }
    //Consumo estimado
    public static float consumoEstGancho(){
        return potenciaEstimadaGancho()*ConsElect.cicloOper;
    }
    //Ahorro de energia por equipo sucio
    public static float ahorroSAGancho(){
        return consumoEstGancho()*0.08f*26;
    }
    //ahorro economico con equipo limpio
    public static float ahorroLGancho(){
        return ahorroSAGancho()*getTarifaFloat();
    }
    //costo mensual usuario inverte
    public static String costoMensualGancho(){
        if(ConsElect.tipoEquipo.equalsIgnoreCase("inverte")){
            return "Equipo inverte";
        }else{
            return String.format("%.4f", ((consumoEstGancho()*getTarifaFloat())-(consumoEstGancho()*getTarifaFloat()*0.55f))*26);
        }
    }
    //costo mensual equipo convencional
    public static float costoConveGancho(){
        return consumoEstGancho()*getTarifaFloat()*26;
    }
            
    //promedio ABC.
    public static float promedioABC(){
        return (totalABC1()+totalABC2()+totalABC3())/3;
    }
    //promedio AC, BC,CA
    public static float promedioAbBcCa(){
        return (mayorTension1()+mayorTension2()+mayorTension3())/3;
    }
    //Retorna el total de los valores en abc
    public static float totalABC1(){
        return (a[0]+b[0]+c[0]);
    }
    //promedio en A.
    public static float promedioA(){
        return (a[0]+a[1]+a[2])/ConsElect.a.length;
    }
    //Retorna el total de los valores en abc.
    public static float totalABC2(){
        return (a[1]+b[1]+c[1]);
    }
    //promedio en B.
    public static float promedioB(){
        return (b[0]+b[1]+b[2])/ConsElect.b.length;
    }
    //Retorna el total de los valores en c.
    public static float totalABC3(){
        return (a[2]+b[2]+c[2]);
    }
    //promedio en C.
    public static float promedioC(){
        return (c[0]+c[1]+c[2])/ConsElect.c.length;
    }
    
    //mayor numero entre AB y CA en la primera fila.
    public static float mayorTension1(){
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
    public static float mayorTension2(){
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
    public static float mayorTension3(){
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
    public static float promedioAB(){
        return (ab[0]+ab[1]+ab[2])/ab.length;
    }
    //promedio BC
    public static float promedioBC(){
        return (bc[0]+bc[1]+bc[2])/bc.length;
    }
    //promedio CA
    public static float promedioCA(){
        return (ca[0]+ca[1]+ca[2])/ca.length;
    }
    
    //rellena los valores de la potencia en A
    public static void setA(float a1, float a2, float a3){
        ConsElect.a[0] = a1;
        ConsElect.a[1] = a2;
        ConsElect.a[2] = a3;
    }
     //rellena los valores de la potencia en B
    public static void setB(float b1, float b2, float b3){
        ConsElect.b[0] = b1;
        ConsElect.b[1] = b2;
        ConsElect.b[2] = b3;
    }
    //rellena los valores de la potencia en C
    public static void setC(float c1, float c2, float c3){
        ConsElect.c[0] = c1;
        ConsElect.c[1] = c2;
        ConsElect.c[2] = c3;
    }
    
    //rellena los valores de tension en AB
    public static void setAB(float ab1, float ab2, float ab3){
        ConsElect.ab[0] = ab1;
        ConsElect.ab[1] = ab2;
        ConsElect.ab[2] = ab3;
    }
    //rellena los valores de tension en BC
    public static void setBC(float bc1, float bc2, float bc3){
        ConsElect.bc[0] = bc1;
        ConsElect.bc[1] = bc2;
        ConsElect.bc[2] = bc3;
    }
    //rellena los valores de tension en CA
    public static void setCA(float ca1, float ca2, float ca3){
        ConsElect.ca[0] = ca1;
        ConsElect.ca[1] = ca2;
        ConsElect.ca[2] = ca3;
    }
     
    public static void setTarifa(String tarifa) {
        ConsElect.tarifa = tarifa;
    }

    public static String getCapEnfriamiento() {
        return capEnfriamiento;
    }

    public static void setCapEnfriamiento(String capEnfriamiento) {
        ConsElect.capEnfriamiento = capEnfriamiento;
    }

    public static String getPotenciaActual() {
        return potenciaActual;
    }

    public static void setPotenciaActual(String potenciaAct) {
        ConsElect.potenciaActual = potenciaAct;
    }

    public static float getTension() {
        return tension;
    }

    public static void setTension(int tension) {
        ConsElect.tension = tension;
    }

    public static float getCorrNominal() {
        return corrNominal;
    }

    public static void setCorrNominal(float corrNominal) {
        ConsElect.corrNominal = corrNominal;
    }

    public static int getAntiguedad() {
        return antiguedad;
    }

    public static void setAntiguedad(int antiguedad) {
        ConsElect.antiguedad = antiguedad;
    }

    public static float getCicloOper() {
        return cicloOper;
    }

    public static void setCicloOper(float cicloOper) {
        ConsElect.cicloOper = cicloOper;
    }

    public static int getDiasOper() {
        return diasOper;
    }

    public static void setDiasOper(int diasOper) {
        ConsElect.diasOper = diasOper;
    }
    
    public static void setTipoEquipo(String tipoEquipo){
        ConsElect.tipoEquipo = tipoEquipo;
    }
    
}
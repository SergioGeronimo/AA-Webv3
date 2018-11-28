package com.moran.db;


import java.sql.Connection;
import java.sql.SQLException;

/**
 *
 * @author pc
 */
public class BTU {
    private static final float [] BTU = new float[16];
    /* BTU1(AREA_1,AREA_2,Factor.getArea_piso(con,temperatura););*/
    //de la clase Termica.java se toma getAreaPiso_ancho() y getAreaPiso_fondo()
    //de la clase Factor.java se toma int getArea_piso(con)
    public static float BTU1(float areaPisoAncho, float areaPisoFondo, int areaPiso){
            BTU[0] = (areaPisoAncho*areaPisoFondo*areaPiso);
        return BTU[0];
    }
    
    //de la clase Termica.java se toma getVolRecinto_alto() y getVolRecinto_ancho()
    //de la clase Factor.java se toma int getVolumen(con)
    public static float BTU2(float volRecintoAlto, float volRecintoAncho,float volRecintoLargo, int volumen){
            BTU[1] = volRecintoAlto*volRecintoAncho*volRecintoLargo*volumen;
        return BTU[1];
    }
    
    //de la clase Termica.java se toma getVenLadoSoE_alto() y getVenLadoSoE_ancho()
    //de la clase Factor.java se toma int getVen_Sur_est(con)
    public static float BTU3(float venLadoSoEAlto,float venLadoSoEAncho, int venSurEst){
            BTU[2] = venLadoSoEAlto*venLadoSoEAncho*venSurEst;
        return BTU[2];
    }
    
    //de la clase Termica.java se toma getVenLadoSuroEste_alto() y getVenLadoSuroEste_ancho()
    //de la clase Factor.java se toma int getVent_sroest(con)
    public static float BTU4(float venLadoSEAlto, float venLadoSEAncho, int ventSRoest){
            BTU[3] = venLadoSEAlto*venLadoSEAncho*ventSRoest;
        return BTU[3];
    }
    
    
    //de la clase Termica.java se toma getVenLadoOeste_alto() y getVenLadoOeste_ancho()
    //de la clase Factor.java se toma int getVent_oest(con)
    public static float BTU5(float venLadoOesAlto, float venLadoOesAncho, int ventOest){
            BTU[4] = venLadoOesAlto*venLadoOesAncho*ventOest;
        return BTU[4];
    }
    
    //de la clase Termica.java se toma getVenLadoNoEoSurE_alto() y getVenLadoNoEoSurE_ancho()
    //de la clase Factor.java se toma int getVent_Nor_Sur(con)
    public static float BTU6(float venLNESEAlto, float venLNESEAncho,int ventNS){
            BTU[5] = venLNESEAlto*venLNESEAncho*ventNS;
        return BTU[5];
    }
    
    //de la clase Termica.java se toma getAreaRestoVen_alto() y getAreaRestoVen_ancho()
    //de la clase Factor.java se toma int getResto_Vent(con)
    public static float BTU7(float areaRestoVAlto, float areaRestoVAncho, int restoVen){
            BTU[6] = areaRestoVAlto*areaRestoVAncho*restoVen;
        return BTU[6];
    }
    
    //de la clase Termica.java se toma getAreaPared()
    //de la clase Factor.java se toma int getDimension_PA_VEN(con)
     public static float BTU8(float areaPared, int dimPAVen){
            BTU[7] = areaPared*dimPAVen;
        return BTU[7];
    }
     
    //de la clase Termica.java se toma getRestoPared()
    //de la clase Factor.java se toma int getPared_ext(con)
    public static float BTU9(float restoPared, int paredExt){
            BTU[8] = restoPared*paredExt;
        return BTU[8];
    }
    
    //de la clase Termica.java se toma getAreaAdyacente()
    //de la clase Factor.java se toma int getPared_ADYN(con)
    public static float BTU10(float adyacente, int areaAdya){
            BTU[9] = adyacente*areaAdya;
        return BTU[9];
    }
     
    //de la clase Termica.java se toma getTechoArriba_ancho() y getTechoArriba_fondo()
    //de la clase Factor.java se toma int getTecho_CNTR_SIN_ACD(con)
    public static float BTU11(float techoArribaAncho, float techoArribaFondo, int techo){
            BTU[10] = techoArribaAncho*techoArribaFondo*techo;
        return BTU[10];
    }
    
    //de la clase Termica.java se toma getTechoNoAislado_ancho() y getTechoNoAislado_fondo()
    //de la clase Factor.java se toma int getTecho_PLF_NOA(con)
     public static float BTU12(float techoNoAisAncho, float techoNoAisFondo, int techo){
            BTU[11] = techoNoAisAncho*techoNoAisFondo*techo;
        return BTU[11];
    }
     
     
     
    public static float BTU13(float techadoPlafonA, float techadoPlafonF, int techoP){
            BTU[12] = techadoPlafonA*techadoPlafonF*techoP;
        return BTU[12];
    }
    
    //de la clase Termica.java se toma getTechadoNoAislado_ancho() y getTechadoNoAislado_fondo()
    //de la clase Factor.java se toma int getTecho_No_AISLD(con)
     public static float BTU14(float techadoNoAisA, float techadoNoAisF, int techadoNoA){
            BTU[13] = techadoNoAisA*techadoNoAisF*techadoNoA;
        return BTU[13];
    }
     
     //de la clase Termica.java se toma getNumPerson() 
    //de la clase Factor.java se toma int getPersonas(con)
    public static float BTU15(float numPerson, int person){
            BTU[14] = numPerson*person;
        return BTU[14];
    }
    
    
    //de la clase Termica.java se toma getLuzEquipos() 
    //de la clase Factor.java se toma int getLUZ_YELECTR(con)
    public static float BTU16(float luzEquipos, int luz){
            BTU[15] = luzEquipos*luz;
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
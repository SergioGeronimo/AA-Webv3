package datos;

public class Termica {
    //tempearatura exterior promedio anual
    private int temPromAnual; 
    
    //punto 1 area del piso
    private float areaPiso_ancho;
    private float areaPiso_fondo;
    
    //punto 2 volumen del recinto
    private float volRecinto_alto;
    private float volRecinto_ancho;
    private float volRecinto_fondo;
    
    // punto 3.
    //ventana lado sur o este
    private float venLadoSoE_alto;
    private float venLadoSoE_ancho;
    //ventana lado suroeste
    private float venLadoSuroEste_alto;
    private float venLadoSuroEste_ancho;
    //ventana lado oeste
    private float venLadoOeste_alto;
    private float venLadoOeste_ancho;
    //ventana lado noroeste o suroeste
    private float venLadoNoEoSurE_alto;
    private float venLadoNoEoSurE_ancho;
    
    //punto 4 area del resto de las ventanas
    private float areaRestoVen_alto;
    private float areaRestoVen_ancho;
    
    //punto 5. Area de la pared utilizada en el punto 3
    private float areaPared;
    
    //punto 6. area del resto de las paredes exterior
    private float restoPared;
    
    //punto 7. area de todas las paredes adyacentes a un recinto no acondicionado
    private float areaAdyacente;
    
    //punto 8.
    //techo con construccion arriba sin acondicionar
    private float techoArriba_ancho;
    private float techoArriba_fondo;
    //techo con plafon no aislado
    private float techoNoAislado_ancho;
    private float techoNoAislado_fondo;
    //techado con plafon y 50mm o mas de aislamiento
    private float techadoPlafon_ancho;
    private float techadoPlafon_fondo;
    //Techado no aislado
    private float techadoNoAislado_ancho;
    private float techadoNoAislado_fondo;
    
    //punto 9. numero de personas dentro del recinto
    private float numPerson;
    
    //punto 10. luz y equipos electricos en uso(watts)
    private float luzEquipos;
    
    //metodos getter and setter

    public int getTemPromAnual() {
        return temPromAnual;
    }

    public void setTemPromAnual(int temPromAnual) {
        this.temPromAnual = temPromAnual;
    }

    public float getAreaPiso_ancho() {
        return areaPiso_ancho;
    }

    public void setAreaPiso_ancho(float areaPiso_ancho) {
        this.areaPiso_ancho = areaPiso_ancho;
    }

    public float getAreaPiso_fondo() {
        return areaPiso_fondo;
    }

    public void setAreaPiso_fondo(float areaPiso_fondo) {
        this.areaPiso_fondo = areaPiso_fondo;
    }

    public float getVolRecinto_alto() {
        return volRecinto_alto;
    }

    public void setVolRecinto_alto(float volRecinto_alto) {
        this.volRecinto_alto = volRecinto_alto;
    }

    public float getVolRecinto_ancho() {
        return volRecinto_ancho;
    }

    public void setVolRecinto_ancho(float volRecinto_ancho) {
        this.volRecinto_ancho = volRecinto_ancho;
    }

    public float getVolRecinto_fondo() {
        return volRecinto_fondo;
    }

    public void setVolRecinto_fondo(float volRecinto_fondo) {
        this.volRecinto_fondo = volRecinto_fondo;
    }

    public float getVenLadoSoE_alto() {
        return venLadoSoE_alto;
    }

    public void setVenLadoSoE_alto(float venLadoSoE_alto) {
        this.venLadoSoE_alto = venLadoSoE_alto;
    }

    public float getVenLadoSoE_ancho() {
        return venLadoSoE_ancho;
    }

    public void setVenLadoSoE_ancho(float venLadoSoE_ancho) {
        this.venLadoSoE_ancho = venLadoSoE_ancho;
    }

    public float getVenLadoSuroEste_alto() {
        return venLadoSuroEste_alto;
    }

    public void setVenLadoSuroEste_alto(float venLadoSuroEste_alto) {
        this.venLadoSuroEste_alto = venLadoSuroEste_alto;
    }

    public float getVenLadoSuroEste_ancho() {
        return venLadoSuroEste_ancho;
    }

    public void setVenLadoSuroEste_ancho(float venLadoSuroEste_ancho) {
        this.venLadoSuroEste_ancho = venLadoSuroEste_ancho;
    }

    public float getVenLadoOeste_alto() {
        return venLadoOeste_alto;
    }

    public void setVenLadoOeste_alto(float venLadoOeste_alto) {
        this.venLadoOeste_alto = venLadoOeste_alto;
    }

    public float getVenLadoOeste_ancho() {
        return venLadoOeste_ancho;
    }

    public void setVenLadoOeste_ancho(float venLadoOeste_ancho) {
        this.venLadoOeste_ancho = venLadoOeste_ancho;
    }

    public float getVenLadoNoEoSurE_alto() {
        return venLadoNoEoSurE_alto;
    }

    public void setVenLadoNoEoSurE_alto(float venLadoNoEoSurE_alto) {
        this.venLadoNoEoSurE_alto = venLadoNoEoSurE_alto;
    }

    public float getVenLadoNoEoSurE_ancho() {
        return venLadoNoEoSurE_ancho;
    }

    public void setVenLadoNoEoSurE_ancho(float venLadoNoEoSurE_ancho) {
        this.venLadoNoEoSurE_ancho = venLadoNoEoSurE_ancho;
    }

    public float getAreaRestoVen_alto() {
        return areaRestoVen_alto;
    }

    public void setAreaRestoVen_alto(float areaRestoVen_alto) {
        this.areaRestoVen_alto = areaRestoVen_alto;
    }

    public float getAreaRestoVen_ancho() {
        return areaRestoVen_ancho;
    }

    public void setAreaRestoVen_ancho(float areaRestoVen_ancho) {
        this.areaRestoVen_ancho = areaRestoVen_ancho;
    }

    public float getAreaPared() {
        return areaPared;
    }

    public void setAreaPared(float areaPared) {
        this.areaPared = areaPared;
    }

    public float getRestoPared() {
        return restoPared;
    }

    public void setRestoPared(float restoPared) {
        this.restoPared = restoPared;
    }

    public float getAreaAdyacente() {
        return areaAdyacente;
    }

    public void setAreaAdyacente(float areaAdyacente) {
        this.areaAdyacente = areaAdyacente;
    }

    public float getTechoArriba_ancho() {
        return techoArriba_ancho;
    }

    public void setTechoArriba_ancho(float techoArriba_ancho) {
        this.techoArriba_ancho = techoArriba_ancho;
    }

    public float getTechoArriba_fondo() {
        return techoArriba_fondo;
    }

    public void setTechoArriba_fondo(float techoArriba_fondo) {
        this.techoArriba_fondo = techoArriba_fondo;
    }

    public float getTechoNoAislado_ancho() {
        return techoNoAislado_ancho;
    }

    public void setTechoNoAislado_ancho(float techoNoAislado_ancho) {
        this.techoNoAislado_ancho = techoNoAislado_ancho;
    }

    public float getTechoNoAislado_fondo() {
        return techoNoAislado_fondo;
    }

    public void setTechoNoAislado_fondo(float techoNoAislado_fondo) {
        this.techoNoAislado_fondo = techoNoAislado_fondo;
    }

    public float getTechadoPlafon_ancho() {
        return techadoPlafon_ancho;
    }

    public void setTechadoPlafon_ancho(float techadoPlafon_ancho) {
        this.techadoPlafon_ancho = techadoPlafon_ancho;
    }

    public float getTechadoPlafon_fondo() {
        return techadoPlafon_fondo;
    }

    public void setTechadoPlafon_fondo(float techadoPlafon_fondo) {
        this.techadoPlafon_fondo = techadoPlafon_fondo;
    }

    public float getTechadoNoAislado_ancho() {
        return techadoNoAislado_ancho;
    }

    public void setTechadoNoAislado_ancho(float techadoNoAislado_ancho) {
        this.techadoNoAislado_ancho = techadoNoAislado_ancho;
    }

    public float getTechadoNoAislado_fondo() {
        return techadoNoAislado_fondo;
    }

    public void setTechadoNoAislado_fondo(float techadoNoAislado_fondo) {
        this.techadoNoAislado_fondo = techadoNoAislado_fondo;
    }

    public float getNumPerson() {
        return numPerson;
    }

    public void setNumPerson(float numPerson) {
        this.numPerson = numPerson;
    }

    public float getLuzEquipos() {
        return luzEquipos;
    }

    public void setLuzEquipos(float luzEquipos) {
        this.luzEquipos = luzEquipos;
    }
    
    
    
}

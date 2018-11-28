package com.moran.db;

public class Termica {

    //tempearatura exterior promedio anual
    private static int temPromAnual;

    //punto 1 area del piso
    private static float areaPiso_ancho;
    private static float areaPiso_fondo;

    //punto 2 volumen del recinto
    private static float volRecinto_alto;
    private static float volRecinto_ancho;
    private static float volRecinto_fondo;

    // punto 3.
    //ventana lado sur o este
    private static float venLadoSoE_alto;
    private static float venLadoSoE_ancho;
    //ventana lado suroeste
    private static float venLadoSuroEste_alto;
    private static float venLadoSuroEste_ancho;
    //ventana lado oeste
    private static float venLadoOeste_alto;
    private static float venLadoOeste_ancho;
    //ventana lado noroeste o suroeste
    private static float venLadoNoEoSurE_alto;
    private static float venLadoNoEoSurE_ancho;

    //punto 4 area del resto de las ventanas
    private static float areaRestoVen_alto;
    private static float areaRestoVen_ancho;

    //punto 5. Area de la pared utilizada en el punto 3
    private static  float areaPared;

    //punto 6. area del resto de las paredes exterior
    private static  float restoPared;

    //punto 7. area de todas las paredes adyacentes a un recinto no acondicionado
    private static float areaAdyacente;

    //punto 8.
    //techo con construccion arriba sin acondicionar
    private static float techoArriba_ancho;
    private static float techoArriba_fondo;
    //techo con plafon no aislado
    private static float techoNoAislado_ancho;
    private static float techoNoAislado_fondo;
    //techado con plafon y 50mm o mas de aislamiento
    private static float techadoPlafon_ancho;
    private static float techadoPlafon_fondo;
    //Techado no aislado
    private static float techadoNoAislado_ancho;
    private static float techadoNoAislado_fondo;

    //punto 9. numero de personas dentro del recinto
    private static float numPerson;

    //punto 10. luz y equipos electricos en uso(watts)
    private static float luzEquipos;

    //metodos getter and setter
    public static int getTemPromAnual() {
        return temPromAnual;
    }

    public static void setTemPromAnual(int temPromAnual) {
        Termica.temPromAnual = temPromAnual;
    }

    public static float getAreaPiso_ancho() {
        return areaPiso_ancho;
    }

    public void setAreaPiso_ancho(float areaPiso_ancho) {
        this.areaPiso_ancho = areaPiso_ancho;
    }

    public static float getAreaPiso_fondo() {
        return areaPiso_fondo;
    }

    public void setAreaPiso_fondo(float areaPiso_fondo) {
        this.areaPiso_fondo = areaPiso_fondo;
    }

    public static float getVolRecinto_alto() {
        return volRecinto_alto;
    }

    public void setVolRecinto_alto(float volRecinto_alto) {
        this.volRecinto_alto = volRecinto_alto;
    }

    public static float getVolRecinto_ancho() {
        return volRecinto_ancho;
    }

    public void setVolRecinto_ancho(float volRecinto_ancho) {
        this.volRecinto_ancho = volRecinto_ancho;
    }

    public static float getVolRecinto_fondo() {
        return volRecinto_fondo;
    }

    public void setVolRecinto_fondo(float volRecinto_fondo) {
        this.volRecinto_fondo = volRecinto_fondo;
    }

    public static float getVenLadoSoE_alto() {
        return venLadoSoE_alto;
    }

    public void setVenLadoSoE_alto(float venLadoSoE_alto) {
        this.venLadoSoE_alto = venLadoSoE_alto;
    }

    public static float getVenLadoSoE_ancho() {
        return venLadoSoE_ancho;
    }

    public void setVenLadoSoE_ancho(float venLadoSoE_ancho) {
        this.venLadoSoE_ancho = venLadoSoE_ancho;
    }

    public static float getVenLadoSuroEste_alto() {
        return venLadoSuroEste_alto;
    }

    public void setVenLadoSuroEste_alto(float venLadoSuroEste_alto) {
        this.venLadoSuroEste_alto = venLadoSuroEste_alto;
    }

    public static float getVenLadoSuroEste_ancho() {
        return venLadoSuroEste_ancho;
    }

    public void setVenLadoSuroEste_ancho(float venLadoSuroEste_ancho) {
        this.venLadoSuroEste_ancho = venLadoSuroEste_ancho;
    }

    public static float getVenLadoOeste_alto() {
        return venLadoOeste_alto;
    }

    public void setVenLadoOeste_alto(float venLadoOeste_alto) {
        this.venLadoOeste_alto = venLadoOeste_alto;
    }

    public static float getVenLadoOeste_ancho() {
        return venLadoOeste_ancho;
    }

    public void setVenLadoOeste_ancho(float venLadoOeste_ancho) {
        this.venLadoOeste_ancho = venLadoOeste_ancho;
    }

    public static float getVenLadoNoEoSurE_alto() {
        return venLadoNoEoSurE_alto;
    }

    public void setVenLadoNoEoSurE_alto(float venLadoNoEoSurE_alto) {
        this.venLadoNoEoSurE_alto = venLadoNoEoSurE_alto;
    }

    public static float getVenLadoNoEoSurE_ancho() {
        return venLadoNoEoSurE_ancho;
    }

    public void setVenLadoNoEoSurE_ancho(float venLadoNoEoSurE_ancho) {
        this.venLadoNoEoSurE_ancho = venLadoNoEoSurE_ancho;
    }

    public static float getAreaRestoVen_alto() {
        return areaRestoVen_alto;
    }

    public void setAreaRestoVen_alto(float areaRestoVen_alto) {
        this.areaRestoVen_alto = areaRestoVen_alto;
    }

    public static float getAreaRestoVen_ancho() {
        return areaRestoVen_ancho;
    }

    public void setAreaRestoVen_ancho(float areaRestoVen_ancho) {
        this.areaRestoVen_ancho = areaRestoVen_ancho;
    }

    public static float getAreaPared() {
        return areaPared;
    }

    public void setAreaPared(float areaPared) {
        this.areaPared = areaPared;
    }

    public static float getRestoPared() {
        return restoPared;
    }

    public void setRestoPared(float restoPared) {
        this.restoPared = restoPared;
    }

    public static float getAreaAdyacente() {
        return areaAdyacente;
    }

    public void setAreaAdyacente(float areaAdyacente) {
        this.areaAdyacente = areaAdyacente;
    }

    public static float getTechoArriba_ancho() {
        return techoArriba_ancho;
    }

    public void setTechoArriba_ancho(float techoArriba_ancho) {
        this.techoArriba_ancho = techoArriba_ancho;
    }

    public static float getTechoArriba_fondo() {
        return techoArriba_fondo;
    }

    public void setTechoArriba_fondo(float techoArriba_fondo) {
        this.techoArriba_fondo = techoArriba_fondo;
    }

    public static float getTechoNoAislado_ancho() {
        return techoNoAislado_ancho;
    }

    public void setTechoNoAislado_ancho(float techoNoAislado_ancho) {
        this.techoNoAislado_ancho = techoNoAislado_ancho;
    }

    public static float getTechoNoAislado_fondo() {
        return techoNoAislado_fondo;
    }

    public void setTechoNoAislado_fondo(float techoNoAislado_fondo) {
        this.techoNoAislado_fondo = techoNoAislado_fondo;
    }

    public static float getTechadoPlafon_ancho() {
        return techadoPlafon_ancho;
    }

    public void setTechadoPlafon_ancho(float techadoPlafon_ancho) {
        this.techadoPlafon_ancho = techadoPlafon_ancho;
    }

    public static float getTechadoPlafon_fondo() {
        return techadoPlafon_fondo;
    }

    public void setTechadoPlafon_fondo(float techadoPlafon_fondo) {
        this.techadoPlafon_fondo = techadoPlafon_fondo;
    }

    public static float getTechadoNoAislado_ancho() {
        return techadoNoAislado_ancho;
    }

    public void setTechadoNoAislado_ancho(float techadoNoAislado_ancho) {
        this.techadoNoAislado_ancho = techadoNoAislado_ancho;
    }

    public static float getTechadoNoAislado_fondo() {
        return techadoNoAislado_fondo;
    }

    public void setTechadoNoAislado_fondo(float techadoNoAislado_fondo) {
        this.techadoNoAislado_fondo = techadoNoAislado_fondo;
    }

    public static float getNumPerson() {
        return numPerson;
    }

    public void setNumPerson(float numPerson) {
        this.numPerson = numPerson;
    }

    public static float getLuzEquipos() {
        return luzEquipos;
    }

    public void setLuzEquipos(float luzEquipos) {
        this.luzEquipos = luzEquipos;
    }

}

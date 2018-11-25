package com.moran.db;

public class DatosEmpresa {
    private static String nombre;
    private static String correo;
    private static String telefono;
    private static String direccion;
    private static String areaClima;
    private static String planta;
    private static String fecha;

    public DatosEmpresa() {
    }

    public DatosEmpresa(String nombre,String correo, String telefono, String direccion, String areaClima, String planta, String fecha) {
        DatosEmpresa.nombre = nombre;
        DatosEmpresa.correo = correo;
        DatosEmpresa.telefono = telefono;
        DatosEmpresa.direccion = direccion;
        DatosEmpresa.areaClima = areaClima;
        DatosEmpresa.planta = planta;
        DatosEmpresa.fecha = fecha;

    }

    
    public static String getNombre() {
        return nombre;
    }

    public static void setNombre(String nombre) {
        DatosEmpresa.nombre = nombre;
    }

    public static String getCorreo() {
        return correo;
    }

    public static void setCorreo(String correo) {
        DatosEmpresa.correo = correo;
    }

    public static String getTelefono() {
        return telefono;
    }

    public static void setTelefono(String telefono) {
        DatosEmpresa.telefono = telefono;
    }

    public static String getDireccion() {
        return direccion;
    }

    public static void setDireccion(String direccion) {
        DatosEmpresa.direccion = direccion;
    }

    public static String getAreaClima() {
        return areaClima;
    }

    public static void setAreaClima(String areaClima) {
        DatosEmpresa.areaClima = areaClima;
    }

    public static String getPlanta() {
        return planta;
    }

    public static void setPlanta(String planta) {
        DatosEmpresa.planta = planta;
    }

    public static String getFecha() {
        return fecha;
    }

    public static void setFecha(String fecha) {
        DatosEmpresa.fecha = fecha;
    }
}

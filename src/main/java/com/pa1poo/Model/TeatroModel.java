package com.pa1poo.Model;

public class TeatroModel {
    private String perfil;
    private int numEntradas;
    private String dia;
    private String rangoEdad;
    private double precioUnitario;
    private double porcentajeDescuento;
    private double subtotal;
    private double montoDescuento;
    private double montoTotal;
    
    public TeatroModel(String perfil, int numEntradas, String dia) {
        this.perfil = perfil;
        this.numEntradas = numEntradas;
        this.dia = dia;
        this.rangoEdad = obtenerRangoEdad();
        this.precioUnitario = obtenerPrecioUnitario();
    }
    
    public void calcular() {
        this.subtotal = precioUnitario * numEntradas;
        this.porcentajeDescuento = obtenerPorcentajeDescuento();
        this.montoDescuento = subtotal * (porcentajeDescuento / 100.0);
        this.montoTotal = subtotal - montoDescuento;
    }
    
    private String obtenerRangoEdad() {
        switch (perfil) {
            case "Niños":
                return "Menores a 8 años";
            case "Adolescente":
                return "8 a 12 años";
            case "Adulto":
                return "12 a 59 años";
            case "Adulto Mayor":
                return "60 años en adelante";
            default:
                return "No definido";
        }
    }
    
    private double obtenerPrecioUnitario() {
        switch (perfil) {
            case "Niños":
                return 150.0;
            case "Adolescente":
                return 180.0;
            case "Adulto":
                return 220.0;
            case "Adulto Mayor":
                return 200.0;
            default:
                return 0.0;
        }
    }
    
    private double obtenerPorcentajeDescuento() {
        boolean esFinDeSemana = dia.equals("Sábado") || 
                               dia.equals("Domingo") || 
                               dia.equals("Feriado");
        
        if (esFinDeSemana) {
            switch (perfil) {
                case "Niños":
                    return 20.0;
                case "Adolescente":
                    return 15.0;
                case "Adulto":
                    return 5.0;
                case "Adulto Mayor":
                    return 30.0;
            }
        } else {
            switch (perfil) {
                case "Niños":
                    return 35.0;
                case "Adolescente":
                    return 25.0;
                case "Adulto":
                    return 15.0;
                case "Adulto Mayor":
                    return 50.0;
            }
        }
        return 0.0;
    }
    
    public String getPerfil() { return perfil; }
    public int getNumEntradas() { return numEntradas; }
    public String getDia() { return dia; }
    public String getRangoEdad() { return rangoEdad; }
    public double getPrecioUnitario() { return precioUnitario; }
    public double getPorcentajeDescuento() { return porcentajeDescuento; }
    public double getSubtotal() { return subtotal; }
    public double getMontoDescuento() { return montoDescuento; }
    public double getMontoTotal() { return montoTotal; }
}
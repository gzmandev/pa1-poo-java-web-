package com.pa1poo.Model;

public class ConversionModel {
    
    // Tasas de cambio con respecto a USD (1 USD = ?)
    private static final double TASA_USD = 1.0;
    private static final double TASA_EUR = 0.92;      // 1 USD = 0.92 EUR
    private static final double TASA_MXN = 17.05;     // 1 USD = 17.05 MXN
    private static final double TASA_PEN = 3.72;      // 1 USD = 3.72 PEN
    
    /**
     * Obtiene la tasa de cambio de una moneda
     */
    private double obtenerTasa(String moneda) {
        switch (moneda.toUpperCase()) {
            case "USD":
                return TASA_USD;
            case "EUR":
                return TASA_EUR;
            case "MXN":
                return TASA_MXN;
            case "PEN":
                return TASA_PEN;
            default:
                return 1.0;
        }
    }
    
    /**
     * Convierte un monto de una moneda a otra
     * @param monto - Cantidad a convertir
     * @param monedaOrigen - Moneda de origen
     * @param monedaDestino - Moneda de destino
     * @return Monto convertido
     */
    public double convertir(double monto, String monedaOrigen, String monedaDestino) {
        if (monto < 0) {
            return 0;
        }
        
        // Convertir a USD primero
        double tasaOrigen = obtenerTasa(monedaOrigen);
        double montoEnUSD = monto / tasaOrigen;
        
        // Luego convertir de USD a la moneda destino
        double tasaDestino = obtenerTasa(monedaDestino);
        double montoConvertido = montoEnUSD * tasaDestino;
        
        // Redondear a 2 decimales
        return Math.round(montoConvertido * 100.0) / 100.0;
    }
}
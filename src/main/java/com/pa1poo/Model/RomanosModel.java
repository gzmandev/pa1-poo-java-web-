package com.pa1poo.Model;

public class RomanosModel {
    private int numeroNatural;
    private String numeroRomano;
    
    public RomanosModel(int numeroNatural) {
        this.numeroNatural = numeroNatural;
        this.numeroRomano = "";
    }
    
    public void convertir() {
        this.numeroRomano = convertirARomano(numeroNatural);
    }
    
    private String convertirARomano(int num) {
        String[] romanos = {"M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"};
        int[] valores = {1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1};
        
        StringBuilder resultado = new StringBuilder();
        for (int i = 0; i < valores.length; i++) {
            while (num >= valores[i]) {
                resultado.append(romanos[i]);
                num -= valores[i];
            }
        }
        return resultado.toString();
    }
    
    public int getNumeroNatural() { return numeroNatural; }
    public String getNumeroRomano() { return numeroRomano; }
}
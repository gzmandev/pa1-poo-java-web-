package com.pa1poo.Model;

public class TrapecioModel {
    private double baseMenor;
    private double baseMayor;
    private double altura;
    private double ladoDM;
    private double ladoDA;
    private double ladoBC;
    private double areaTrapecio;
    private double areaTrianguloDAM;
    private double perimetro;
    
    public TrapecioModel(double baseMenor, double baseMayor, double altura, 
                         double ladoDM, double ladoDA, double ladoBC) {
        this.baseMenor = baseMenor;
        this.baseMayor = baseMayor;
        this.altura = altura;
        this.ladoDM = ladoDM;
        this.ladoDA = ladoDA;
        this.ladoBC = ladoBC;
        this.areaTrapecio = 0;
        this.areaTrianguloDAM = 0;
        this.perimetro = 0;
    }
    
    public void calcular() {
        calcularAreaTrapecio();
        calcularAreaTrianguloDAM();
        calcularPerimetro();
    }
    
    private void calcularAreaTrapecio() {
        this.areaTrapecio = ((baseMayor + baseMenor) * altura) / 2;
    }
    
    private void calcularAreaTrianguloDAM() {
        this.areaTrianguloDAM = (ladoDM * altura) / 2;
    }
    
    private void calcularPerimetro() {
        this.perimetro = baseMenor + baseMayor + ladoDA + ladoBC;
    }
    
    public double getBaseMenor() { return baseMenor; }
    public double getBaseMayor() { return baseMayor; }
    public double getAltura() { return altura; }
    public double getLadoDM() { return ladoDM; }
    public double getLadoDA() { return ladoDA; }
    public double getLadoBC() { return ladoBC; }
    public double getAreaTrapecio() { return areaTrapecio; }
    public double getAreaTrianguloDAM() { return areaTrianguloDAM; }
    public double getPerimetro() { return perimetro; }
}
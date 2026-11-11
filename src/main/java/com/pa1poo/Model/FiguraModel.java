package com.pa1poo.Model;

public class FiguraModel {
    private String figura;
    private double lado;
    private double altura;
    private double lado1;
    private double lado2;
    private double apotema;
    private double area;
    private double perimetro;
    
    public FiguraModel(String figura, double param1, double param2, 
                      double param3, double param4, double param5) {
        this.figura = figura;
        this.lado = param1;
        this.altura = param2;
        this.lado1 = param3;
        this.lado2 = param4;
        this.apotema = param5;
        this.area = 0;
        this.perimetro = 0;
    }
    
    public void calcular() {
        switch (figura) {
            case "Cuadrado":
                calcularCuadrado();
                break;
            case "Rectángulo":
                calcularRectángulo();
                break;
            case "Triángulo":
                calcularTriángulo();
                break;
            case "Círculo":
                calcularCirculo();
                break;
            case "Pentágono":
                calcularPentágono();
                break;
        }
    }
    
    private void calcularCuadrado() {
        this.area = lado * lado;
        this.perimetro = 4 * lado;
    }
    
    private void calcularRectángulo() {
        this.area = lado * altura;
        this.perimetro = 2 * (lado + altura);
    }
    
    private void calcularTriángulo() {
        this.area = (lado * altura) / 2;
        this.perimetro = lado + lado1 + lado2;
    }
    
    private void calcularCirculo() {
        this.area = Math.PI * lado * lado;
        this.perimetro = 2 * Math.PI * lado;
    }
    
    private void calcularPentágono() {
        this.area = (5 * lado * apotema) / 2;
        this.perimetro = 5 * lado;
    }
    
    public String getFigura() { return figura; }
    public double getArea() { return area; }
    public double getPerimetro() { return perimetro; }
    public double getLado() { return lado; }
    public double getAltura() { return altura; }
    public double getLado1() { return lado1; }
    public double getLado2() { return lado2; }
    public double getApotema() { return apotema; }
}
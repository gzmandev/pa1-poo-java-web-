package com.pa1poo.Controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.pa1poo.Model.FiguraModel;

@WebServlet(name = "FiguraController", urlPatterns = {"/figuras"})
public class FiguraController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/View/FiguraView.jsp")
               .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            String figura = request.getParameter("figura");
            
            if (figura == null || figura.trim().isEmpty()) {
                throw new Exception("Debes seleccionar una figura");
            }
            
            FiguraModel modelo = null;
            
            switch (figura) {
                case "Cuadrado":
                    String ladoCuadrado = request.getParameter("ladoCuadrado");
                    if (ladoCuadrado == null || ladoCuadrado.trim().isEmpty()) {
                        throw new Exception("Debes ingresar el lado del cuadrado");
                    }
                    double lado = Double.parseDouble(ladoCuadrado);
                    modelo = new FiguraModel("Cuadrado", lado, 0, 0, 0, 0);
                    break;
                    
                case "Rectángulo":
                    String largo = request.getParameter("largo");
                    String ancho = request.getParameter("ancho");
                    if (largo == null || largo.trim().isEmpty() || 
                        ancho == null || ancho.trim().isEmpty()) {
                        throw new Exception("Debes ingresar largo y ancho");
                    }
                    modelo = new FiguraModel("Rectángulo", Double.parseDouble(largo), 
                            Double.parseDouble(ancho), 0, 0, 0);
                    break;
                    
                case "Triángulo":
                    String base = request.getParameter("baseTriángulo");
                    String altura = request.getParameter("alturaTriángulo");
                    String lado1 = request.getParameter("lado1");
                    String lado2 = request.getParameter("lado2");
                    if (base == null || base.trim().isEmpty() || 
                        altura == null || altura.trim().isEmpty() ||
                        lado1 == null || lado1.trim().isEmpty() ||
                        lado2 == null || lado2.trim().isEmpty()) {
                        throw new Exception("Debes ingresar todos los valores del triángulo");
                    }
                    modelo = new FiguraModel("Triángulo", Double.parseDouble(base), 
                            Double.parseDouble(altura), Double.parseDouble(lado1), 
                            Double.parseDouble(lado2), 0);
                    break;
                    
                case "Círculo":
                    String radio = request.getParameter("radio");
                    if (radio == null || radio.trim().isEmpty()) {
                        throw new Exception("Debes ingresar el radio");
                    }
                    modelo = new FiguraModel("Círculo", Double.parseDouble(radio), 0, 0, 0, 0);
                    break;
                    
                case "Pentágono":
                    String ladoPentágono = request.getParameter("ladoPentágono");
                    String apotema = request.getParameter("apotema");
                    if (ladoPentágono == null || ladoPentágono.trim().isEmpty() || 
                        apotema == null || apotema.trim().isEmpty()) {
                        throw new Exception("Debes ingresar lado y apotema");
                    }
                    modelo = new FiguraModel("Pentágono", Double.parseDouble(ladoPentágono), 
                            Double.parseDouble(apotema), 0, 0, 0);
                    break;
                    
                default:
                    throw new Exception("Figura no reconocida");
            }
            
            if (modelo != null) {
                modelo.calcular();
                request.setAttribute("modelo", modelo);
                request.setAttribute("exito", true);
            }
            
        } catch (NumberFormatException e) {
            request.setAttribute("exito", false);
            request.setAttribute("error", "Error: Debes ingresar números válidos");
            
        } catch (Exception e) {
            request.setAttribute("exito", false);
            request.setAttribute("error", "Error: " + e.getMessage());
        }
        
        request.getRequestDispatcher("/WEB-INF/View/FiguraView.jsp")
               .forward(request, response);
    }
}
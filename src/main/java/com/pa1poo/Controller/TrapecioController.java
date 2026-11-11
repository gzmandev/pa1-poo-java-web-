package com.pa1poo.Controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.pa1poo.Model.TrapecioModel;

@WebServlet(name = "TrapecioController", urlPatterns = {})
public class TrapecioController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/View/TrapecioView.jsp")
               .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            String baseMenorStr = request.getParameter("baseMenor");
            String baseMayorStr = request.getParameter("baseMayor");
            String alturaStr = request.getParameter("altura");
            String ladoDMStr = request.getParameter("ladoDM");
            String ladoDAStr = request.getParameter("ladoDA");
            String ladoBCStr = request.getParameter("ladoBC");
            
            if (baseMenorStr == null || baseMenorStr.trim().isEmpty() ||
                baseMayorStr == null || baseMayorStr.trim().isEmpty() ||
                alturaStr == null || alturaStr.trim().isEmpty() ||
                ladoDMStr == null || ladoDMStr.trim().isEmpty() ||
                ladoDAStr == null || ladoDAStr.trim().isEmpty() ||
                ladoBCStr == null || ladoBCStr.trim().isEmpty()) {
                throw new Exception("Debes completar todos los campos");
            }
            
            double baseMenor = Double.parseDouble(baseMenorStr);
            double baseMayor = Double.parseDouble(baseMayorStr);
            double altura = Double.parseDouble(alturaStr);
            double ladoDM = Double.parseDouble(ladoDMStr);
            double ladoDA = Double.parseDouble(ladoDAStr);
            double ladoBC = Double.parseDouble(ladoBCStr);
            
            if (baseMenor <= 0 || baseMayor <= 0 || altura <= 0 || 
                ladoDM <= 0 || ladoDA <= 0 || ladoBC <= 0) {
                throw new Exception("Todos los valores deben ser mayores a 0");
            }
            
            TrapecioModel modelo = new TrapecioModel(baseMenor, baseMayor, altura, 
                                                      ladoDM, ladoDA, ladoBC);
            modelo.calcular();
            
            request.setAttribute("modelo", modelo);
            request.setAttribute("exito", true);
            
        } catch (NumberFormatException e) {
            request.setAttribute("exito", false);
            request.setAttribute("error", "Error: Debes ingresar números válidos");
            
        } catch (Exception e) {
            request.setAttribute("exito", false);
            request.setAttribute("error", "Error: " + e.getMessage());
        }
        
        request.getRequestDispatcher("/WEB-INF/View/TrapecioView.jsp")
               .forward(request, response);
    }
}
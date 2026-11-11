package com.pa1poo.Controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.pa1poo.Model.TeatroModel;

@WebServlet(name = "TeatroController", urlPatterns = {})
public class TeatroController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/View/TeatroView.jsp")
               .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            String perfil = request.getParameter("perfil");
            String numEntradasStr = request.getParameter("numEntradas");
            String dia = request.getParameter("dia");
            
            if (perfil == null || perfil.trim().isEmpty() ||
                numEntradasStr == null || numEntradasStr.trim().isEmpty() ||
                dia == null || dia.trim().isEmpty()) {
                throw new Exception("Debes completar todos los campos");
            }
            
            int numEntradas = Integer.parseInt(numEntradasStr);
            
            if (numEntradas < 1 || numEntradas > 100) {
                throw new Exception("El número de entradas debe estar entre 1 y 100");
            }
            
            TeatroModel modelo = new TeatroModel(perfil, numEntradas, dia);
            modelo.calcular();
            
            request.setAttribute("modelo", modelo);
            request.setAttribute("exito", true);
            
        } catch (NumberFormatException e) {
            request.setAttribute("exito", false);
            request.setAttribute("error", "Error: Debes ingresar un número válido");
            
        } catch (Exception e) {
            request.setAttribute("exito", false);
            request.setAttribute("error", "Error: " + e.getMessage());
        }
        
        request.getRequestDispatcher("/WEB-INF/View/TeatroView.jsp")
               .forward(request, response);
    }
}
package com.pa1poo.Controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.pa1poo.Model.RomanosModel;

@WebServlet(name = "RomanosController", urlPatterns = {})
public class RomanosController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Mostrar el formulario vacío
        request.getRequestDispatcher("/WEB-INF/View/RomanosView.jsp")
               .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            // 1.- Obtener parámetro del formulario
            String numeroStr = request.getParameter("numeroNatural");
            
            // 2.- Validar que no sea vacío
            if (numeroStr == null || numeroStr.trim().isEmpty()) {
                throw new Exception("Debes ingresar un número");
            }
            
            int numero = Integer.parseInt(numeroStr);
            
            // Validar rango válido para romanos
            if (numero < 1 || numero > 3999) {
                throw new Exception("El número debe estar entre 1 y 3999");
            }
            
            // 3.- Crear instancia del Model
            RomanosModel modelo = new RomanosModel(numero);
            
            // 4.- Procesar la conversión
            modelo.convertir();
            
            // 5.- Guardar en request
            request.setAttribute("modelo", modelo);
            request.setAttribute("exito", true);
            
        } catch (NumberFormatException e) {
            request.setAttribute("exito", false);
            request.setAttribute("error", "Error: Debes ingresar un número válido");
            
        } catch (Exception e) {
            request.setAttribute("exito", false);
            request.setAttribute("error", "Error: " + e.getMessage());
        }
        
        // 6.- Forward a la vista
        request.getRequestDispatcher("/WEB-INF/View/RomanosView.jsp")
               .forward(request, response);
    }
}
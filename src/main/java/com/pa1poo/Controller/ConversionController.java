package com.pa1poo.Controller;

import java.io.IOException;
import com.pa1poo.Model.ConversionModel;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "ConversionController", urlPatterns = {"/conversion"})
public class ConversionController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Mostrar el formulario
        request.getRequestDispatcher("/WEB-INF/View/ConversionView.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException 
    {
        String montoStr = request.getParameter("txtMonto");
        String monedaOrigen = request.getParameter("cboOrigen");
        String monedaDestino = request.getParameter("cboDestino");
        double monto = 0.0;
        double resultadoConversion = 0.0;
      
        try {
            // Validar que el monto no esté vacío
            if (montoStr != null && !montoStr.isEmpty()) {
                monto = Double.parseDouble(montoStr);
            }
            
            // Validar que se seleccionaron monedas
            if (monedaOrigen == null || monedaOrigen.isEmpty() || 
                monedaDestino == null || monedaDestino.isEmpty()) {
                request.setAttribute("error", "Debe seleccionar las monedas de origen y destino");
                request.getRequestDispatcher("/WEB-INF/View/ConversionView.jsp").forward(request, response);
                return;
            }
            
            // Usar el Model para hacer la conversión
            ConversionModel model = new ConversionModel();
            resultadoConversion = model.convertir(monto, monedaOrigen, monedaDestino);
            
            // Setear atributos para la vista
            request.setAttribute("montoIngresado", String.format("%.2f", monto));
            request.setAttribute("origen", monedaOrigen);
            request.setAttribute("destino", monedaDestino);
            request.setAttribute("resultadoCalculado", String.format("%.2f", resultadoConversion));
            
            // Mostrar el resultado en la misma vista
            request.getRequestDispatcher("/WEB-INF/View/ConversionView.jsp").forward(request, response);
            
        } catch (NumberFormatException e) {
            // En caso de error en el número, volver al formulario con mensaje
            request.setAttribute("error", "Por favor ingresa un número válido");
            try {
                request.getRequestDispatcher("/WEB-INF/View/ConversionView.jsp").forward(request, response);
            } catch (ServletException | IOException ex) {
                response.sendRedirect("conversion");
            }
        }
    }
}
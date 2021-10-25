/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Serverlets;

import Logica.Clases.Paquete;
import Logica.Fabrica;
import Logica.Interfaz.IControladorEspectaculo;
import Logica.Interfaz.IControladorPaquete;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author pabli
 */
@WebServlet(name = "ConsultaPaquete", urlPatterns = {"/Paquete"})
public class ConsultaPaquete extends HttpServlet {

    Fabrica fabrica = Fabrica.getInstance();
    IControladorEspectaculo ICE = fabrica.getIControladorEspectaculo();
    IControladorPaquete ICP = fabrica.getIControladorPaquete();
    
    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

            String paquete = request.getParameter("ver_mas");
            ServletContext context = getServletContext( );
            context.log(paquete);
            String[] datos = paquete.split(",");
            String nombre = datos[0];           request.setAttribute("nombre", nombre);
            String descripcion = datos[1];      request.setAttribute("descripcion", descripcion);
            String fechaInicio = datos[2];      request.setAttribute("fechaIni", fechaInicio);
            String fechaFin = datos[3];         request.setAttribute("fechaFin", fechaFin);
            String descuento = datos[4];        request.setAttribute("descuento", descuento);
            String costo = datos[5];            request.setAttribute("costo", costo);
            String imagen = datos[6];           request.setAttribute("imagen", imagen);
            int id= ICP.getIdUsuario(nombre);
            Map<String, Paquete> paquetes = (Map<String, Paquete>) ICP.getPaquetesQueComproUsuario(id);
            request.setAttribute("paquetes2", paquetes);
            RequestDispatcher view = request.getRequestDispatcher("/Pages/Paquetes/consultaPaquete.jsp");
            view.forward(request, response);

        
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

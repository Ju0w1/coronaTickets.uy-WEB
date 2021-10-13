package Serverlets;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import Logica.Clases.Espectaculo;
import Logica.Clases.Paquete;
import Logica.Clases.Usuario;
import Logica.DataTypes.DTFecha;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Logica.Fabrica;
import Logica.Interfaz.IControladorEspectaculo;
import Logica.Interfaz.IControladorUsuario;
import Logica.Interfaz.IControladorPaquete;
import java.util.HashMap;
import java.util.List;

/**
 *
 * @author LucasCiceri
 */
@WebServlet(name = "Home", urlPatterns = {"/home"})

public class HomeServlet extends HttpServlet {
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    Fabrica fabrica = Fabrica.getInstance();
    IControladorPaquete ICP = fabrica.getIControladorPaquete();
    IControladorEspectaculo ICE = fabrica.getIControladorEspectaculo();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        Map<String, Paquete> paquetes = (Map<String, Paquete>) ICP.getPaquetesV2();
        Map<String, Espectaculo> espectaculos = (Map<String, Espectaculo>) ICE.getEspectaculos();
        try (PrintWriter out = response.getWriter()) {
            request.setAttribute("paquetes", paquetes);
            request.setAttribute("espectaculos", espectaculos);
            RequestDispatcher view = request.getRequestDispatcher("/Pages/Home.jsp");
            view.forward(request, response);
        }
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
        //System.out.println("Hola");
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
        processRequest(request, response);
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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Serverlets;

import Logica.Clases.Categoria;
import Logica.Clases.Paquete;
import Logica.Clases.Plataforma;
import Logica.Fabrica;
import Logica.Interfaz.IControladorEspectaculo;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author pabli
 */
@WebServlet(name = "AltaEspectaculo", urlPatterns = {"/AltaEspectaculo"})
public class AltaEspectaculo extends HttpServlet {

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
    IControladorEspectaculo ICE = fabrica.getIControladorEspectaculo();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        Map<String, Plataforma> plataformas = (Map<String, Plataforma>) ICE.getPlataformas();
        Map<String, Categoria> categorias = (Map<String, Categoria>) ICE.getCategorias();
        try (PrintWriter out = response.getWriter()) {
            request.setAttribute("plataformas", plataformas);
            request.setAttribute("categorias", categorias);
            RequestDispatcher view = request.getRequestDispatcher("/Pages/Espectaculos/altaEspectaculo.jsp");
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
        HttpSession objSesion = request.getSession();
        String user = (String) objSesion.getAttribute("nickname");
        //OBTENIENDO DATOS DEL JSP
        String nombre = request.getParameter("inputNombre");
        String descripcion = request.getParameter("inputDescripcion");
        double duracion = Double.parseDouble(request.getParameter("inputDuracion"));
        String plataforma = request.getParameter("plataforma");
        String[] categorias = request.getParameterValues("categoria");
        
        ServletContext context = getServletContext( );
        //context.log(categorias[0]);
        //context.log(categorias[1]);
        
        int especMin = Integer.parseInt(request.getParameter("inputEspecMin"));
        int especMax = Integer.parseInt(request.getParameter("inputEspecMax"));
        String url = request.getParameter("inputURL");
        double costo = Double.parseDouble(request.getParameter("inputCosto"));
        String urlImagen = request.getParameter("urlImagen");
        
        ICE.altaEspectaculo(plataforma, user, nombre, descripcion, duracion, especMin, especMax, url, costo, "i", urlImagen, categorias);
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

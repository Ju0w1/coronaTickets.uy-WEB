/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Serverlets;

import Logica.Clases.Registro;
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
@WebServlet(name = "RegistroAFuncion", urlPatterns = {"/RegistroAFuncion"})
public class RegistroAFuncion extends HttpServlet {
    Fabrica fabrica = Fabrica.getInstance();
    IControladorEspectaculo ICE = fabrica.getIControladorEspectaculo();
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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
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
        HttpSession objSesion = request.getSession();
        String user = (String) objSesion.getAttribute("nickname");
        response.setContentType("text/html;charset=UTF-8");
        Map<String,Registro> registrosPrevios = ICE.obtenerRegistrosPreviosDeEspectador(user);
        
        if(registrosPrevios.size()>=3){
            request.setAttribute("registrosFunciones", registrosPrevios);
            
            
            String nombreFuncion = (String) request.getParameter("nombreFuncionDesdeFuncion");
            ServletContext context = getServletContext();
            context.log("primero: "+nombreFuncion);
            request.setAttribute("nombreFuncionHaciaRegistro", nombreFuncion);
            RequestDispatcher view = request.getRequestDispatcher("/Pages/Funciones/registroAFuncion.jsp");
            view.forward(request, response);
        }else{
            String nombreFuncion = (String) request.getParameter("nombreFuncion");
            ICE.registroFuncionWEB(nombreFuncion, user);
            RequestDispatcher view = request.getRequestDispatcher("/funciones");
            view.forward(request, response);
        }
        
        
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
                String nombreFuncionAAgregar = (String) request.getParameter("nombreFuncionNueva");
                ServletContext context = getServletContext();
                context.log(nombreFuncionAAgregar);
                String nombreFuncion1 = (String) request.getParameter("funcion1");
                String nombreFuncion2 = (String) request.getParameter("funcion2");
                String nombreFuncion3 = (String) request.getParameter("funcion3");
                ICE.actualizarEstadoDeRegistrosWEB(nombreFuncionAAgregar,nombreFuncion1,nombreFuncion2,nombreFuncion3,user);
                RequestDispatcher view = request.getRequestDispatcher("/funciones");
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

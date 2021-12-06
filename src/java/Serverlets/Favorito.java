/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Serverlets;

import DTOs.FavoritoDTO;
import DTOs.LoginDTO;
import DTOs.UserDTO;
import Logica.Fabrica;
import Logica.Interfaz.IControladorEspectaculo;
import Logica.Interfaz.IControladorPaquete;
import Logica.Interfaz.IControladorUsuario;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.WebApplicationException;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Entity;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

/**
 *
 * @author Admin
 */
@WebServlet(name = "Favorito", urlPatterns = {"/Favorito"})
public class Favorito extends HttpServlet {

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
    IControladorUsuario ICU = fabrica.getIControladorUsuario();
    IControladorPaquete ICP = fabrica.getIControladorPaquete();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Favorito</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Favorito at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
            String favNickname = request.getParameter("favnickname");
            String favNombre = request.getParameter("favnombre");
            HttpSession objSesion = request.getSession();
            
            FavoritoDTO favDTO = new FavoritoDTO(favNickname,favNombre);
            
            Client client = ClientBuilder.newClient();
            WebTarget target = client.target("http://localhost:8080/rest/api/espectaculos/marcarFavorito");
            try {
                Response responseAPI = target.request().accept(MediaType.APPLICATION_JSON).post(Entity.json(favDTO));
                if(responseAPI.getStatus() == 200){
                    request.setAttribute("nombreEspectaculo", favNombre);
                    RequestDispatcher view = request.getRequestDispatcher("/Espectaculo");
                    view.forward(request, response);
                }else{
                    request.setAttribute("nombreEspectaculo", favNombre);
                    RequestDispatcher view = request.getRequestDispatcher("/Home");
                    view.forward(request, response);
                }
            } catch (WebApplicationException e) {
                if(e.getResponse().getStatus()==401){
                    RequestDispatcher view = request.getRequestDispatcher("/Home");
                    view.forward(request, response);
                }
            }
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
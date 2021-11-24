/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Serverlets;

import DTOs.BooleanDTO;
import DTOs.CheckearSorteoDTO;
import DTOs.ListUserDTO;
import DTOs.UserDTO;
import DTOs.funcionDTOSimple;
import DTOs.numeroDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Entity;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.MediaType;

/**
 *
 * @author milto
 */
@WebServlet(name = "Sorteo", urlPatterns = {"/Sorteo"})
public class SorteoServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SorteoServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SorteoServlet at " + request.getContextPath() + "</h1>");
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
        HttpSession objSesion = request.getSession();

        
        if(request.getParameter("funcion")!=null){
            String funcion = request.getParameter("funcion");
            request.setAttribute("funcion", funcion);
            
            Client client5 = ClientBuilder.newClient();
            WebTarget target5 = client5.target("http://localhost:8080/rest/api/usuarios/listarEspectadoresRegistrados");
            funcionDTOSimple funDTO= new funcionDTOSimple(funcion);
            ListUserDTO responseAPI = target5.request(MediaType.APPLICATION_JSON).accept(MediaType.APPLICATION_JSON).post(Entity.json(funDTO), ListUserDTO.class);
            List<UserDTO> listaF = responseAPI.getUsuarios();
            request.setAttribute("usuariosRegistrados", listaF);
            
            WebTarget target = client5.target("http://localhost:8080/rest/api/premios/getCantidadPremios");
            //funcionDTOSimple funDTO= new funcionDTOSimple(funcion);
            numeroDTO responseAPI2 = target.request(MediaType.APPLICATION_JSON).accept(MediaType.APPLICATION_JSON).post(Entity.json(funDTO), numeroDTO.class);
            
            request.setAttribute("cantidadDePremios", responseAPI2);
            
        }
        
        RequestDispatcher view = request.getRequestDispatcher("/Pages/Funciones/sorteo.jsp");
        view.forward(request, response);
        
        
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

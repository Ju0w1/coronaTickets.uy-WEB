/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Serverlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

/**
 *
 * @author pabli
 */
@WebServlet(name = "FinEspectaculo", urlPatterns = {"/FinEspectaculo"})
public class FinEspectaculo extends HttpServlet {

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
        if(request.getParameter("nombreEspectaculoFinalizar") != null){
                String nomEspec = request.getParameter("nombreEspectaculoFinalizar");
                String nuevaFuncionConREGEX = nomEspec.replaceAll(" ", "%20");
                Client client = ClientBuilder.newClient();
                WebTarget target = client.target("http://localhost:8080/rest/api/espectaculos/finalizar?espectaculo="+nuevaFuncionConREGEX);
                Response responseAPI = target.request().accept(MediaType.APPLICATION_JSON).get();
                if(responseAPI.getStatus()==200){
                    RequestDispatcher view = request.getRequestDispatcher("/home");
                    view.forward(request, response);
                }else{
                    RequestDispatcher view = request.getRequestDispatcher("/home");
                    view.forward(request, response);
                }
        }else{
            RequestDispatcher view = request.getRequestDispatcher("/home");
            view.forward(request, response);
        }
       //processRequest(request, response);
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

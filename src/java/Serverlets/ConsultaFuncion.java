/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Serverlets;

import DTOs.UserDTO;
import Logica.Clases.Funcion;
import Logica.Fabrica;
import Logica.Interfaz.IControladorEspectaculo;
import Logica.Interfaz.IControladorFuncion;
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

/**
 *
 * @author milto
 */
@WebServlet(name = "funcion", urlPatterns = {"/funcion"})
public class ConsultaFuncion extends HttpServlet {
    Fabrica fabrica = Fabrica.getInstance();
    IControladorFuncion ICF = fabrica.getIControladorFuncion();
    
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
        String funcionName = "";
        funcionName = request.getParameter("data2");
        HttpSession objSesion = request.getSession();
        System.out.println("Funcion::: " + funcionName);
        /*Funcion funcion;
        funcion = ICF.obtenerFuncion(funcionName);*/
        ////
        Client client = ClientBuilder.newClient();
        WebTarget target = client.target("http://localhost:8080/rest/api/funciones/consulta?funcion="+funcionName);
        try {
                FuncionDTO responseAPI = target.request(MediaType.APPLICATION_JSON).accept(MediaType.APPLICATION_JSON).get(FuncionDTO.class);
                request.setAttribute("funcion", responseAPI);
                RequestDispatcher view = request.getRequestDispatcher("/Pages/Funciones/Funcion.jsp");
                view.forward(request, response);
                //objSesion.setAttribute("tipo", responseAPI.getTipo());
                
                //RequestDispatcher view = request.getRequestDispatcher("/home");
                //view.forward(request, response);
            } catch (WebApplicationException e) {
                if(e.getResponse().getStatus()==401){
                    request.setAttribute("error", "La funcion ingresada no existe.");
                    RequestDispatcher view = request.getRequestDispatcher("/home");
                    view.forward(request, response);
                }
            }
        ////
        /*request.setAttribute("funcion", funcion);
        RequestDispatcher view = request.getRequestDispatcher("/Pages/Funciones/Funcion.jsp");
        view.forward(request, response);*/
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

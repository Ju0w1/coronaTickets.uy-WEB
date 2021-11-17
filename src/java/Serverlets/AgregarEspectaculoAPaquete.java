/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Serverlets;

import DTOs.AgregarEspectaculoAPaqueteDTO;
import DTOs.PaquetesListaDTO;
import DTOs.PlataformaDTO;
import Logica.Clases.Espectaculo;
import Logica.Clases.Paquete;
import Logica.Clases.Plataforma;
import Logica.Fabrica;
import Logica.Interfaz.IControladorEspectaculo;
import Logica.Interfaz.IControladorPaquete;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Map;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.WebApplicationException;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.MediaType;

/**
 *
 * @author pabli
 */
@WebServlet(name = "AgregarEspectaculo", urlPatterns = {"/AgregarEspectaculo"})
public class AgregarEspectaculoAPaquete extends HttpServlet {

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
    IControladorPaquete ICP = fabrica.getIControladorPaquete();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

//        request.setAttribute("paquete", "Paquete");
//        request.setAttribute("plataforma", "Plataforma");
//        try (PrintWriter out = response.getWriter()) {
//            
//        }
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
        //OBTENIENDO DATOS DEL JSP

        String paquete = request.getParameter("paquete");
        String plataforma = request.getParameter("plataforma");

        ServletContext context = getServletContext();
        context.log("paquete:" + paquete);
        context.log("plataforma:" + plataforma);
        Client client = ClientBuilder.newClient();
        WebTarget target = client.target("http://localhost:8080/rest/api/paquetes/obtenerPaquetes");

        Client client2 = ClientBuilder.newClient();
        WebTarget target2 = client2.target("http://localhost:8080/rest/api/paquetes/obtenerPlataformasPaquete");

        if (paquete == null || plataforma == null) {
            try {
                PaquetesListaDTO responseAPIpaquetes = target.request(MediaType.APPLICATION_JSON).get(PaquetesListaDTO.class);
                PlataformaDTO responseAPIplataformas = target2.request(MediaType.APPLICATION_JSON).get(PlataformaDTO.class);
                request.setAttribute("plataformas", responseAPIplataformas);
                request.setAttribute("paquetes", responseAPIpaquetes);
            } catch (WebApplicationException e) {
                request.setAttribute("error", "Error");
            }
        } else {
            Client client3 = ClientBuilder.newClient();
            WebTarget target3 = client3.target("http://localhost:8080/rest/api/espectaculos/obtenerEspectaculosDeArtistas?paquete=Rock%20Uruguayo&plataforma=Twitch&nickname=Natasha.Natasha");
            try {
                AgregarEspectaculoAPaqueteDTO responseAPIEspectaculos = target3.request(MediaType.APPLICATION_JSON).get(AgregarEspectaculoAPaqueteDTO.class);
                context.log("entra:");
                request.setAttribute("espectaculos", responseAPIEspectaculos.getEspectaculos());
                request.setAttribute("plataforma", plataforma);
                request.setAttribute("paquete", paquete);
            } catch (WebApplicationException e) {
                request.setAttribute("error", "Error");
            }
        }

        RequestDispatcher view = request.getRequestDispatcher("/Pages/Paquetes/agregarEspectaculoAPaquete.jsp");
        view.forward(request, response);

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

        String paquete = request.getParameter("paquetePost");
        String espectaculo = request.getParameter("espectaculo");

        ServletContext context = getServletContext();
        context.log("METODO POST");
        context.log("paquete:" + paquete);
        context.log("espectaculo:" + espectaculo);

        ICP.AgregarEspPaq(espectaculo, paquete);
        RequestDispatcher view = request.getRequestDispatcher("/Pages/Paquetes/agregarEspectaculoAPaquete.jsp");
        view.forward(request, response);
        // processRequest(request, response);
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

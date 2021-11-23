/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Serverlets;

import DTOs.ConsultaEspectaculoDTO;
import DTOs.EspecFinalizadoDTO;
import DTOs.TransporteListEspectaculosDePaqueteDTO;
import DTOs.TransporteListaEspecFinalizadosDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
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
 * @author pabli
 */
@WebServlet(name = "ConsultaEspectaculosFinalizados", urlPatterns = {"/ConsultaEspectaculosFinalizados"})
public class ConsultaEspectaculosFinalizados extends HttpServlet {

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
        HttpSession objSesion = request.getSession();
        String user = (String) objSesion.getAttribute("nickname");
        
        Client client = ClientBuilder.newClient();
        WebTarget target = client.target("http://localhost:8080/rest/api/espectaculos/espectaculosFinalizados?artista="+user);
        List<EspecFinalizadoDTO> especsFinalizados = new ArrayList<>();
        try {
            TransporteListaEspecFinalizadosDTO respuesta = target.request(MediaType.APPLICATION_JSON).accept(MediaType.APPLICATION_JSON).get(TransporteListaEspecFinalizadosDTO.class);
            especsFinalizados = respuesta.getEspectaculos();
        } catch (Exception e) {
            System.out.println(e);
        }
        
        request.setAttribute("especsFinalizados", especsFinalizados);
        
        RequestDispatcher view = request.getRequestDispatcher("/Pages/Espectaculos/consultaEspectaculosFinalizados.jsp");
        view.forward(request, response);
        
       //processRequest(request, response);
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
        
        String nombreEspectaculo = request.getParameter("espectaculoGET");
        if(nombreEspectaculo.equals("")){
            HttpSession objSesion = request.getSession();
            String user = (String) objSesion.getAttribute("nickname");

            Client client = ClientBuilder.newClient();
            WebTarget target = client.target("http://localhost:8080/rest/api/espectaculos/espectaculosFinalizados?artista="+user);
            List<EspecFinalizadoDTO> especsFinalizados = new ArrayList<>();
            try {
                TransporteListaEspecFinalizadosDTO respuesta = target.request(MediaType.APPLICATION_JSON).accept(MediaType.APPLICATION_JSON).get(TransporteListaEspecFinalizadosDTO.class);
                especsFinalizados = respuesta.getEspectaculos();
            } catch (Exception e) {
                System.out.println(e);
            }
            request.setAttribute("especsFinalizados", especsFinalizados);
            RequestDispatcher view = request.getRequestDispatcher("/Pages/Espectaculos/consultaEspectaculosFinalizados.jsp");
            view.forward(request, response);    
        }else{
            String nuevaFuncionConREGEX = nombreEspectaculo.replaceAll(" ", "%20");
            Client client2 = ClientBuilder.newClient();
            WebTarget target2 = client2.target("http://localhost:8080/rest/api/espectaculos/finalizados?nombre="+nuevaFuncionConREGEX);

            try {
                ConsultaEspectaculoDTO espectaculo = target2.request(MediaType.APPLICATION_JSON).get(ConsultaEspectaculoDTO.class);
                request.setAttribute("espec", espectaculo);
                RequestDispatcher view = request.getRequestDispatcher("/Pages/Espectaculos/consultaEspectaculosFinalizados.jsp");
                view.forward(request, response);
            } catch (WebApplicationException e) {
                RequestDispatcher view = request.getRequestDispatcher("/home");
                view.forward(request, response);
            }
            
        }
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

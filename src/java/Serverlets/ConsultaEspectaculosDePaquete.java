/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Serverlets;

import DTOs.ConsultaEspectaculoDTO;
import DTOs.TransporteListEspectaculosDePaqueteDTO;
import Logica.Clases.Espectaculo;
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
import javax.ws.rs.WebApplicationException;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.MediaType;

/**
 *
 * @author pabli
 */
@WebServlet(name = "ConsultaEspectaculosDePaquete", urlPatterns = {"/ConsultaEspectaculosDePaquete"})
public class ConsultaEspectaculosDePaquete extends HttpServlet {
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
         ServletContext context = getServletContext( );
        String nombreEspectaculo = request.getParameter("espectaculoGET");
        if(nombreEspectaculo.equals("")){
            HttpSession objSesion = request.getSession();
                request.setAttribute("espec", null);
                String nombrePaquete = (String) objSesion.getAttribute("nombrePaquete");
                
                String nuevaFuncionConREGEX = nombrePaquete.replaceAll(" ", "%20");
               
                Client client = ClientBuilder.newClient();
                WebTarget target = client.target("http://localhost:8080/rest/api/paquetes/consultaEspectaculos?paquete="+nuevaFuncionConREGEX);

                try {
                    TransporteListEspectaculosDePaqueteDTO responseAPI = target.request(MediaType.APPLICATION_JSON).get(TransporteListEspectaculosDePaqueteDTO.class);
                    request.setAttribute("espectaculosPaquete", responseAPI);
                    RequestDispatcher view = request.getRequestDispatcher("/Pages/Espectaculos/consultaEspectaculosDePaquete.jsp");
                    view.forward(request, response);
                }catch(WebApplicationException e){
                    RequestDispatcher view = request.getRequestDispatcher("/home");
                    view.forward(request, response);
                } 
            
        }else{
            String nuevaFuncionConREGEX = nombreEspectaculo.replaceAll(" ", "%20");
            Client client2 = ClientBuilder.newClient();
            WebTarget target2 = client2.target("http://localhost:8080/rest/api/espectaculos?nombre="+nuevaFuncionConREGEX);

            try {
                ConsultaEspectaculoDTO espectaculo = target2.request(MediaType.APPLICATION_JSON).get(ConsultaEspectaculoDTO.class);
                request.setAttribute("espec", espectaculo);
                RequestDispatcher view = request.getRequestDispatcher("/Pages/Espectaculos/consultaEspectaculosDePaquete.jsp");
                view.forward(request, response);
            } catch (WebApplicationException e) {
                RequestDispatcher view = request.getRequestDispatcher("/home");
                view.forward(request, response);
            }
//                Espectaculo espec = (Espectaculo) ICE.getEspectaculoPorNombre(nombreEspectaculo);
//               
//                context.log(espec.getNombre());
//                request.setAttribute("espec", espec);
//                RequestDispatcher view = request.getRequestDispatcher("/Pages/Espectaculos/consultaEspectaculosDePaquete.jsp");
//                view.forward(request, response);
            
        }
                
        //
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
                request.setAttribute("espec", null);
                String nombrePaquete = (String) objSesion.getAttribute("nombrePaquete");
                
                String nuevaFuncionConREGEX = nombrePaquete.replaceAll(" ", "%20");
               
                Client client = ClientBuilder.newClient();
                WebTarget target = client.target("http://localhost:8080/rest/api/paquetes/consultaEspectaculos?paquete="+nuevaFuncionConREGEX);

                try {
                    TransporteListEspectaculosDePaqueteDTO responseAPI = target.request(MediaType.APPLICATION_JSON).get(TransporteListEspectaculosDePaqueteDTO.class);
                    request.setAttribute("espectaculosPaquete", responseAPI);
                    RequestDispatcher view = request.getRequestDispatcher("/Pages/Espectaculos/consultaEspectaculosDePaquete.jsp");
                    view.forward(request, response);
                }catch(WebApplicationException e){
                    RequestDispatcher view = request.getRequestDispatcher("/home");
                    view.forward(request, response);
                }    
                
//                Map<String, Espectaculo> espectaculosDePaquete = (Map<String, Espectaculo>) ICE.obtenerMapEspectaculosDePaquete(nombrePaquete);
//                request.setAttribute("espectaculosPaquete", espectaculosDePaquete);
//                RequestDispatcher view = request.getRequestDispatcher("/Pages/Espectaculos/consultaEspectaculosDePaquete.jsp");
//                view.forward(request, response);
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

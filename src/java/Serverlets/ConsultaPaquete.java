/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Serverlets;

import DTOs.ArtistasDeFuncionDTO;
import DTOs.ConsultaPaqueteDTO;
import DTOs.FuncionConArtistasDTO;
import DTOs.FuncionDTO;
import Logica.Clases.Paquete;
import Logica.Fabrica;
import Logica.Interfaz.IControladorEspectaculo;
import Logica.Interfaz.IControladorPaquete;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.ws.rs.WebApplicationException;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.MediaType;

/**
 *
 * @author pabli
 */
@WebServlet(name = "ConsultaPaquete", urlPatterns = {"/Paquete"})
public class ConsultaPaquete extends HttpServlet {

    Fabrica fabrica = Fabrica.getInstance();
    IControladorEspectaculo ICE = fabrica.getIControladorEspectaculo();
    IControladorPaquete ICP = fabrica.getIControladorPaquete();
    
    
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

            String paquete = request.getParameter("ver_mas");
            ServletContext context = getServletContext( );
            context.log(paquete);
            String[] datos = paquete.split("@");
            String nombre = datos[0];           
            
            HttpSession objSesion = request.getSession();
            String nickUsuario= (String) objSesion.getAttribute("nickname");
            int id= ICP.getIdUsuario(nickUsuario);
            Map<String, Paquete> paquetes = (Map<String, Paquete>) ICP.getPaquetesQueComproUsuario(id);
            request.setAttribute("paquetes2", paquetes);
            
            
            String nuevaFuncionConREGEX = nombre.replaceAll(" ", "%20");
            Client client = ClientBuilder.newClient();
            WebTarget target = client.target("http://localhost:8080/rest/api/paquetes/consultaPaq?paquete="+nuevaFuncionConREGEX);
            
            try {
                ConsultaPaqueteDTO responseAPI = target.request(MediaType.APPLICATION_JSON).get(ConsultaPaqueteDTO.class);

                request.setAttribute("nombre", responseAPI.getNombre());
                request.setAttribute("descripcion", responseAPI.getDescripcion());
                request.setAttribute("fechaIni", responseAPI.getFechaInicio());
                request.setAttribute("fechaFin", responseAPI.getFechaFin());
                request.setAttribute("descuento", responseAPI.getDescuento());

                request.setAttribute("imagen", responseAPI.getImagen());
                
                RequestDispatcher view = request.getRequestDispatcher("/Pages/Paquetes/consultaPaquete.jsp");
                view.forward(request, response);


            } catch (WebApplicationException e) {
                context.log(String.valueOf(e.getResponse().getStatus()));
                if(e.getResponse().getStatus()==401){
                    request.setAttribute("error", "El paquete no existe");
                    RequestDispatcher view = request.getRequestDispatcher("/home");
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

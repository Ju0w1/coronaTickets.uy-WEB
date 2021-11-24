/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Serverlets;

import DTOs.DarPremioDTO;
import DTOs.ListUserDTO;
import DTOs.UserDTO;
import DTOs.funcionDTOSimple;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
@WebServlet(name = "GenerarPremios", urlPatterns = {"/GenerarPremios"})
public class GenerarPremios extends HttpServlet {

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
            out.println("<title>Servlet GenerarPremios</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet GenerarPremios at " + request.getContextPath() + "</h1>");
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
        String nombreFuncion = request.getParameter("nombreFuncion");
        String cantidadASortear = request.getParameter("inputCantidad");
        
        ServletContext context = getServletContext();
        
        Client client1 = ClientBuilder.newClient();
        WebTarget target1 = client1.target("http://localhost:8080/rest/api/usuarios/listarEspectadoresRegistrados");
        funcionDTOSimple funDTO= new funcionDTOSimple(nombreFuncion);
        ListUserDTO responseAPI = target1.request(MediaType.APPLICATION_JSON).accept(MediaType.APPLICATION_JSON).post(Entity.json(funDTO), ListUserDTO.class);
        List<UserDTO> listaEspecs = responseAPI.getUsuarios();
        
        //HashMap<int,UserDTO> usuariosParaSorteo = new HashMap<int,UserDTO>();
        
        HashMap<Integer, String> hash_map = new HashMap<Integer, String>();
        
        int indice = 0;
        ArrayList<Integer> list = new ArrayList<Integer>();
        for (UserDTO listaEspec : listaEspecs) {
            indice++;
            hash_map.put(indice, listaEspec.getNickname());
            list.add(indice);
        }
        Collections.shuffle(list);
        List<String> ganadores = new ArrayList<>();
        for (int i=1; i <= Integer.parseInt(cantidadASortear); i++) {
            ganadores.add(hash_map.get(list.get(i)));
            //context.log("Ganador "+i+": "+usuariosParaSorteo.get(Integer.toString(i)).getNickname());
            
            Client client2 = ClientBuilder.newClient();
            WebTarget target2 = client2.target("http://localhost:8080/rest/api/premios/otorgarPremio");
            
            DarPremioDTO sorteado = new DarPremioDTO(hash_map.get(list.get(i)), nombreFuncion);
            
            Response r = target2.request(MediaType.APPLICATION_JSON).accept(MediaType.APPLICATION_JSON).post(Entity.json(sorteado));
            
            context.log("Ganador "+i+": "+hash_map.get(list.get(i)));
        }
        
        request.setAttribute("ganadores", ganadores);
        request.setAttribute("funcion", nombreFuncion);
                
        RequestDispatcher view = request.getRequestDispatcher("/Pages/Funciones/sorteo.jsp");
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

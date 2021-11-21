/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Serverlets;

import DTOs.BooleanDTO;
import DTOs.ListFuncionesDeUserDTO;
import DTOs.ListPaquetesDeUserDTO;
import DTOs.ListTrophyDTO;
import DTOs.ListUserEspectDTO;
import DTOs.TrophyDTO;
import DTOs.UserDTO;
import DTOs.followDTO;
import Logica.Clases.Artista;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
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
@WebServlet(name = "Trophy", urlPatterns = {"/Trophy"})
public class TrophyServerlet extends HttpServlet {

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
            out.println("<title>Servlet TrophyServerlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet TrophyServerlet at " + request.getContextPath() + "</h1>");
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
        String nick = request.getParameter("data");
        HttpSession objSesion = request.getSession();

//###########################################################################################################################################################################
        // Aqui se visualiza el usuario con el nick recibido
        Client client = ClientBuilder.newClient();
        WebTarget target = client.target("http://localhost:8080/rest/api/usuarios/loadUser");
        UserDTO user = new UserDTO(nick);
        UserDTO responseAPI = target.request(MediaType.APPLICATION_JSON).accept(MediaType.APPLICATION_JSON).post(Entity.json(user), UserDTO.class);

        target = client.target("http://localhost:8080/rest/api//premios/getPremiosDeUser");
        ListTrophyDTO responseAPIpremios = target.request(MediaType.APPLICATION_JSON).accept(MediaType.APPLICATION_JSON).post(Entity.json(user), ListTrophyDTO.class);
        request.setAttribute("premios", responseAPIpremios);
        
        
        //if (responseAPI.getTipo().equals("espectador")){
            UserDTO espect = responseAPI;
            request.setAttribute("Espectador", espect);
            if(objSesion.getAttribute("nickname")==null){
                //RequestDispatcher view = request.getRequestDispatcher("/Pages/Users/Perfil/Espectador.jsp");
                //view.forward(request, response);
            } else {
                if(objSesion.getAttribute("nickname").toString().equals(nick)){
                    RequestDispatcher view = request.getRequestDispatcher("/Pages/Users/Perfil/Espectador-yourself-trophys.jsp");
                    view.forward(request, response);
                } else {
                    //RequestDispatcher view = request.getRequestDispatcher("/Pages/Users/Perfil/Espectador.jsp");
                    //view.forward(request, response);
                }
            }
        //} else {
//            request.setAttribute("Artista", responseAPI);
//            
//            target = client.target("http://localhost:8080/rest/api/usuarios/espectAceptados");
//            UserDTO user2 = new UserDTO(nick); //Primer 'user2' para traer las funciones
//            ListUserEspectDTO responseAPI2 = target.request(MediaType.APPLICATION_JSON).accept(MediaType.APPLICATION_JSON).post(Entity.json(user2), ListUserEspectDTO.class);
//            request.setAttribute("EspectaculosA", responseAPI2);
//            
//            target = client.target("http://localhost:8080/rest/api/usuarios/espectIngresados");
//            //UserDTO user3 = new UserDTO(nick); //Primer 'user2' para traer las funciones
//            ListUserEspectDTO responseAPI3 = target.request(MediaType.APPLICATION_JSON).accept(MediaType.APPLICATION_JSON).post(Entity.json(user2), ListUserEspectDTO.class);
//            request.setAttribute("EspectaculosI", responseAPI3);
//            
//            target = client.target("http://localhost:8080/rest/api/usuarios/espectRechazados");
//            //UserDTO user4 = new UserDTO(nick); //Primer 'user2' para traer las funciones
//            ListUserEspectDTO responseAPI4 = target.request(MediaType.APPLICATION_JSON).accept(MediaType.APPLICATION_JSON).post(Entity.json(user2), ListUserEspectDTO.class);
//            request.setAttribute("EspectaculosR", responseAPI4);
//
//            if(objSesion.getAttribute("nickname")==null){
//                request.setAttribute("login", false);
//                RequestDispatcher view = request.getRequestDispatcher("/Pages/Users/Perfil/Artista.jsp");
//                view.forward(request, response);
//            } else {
//                if(objSesion.getAttribute("nickname").toString().equals(nick)){
//
//                    RequestDispatcher view = request.getRequestDispatcher("/Pages/Users/Perfil/Artista-yourself.jsp");        
//                    view.forward(request, response);
//                } else {
//                    System.out.println("BBBBBBBBBBBBBBBBBBBBBBBBBBHHHHHHHHHHHHHHHHHHHHHHHHHHHHH");
//                    RequestDispatcher view = request.getRequestDispatcher("/Pages/Users/Perfil/Artista.jsp");
//                    view.forward(request, response);
//                }
//            }
        //}
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

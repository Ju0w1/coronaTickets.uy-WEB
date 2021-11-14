/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Serverlets;

import DTOs.UserDTO;
import Logica.Clases.Artista;
import Logica.Clases.Espectador;
import Logica.Clases.Usuario;
import Logica.DataTypes.DTFecha;
import Logica.Fabrica;
import Logica.Interfaz.IControladorUsuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
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
@WebServlet(name = "EditUser", urlPatterns = {"/EditUser"})
public class EditUserServlet extends HttpServlet {
    Fabrica fabrica = Fabrica.getInstance();
    IControladorUsuario ICU = fabrica.getIControladorUsuario();
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
            out.println("<title>Servlet EditUserServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditUserServlet at " + request.getContextPath() + "</h1>");
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
        
        String nick = "";
        if(request.getParameter("nick")!=null){
            nick = request.getParameter("nick");
            System.out.println("Me llego el nick: " + nick);
        }
        
        UserDTO user = new UserDTO(nick);
        Client client = ClientBuilder.newClient();
        WebTarget target = client.target("http://localhost:8080/rest/api/usuarios/edit");
        UserDTO responseAPI = target.request(MediaType.APPLICATION_JSON).accept(MediaType.APPLICATION_JSON).post(Entity.json(user), UserDTO.class);
        
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");  
        Date date = responseAPI.getNacimiento();
        String strDate = dateFormat.format(date);  
        String[] datos = strDate.split("-");
        int dia = Integer.parseInt(datos[2]);
        int mes = Integer.parseInt(datos[1]);
        int anio = Integer.parseInt(datos[0]);
        DTFecha fecha = new DTFecha(dia, mes, anio);
        if(responseAPI.getTipo().equals("artista")){
            Artista art = new Artista(responseAPI.getNickname(), responseAPI.getNombre(),responseAPI.getApellido(), responseAPI.getEmail(), fecha, responseAPI.getDesc(), responseAPI.getBio(), responseAPI.getLink(), responseAPI.getUrl_imagen());
            request.setAttribute("artista", art);
            System.out.println("BIEND DE BIEN");
        } else {
            Usuario espec = new Usuario(responseAPI.getNickname(), responseAPI.getNombre(), responseAPI.getApellido(), responseAPI.getEmail(), fecha, responseAPI.getUrl_imagen());
            request.setAttribute("espectador", espec);
        }
        
//        if(ICU.obtenerArtistaPorNick(nick)!=null){ // ES ARTISTA
//            Artista art = ICU.obtenerArtistaPorNick(nick);
//            request.setAttribute("artista", art);
//        } else { //ES ESPECTADOR
//            Usuario espec = ICU.obtenerEspectadorPorNick(nick);
//            request.setAttribute("espectador", espec);
//        }

        RequestDispatcher view = request.getRequestDispatcher("/Pages/Users/Perfil/EditUser.jsp");
        view.forward(request, response);
        
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

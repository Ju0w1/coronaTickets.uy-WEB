/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Serverlets;

import DTOs.ListFuncionesDeUserDTO;
import DTOs.ListPaquetesDeUserDTO;
import DTOs.UserDTO;
import Logica.Clases.Artista;
import Logica.Clases.Espectaculo;
import Logica.Clases.Funcion;
import Logica.Clases.Paquete;
import Logica.Clases.Usuario;
import Logica.Fabrica;
import Logica.Interfaz.IControladorEspectaculo;
import Logica.Interfaz.IControladorPaquete;
import Logica.Interfaz.IControladorUsuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;
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
@WebServlet(name = "User", urlPatterns = {"/User"})
public class TestServlet extends HttpServlet {
 Fabrica fabrica = Fabrica.getInstance();
    IControladorUsuario ICU = fabrica.getIControladorUsuario();
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
        String nick = request.getParameter("data");
        
            System.out.println("USERRRRRRRRRRRRRRRRR" + nick);
        HttpSession objSesion = request.getSession();
        
        //############################################################################################################################################################# CAMBIAR A LA API Y QUEDA LISTO
        if(request.getParameter("user")!=null){
            System.out.println("DEJAR DE SEGUIRRRRRRR");
           ICU.dejarDeSeguirUsuario(request.getParameter("yo"),request.getParameter("user"));
        }
        if(request.getParameter("user2")!=null){
            System.out.println("SEGUIRRRRRRR");
           ICU.seguirUsuario(request.getParameter("yo2"),request.getParameter("user2"));
        }
        //#############################################################################################################################################################
        
        Client client = ClientBuilder.newClient();
        WebTarget target = client.target("http://localhost:8080/rest/api/usuarios/loadUser");
        UserDTO user = new UserDTO(nick);
        UserDTO responseAPI = target.request(MediaType.APPLICATION_JSON).accept(MediaType.APPLICATION_JSON).post(Entity.json(user), UserDTO.class);
        
        
        
        if (responseAPI.getTipo().equals("espectador")){
            System.out.println("NO ES ARTISTA");
            UserDTO espect = responseAPI;
            System.out.println("ES ESPECTADOR");
            request.setAttribute("Espectador", espect);
            
            target = client.target("http://localhost:8080/rest/api/usuarios/mapsUser");
            UserDTO user2 = new UserDTO(nick); //Primer 'user2' para traer las funciones
            
            ListFuncionesDeUserDTO responseAPI2 = target.request(MediaType.APPLICATION_JSON).accept(MediaType.APPLICATION_JSON).post(Entity.json(user2), ListFuncionesDeUserDTO.class);
            request.setAttribute("Funciones", responseAPI2);
            
            target = client.target("http://localhost:8080/rest/api/usuarios/paquetesUser");
            //user2.setTipo("asdasd"); //SOLO PARA DIFERENCIAR un 'user2' del otro porque los eenvio al mismo /mapsUser de la API
            ListPaquetesDeUserDTO responseAPI3 = target.request(MediaType.APPLICATION_JSON).accept(MediaType.APPLICATION_JSON).post(Entity.json(user2), ListPaquetesDeUserDTO.class);
            request.setAttribute("paquetes", responseAPI3);

            if(objSesion.getAttribute("nickname")==null){
                request.setAttribute("login", false);
                RequestDispatcher view = request.getRequestDispatcher("/Pages/Users/Perfil/Espectador.jsp");
                view.forward(request, response);
            } else {
                if(objSesion.getAttribute("nickname").toString().equals(nick)){
                    RequestDispatcher view = request.getRequestDispatcher("/Pages/Users/Perfil/Espectador-yourself.jsp");
                    view.forward(request, response);
                } else {
                    RequestDispatcher view = request.getRequestDispatcher("/Pages/Users/Perfil/Espectador.jsp");
                    view.forward(request, response);
                }
            }
        } else {
            Artista art=ICU.obtenerArtistaPorNick(nick);
            System.out.println("IMAGEN GUARDADA: " + art.getImagen());
            request.setAttribute("Artista", art);
            Map<String, Espectaculo> espectaculosA = ICE.obtenerEspectaculosAceptadosDeArtistaPorNick(nick);
            Map<String, Espectaculo> espectaculosI = ICE.obtenerEspectaculosIngresadosDeArtistaPorNick(nick);
            Map<String, Espectaculo> espectaculosR = ICE.obtenerEspectaculosRechazadosDeArtistaPorNick(nick);
            
            request.setAttribute("EspectaculosA", espectaculosA);
            request.setAttribute("EspectaculosI", espectaculosI);
            request.setAttribute("EspectaculosR", espectaculosR);
            if (espectaculosA.isEmpty()){
                System.out.println("ESPECTACULOS VACIOS");
            }
            if(objSesion.getAttribute("nickname")==null){
                request.setAttribute("login", false);
                RequestDispatcher view = request.getRequestDispatcher("/Pages/Users/Perfil/Artista.jsp");
                    view.forward(request, response);
            } else {
                if(objSesion.getAttribute("nickname").toString().equals(nick)){
                    System.out.println("AHHH");
                    System.out.println("SITIO: " + art.getLinkWeb());
                    RequestDispatcher view = request.getRequestDispatcher("/Pages/Users/Perfil/Artista-yourself.jsp");
                    view.forward(request, response);
                } else {
                    
                    System.out.println("BBBBBBBBBBBBBBBBBBBBBBBBBBHHHHHHHHHHHHHHHHHHHHHHHHHHHHH");
                    RequestDispatcher view = request.getRequestDispatcher("/Pages/Users/Perfil/Artista.jsp");
                    view.forward(request, response);
                }
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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Serverlets;

import DTOs.BooleanDTO;
import DTOs.DejarDeSeguirUsuarioDTO;
import DTOs.FuncionDTO;
import DTOs.SeguirUsuarioDTO;
import DTOs.ListFuncionesDeUserDTO;
import DTOs.ListPaquetesDeUserDTO;
import DTOs.ListUserEspectDTO;
import DTOs.UserDTO;
import DTOs.followDTO;
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
import javax.ws.rs.WebApplicationException;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Entity;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

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
//        if(request.getParameter("user")!=null){
//            System.out.println("DEJAR DE SEGUIRRRRRRR");
//           ICU.dejarDeSeguirUsuario(request.getParameter("yo"),request.getParameter("user"));
//        }
//        if(request.getParameter("user2")!=null){
//            System.out.println("SEGUIRRRRRRR");
//           ICU.seguirUsuario(request.getParameter("yo2"),request.getParameter("user2"));
//        }
        if(request.getParameter("user")!=null){
            Client client = ClientBuilder.newClient();
            WebTarget target = client.target("http://localhost:8080/rest/api/usuarios/dejar");
            try {
                DejarDeSeguirUsuarioDTO dejar = new DejarDeSeguirUsuarioDTO(request.getParameter("user"),request.getParameter("yo"));
                Response responseAPI = target.request(MediaType.APPLICATION_JSON).post(Entity.json(dejar));
            }catch(WebApplicationException e){
                System.err.println(e);
            }
            //ICU.dejarDeSeguirUsuario(request.getParameter("yo"),request.getParameter("user"));
        }
        if(request.getParameter("user2")!=null){
            Client client2 = ClientBuilder.newClient();
            WebTarget target2 = client2.target("http://localhost:8080/rest/api/usuarios/seguir");
            try {
                SeguirUsuarioDTO seguir = new SeguirUsuarioDTO(request.getParameter("user2"),request.getParameter("yo2"));
                Response responseAPI = target2.request(MediaType.APPLICATION_JSON).post(Entity.json(seguir));
            }catch(WebApplicationException e){
                System.err.println(e);
            }
            //ICU.seguirUsuario(request.getParameter("yo2"),request.getParameter("user2"));
        }
        //#############################################################################################################################################################
        
        Client client = ClientBuilder.newClient();
        WebTarget target = client.target("http://localhost:8080/rest/api/usuarios/loadUser");
        UserDTO user = new UserDTO(nick);
        UserDTO responseAPI = target.request(MediaType.APPLICATION_JSON).accept(MediaType.APPLICATION_JSON).post(Entity.json(user), UserDTO.class);
        
        target = client.target("http://localhost:8080/rest/api/usuarios/Losigo");
        followDTO siguiendo = new followDTO(objSesion.getAttribute("nickname").toString(), nick);
        BooleanDTO responseAPIX = target.request(MediaType.APPLICATION_JSON).accept(MediaType.APPLICATION_JSON).post(Entity.json(siguiendo), BooleanDTO.class);
        if(responseAPIX.getDato()==true){
            request.setAttribute("losigo", true);
        } else {
            request.setAttribute("losigo", false);
        }
        
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
            //Artista art=ICU.obtenerArtistaPorNick(nick);
            //System.out.println("IMAGEN GUARDADA: " + art.getImagen());
            request.setAttribute("Artista", responseAPI);
            
            target = client.target("http://localhost:8080/rest/api/usuarios/espectAceptados");
            UserDTO user2 = new UserDTO(nick); //Primer 'user2' para traer las funciones
            ListUserEspectDTO responseAPI2 = target.request(MediaType.APPLICATION_JSON).accept(MediaType.APPLICATION_JSON).post(Entity.json(user2), ListUserEspectDTO.class);
            request.setAttribute("EspectaculosA", responseAPI2);
            
            target = client.target("http://localhost:8080/rest/api/usuarios/espectIngresados");
            //UserDTO user3 = new UserDTO(nick); //Primer 'user2' para traer las funciones
            ListUserEspectDTO responseAPI3 = target.request(MediaType.APPLICATION_JSON).accept(MediaType.APPLICATION_JSON).post(Entity.json(user2), ListUserEspectDTO.class);
            request.setAttribute("EspectaculosI", responseAPI3);
            
            target = client.target("http://localhost:8080/rest/api/usuarios/espectRechazados");
            //UserDTO user4 = new UserDTO(nick); //Primer 'user2' para traer las funciones
            ListUserEspectDTO responseAPI4 = target.request(MediaType.APPLICATION_JSON).accept(MediaType.APPLICATION_JSON).post(Entity.json(user2), ListUserEspectDTO.class);
            request.setAttribute("EspectaculosR", responseAPI4);

            if(objSesion.getAttribute("nickname")==null){
                request.setAttribute("login", false);
                RequestDispatcher view = request.getRequestDispatcher("/Pages/Users/Perfil/Artista.jsp");
                view.forward(request, response);
            } else {
                if(objSesion.getAttribute("nickname").toString().equals(nick)){
                    System.out.println("AHHH");
                    //System.out.println("SITIO: " + art.getLinkWeb());
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

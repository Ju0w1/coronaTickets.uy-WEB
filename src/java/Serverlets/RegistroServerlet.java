/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Serverlets;

import DTOs.LoginDTO;
import DTOs.RegistroDTO;
import DTOs.UserDTO;
import Logica.Fabrica;
import Logica.Interfaz.IControladorUsuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
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
import javax.ws.rs.client.Entity;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.MediaType;

/**
 *
 * @author pabli
 */
@WebServlet(name = "Registro", urlPatterns = {"/registro"})
public class RegistroServerlet extends HttpServlet {

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
            RequestDispatcher view = request.getRequestDispatcher("/Pages/Login/registro.jsp");
            view.forward(request, response);
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
        String nickname = request.getParameter("inputNickname");
        String password1 = request.getParameter("inputPassword1");
        String password2 = request.getParameter("inputPassword2");
        String email = request.getParameter("inputEmail1");
        String nombre = request.getParameter("inputNombre");
        String apellido = request.getParameter("inputApellido");
        String nacimiento = request.getParameter("inputNacimiento");
        String imagen = request.getParameter("urlImagen");
        
        HttpSession objSesion = request.getSession();
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date fechaNacimiento = new Date();
        try {
            fechaNacimiento = format.parse(nacimiento);
        } catch (ParseException ex) {
            Logger.getLogger(RegistroServerlet.class.getName()).log(Level.SEVERE, null, ex);
        }
              
        String accion = request.getParameter("registrar");
        
        if(accion == null){
            request.setAttribute("error", "Revisa tus datos!");
            RequestDispatcher view = request.getRequestDispatcher("/Pages/Login/registro.jsp");
            view.forward(request, response);
        }else if(accion.equals("espectador")){//Presionó el botón de registrarse como espectador
            RegistroDTO userARegistrar = new RegistroDTO(nickname, nombre, apellido, password1, fechaNacimiento, email, imagen);
            Client client = ClientBuilder.newClient();
            WebTarget target = client.target("http://localhost:8080/rest/api/auth/registroEspectador");
            try {
                UserDTO responseAPI = target.request(MediaType.APPLICATION_JSON).accept(MediaType.APPLICATION_JSON).post(Entity.json(userARegistrar), UserDTO.class);
                objSesion.setAttribute("nickname", responseAPI.getNickname());
                objSesion.setAttribute("nombre", responseAPI.getNombre());
                objSesion.setAttribute("apellido", responseAPI.getApellido());
                objSesion.setAttribute("mail", responseAPI.getEmail());
                objSesion.setAttribute("nacimiento", responseAPI.getNacimiento());
                objSesion.setAttribute("imagen", responseAPI.getUrl_imagen());
                objSesion.setAttribute("tipo", "espectador");

                request.setAttribute("message", "Registrado con éxito, Bienvenido");
                RequestDispatcher view = request.getRequestDispatcher("/home");
                //response.sendRedirect("/Pages/Home.jsp");
                view.forward(request, response);
            } catch (WebApplicationException e) {
                if(e.getResponse().getStatus()==401){
                    request.setAttribute("error", "El usuario ya existe o no se pudo registrar por otro motivo");
                    RequestDispatcher view = request.getRequestDispatcher("/Pages/Login/login.jsp");
                    view.forward(request, response);
                }
            }
        }else if(accion.equals("artista")){//Presionó el botón de registrarse como artista
            request.setAttribute("error", "error");
            request.setAttribute("rnick", nickname);
            request.setAttribute("rpass1", password1);
            request.setAttribute("rpass2", password2);
            request.setAttribute("remail", email);
            request.setAttribute("rnombre", nombre);
            request.setAttribute("rapellido", apellido);
            request.setAttribute("rdate", nacimiento);
            RequestDispatcher view = request.getRequestDispatcher("/Pages/Login/registroArtista.jsp");
            view.forward(request, response);
        }
        
                ///////////////////////////////////////////////////////////////
        
//        if (ICU.addEspectador(nickname, password1, email, nombre, apellido, nacimiento, imagen)) {
//            objSesion.setAttribute("nickname", nickname);
//            objSesion.setAttribute("nombre", nombre);
//            objSesion.setAttribute("apellido", apellido);
//            objSesion.setAttribute("mail", email);
//            objSesion.setAttribute("nacimiento", nacimiento);
//            objSesion.setAttribute("imagen", imagen);
//            if (accion == null) { //No presionó ningun botón pero se ejecutó el submit...
//                request.setAttribute("error", "Revisa tus datos!");
//                RequestDispatcher view = request.getRequestDispatcher("/Pages/Login/registro.jsp");
//                view.forward(request, response);
//            } else if (accion.equals("espectador")) {//Presionó el botón de registrarse como espectador
//                objSesion.setAttribute("tipo", "espectador");
//                request.setAttribute("message", "Registrado con éxito, Bienvenido");
//                RequestDispatcher view = request.getRequestDispatcher("/home");
//                view.forward(request, response);
//            } else if (accion.equals("artista")) {//Presionó el botón de registrarse como artista
//                RequestDispatcher view = request.getRequestDispatcher("/Pages/Login/registroArtista.jsp");
//                view.forward(request, response);
//            } else { //El código HTML fue alterado
//                request.setAttribute("error", "Revisa tus datos!");
//                RequestDispatcher view = request.getRequestDispatcher("/Pages/Login/registro.jsp");
//                view.forward(request, response);
//            }
//        } else {
//            request.setAttribute("error", "error");
//            request.setAttribute("rnick", nickname);
//            request.setAttribute("rpass1", password1);
//            request.setAttribute("rpass2", password2);
//            request.setAttribute("remail", email);
//            request.setAttribute("rnombre", nombre);
//            request.setAttribute("rapellido", apellido);
//            request.setAttribute("rdate", nacimiento);
//            RequestDispatcher view = request.getRequestDispatcher("/Pages/Login/registro.jsp");
//            view.forward(request, response);
//        }

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

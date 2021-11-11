/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Serverlets;

import DTOs.LoginDTO;
import DTOs.UserDTO;
import Logica.Clases.Usuario;
import Logica.Fabrica;
import Logica.Interfaz.IControladorUsuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
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
import javax.ws.rs.client.Entity;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.MediaType;

/**
 *
 * @author pabli
 */
@WebServlet(name = "Login", urlPatterns = {"/login"})
public class LoginServerlet extends HttpServlet {
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
            RequestDispatcher view = request.getRequestDispatcher("/Pages/Login/login.jsp");
            //RequestDispatcher view = request.getRequestDispatcher("/Pages/Funciones/Funciones-list.jsp");
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
            String email = request.getParameter("user");
            String password = request.getParameter("password");
            //Map <String,Usuario> users = (Map <String,Usuario>) ICU.obtenerUsuarios();
            //Usuario clientUser = users.get(email);
            HttpSession objSesion = request.getSession();
            
            LoginDTO login = new LoginDTO(email,password);
            Client client = ClientBuilder.newClient();
            WebTarget target = client.target("http://localhost:8080/rest/api/auth/login");
            ServletContext context = getServletContext( );
            try {
                UserDTO responseAPI = target.request(MediaType.APPLICATION_JSON).accept(MediaType.APPLICATION_JSON).post(Entity.json(login), UserDTO.class);
                request.setAttribute("message", "Bienvenido");
                objSesion.setAttribute("nickname", responseAPI.getNickname());
                objSesion.setAttribute("nombre", responseAPI.getNombre());
                objSesion.setAttribute("apellido", responseAPI.getApellido());
                objSesion.setAttribute("mail", responseAPI.getEmail());
                objSesion.setAttribute("nacimiento", responseAPI.getNacimiento());
                objSesion.setAttribute("imagen", responseAPI.getUrl_imagen());
                objSesion.setAttribute("tipo", responseAPI.getTipo());
                
                RequestDispatcher view = request.getRequestDispatcher("/home");
                view.forward(request, response);
            } catch (WebApplicationException e) {
                if(e.getResponse().getStatus()==401){
                    request.setAttribute("error", "La contraseña y/o el Nickname ingresado no son válidos.");
                    RequestDispatcher view = request.getRequestDispatcher("/Pages/Login/login.jsp");
                    view.forward(request, response);
                }
            }
            
//            if(clientUser != null){
//                if (ICU.login(email, password)==true) {
//                    objSesion.setAttribute("nickname", clientUser.getNickname());
//                    objSesion.setAttribute("nombre", clientUser.getNombre());
//                    objSesion.setAttribute("apellido", clientUser.getApellido());
//                    objSesion.setAttribute("mail", clientUser.getEmail());
//                    objSesion.setAttribute("nacimiento", clientUser.getNacimiento());
//                    objSesion.setAttribute("imagen", clientUser.getImagen());
//
//                    String tipo = ICU.esEspectador(clientUser.getNickname());
//                    if(tipo.equals("error")){
//                        objSesion.setAttribute("tipo", "Error de usuario");
//                    }else{
//                        objSesion.setAttribute("tipo", tipo);
//                    }
//
//                    request.setAttribute("message", "Bienvenido");
//                    RequestDispatcher view = request.getRequestDispatcher("/home");
//                    view.forward(request, response);
//                } else {
//                    request.setAttribute("error", "La contraseña y/o el Nickname ingresado no son válidos.");
//                    request.setAttribute("loginNickname", email);
//                    request.setAttribute("loginPassword", password);
//                    RequestDispatcher view = request.getRequestDispatcher("/Pages/Login/login.jsp");
//                    view.forward(request, response);
//                }
//            }else{
//                request.setAttribute("error", "Revise las mayusculas y minusculas");
//                request.setAttribute("loginNickname", email);
//                request.setAttribute("loginPassword", password);
//                RequestDispatcher view = request.getRequestDispatcher("/Pages/Login/login.jsp");
//                view.forward(request, response);
//            }
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

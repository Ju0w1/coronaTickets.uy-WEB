/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Serverlets;

import DTOs.RegistroDTO;
import DTOs.UserDTO;
import Logica.DataTypes.DTFecha;
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
 * @author Admin
 */
@WebServlet(name = "RegistroArtistaServerlet", urlPatterns = {"/registroartista"})
public class RegistroArtistaServerlet extends HttpServlet {

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
            out.println("<title>Servlet RegistroArtistaServerlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegistroArtistaServerlet at " + request.getContextPath() + "</h1>");
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
        HttpSession objSesion = request.getSession();
        String nickname = objSesion.getAttribute("nickname").toString();
        String descripcion = request.getParameter("inputDescripcion");
        String biografia = request.getParameter("inputBiografia");
        String url = request.getParameter("inputUrl");
        
        String password1 = request.getParameter("rpass1");
        String email = request.getParameter("remail");
        String nombre = request.getParameter("rnombre");
        String apellido = request.getParameter("rapellido");
        String fechaNacimiento =request.getParameter("rdate");
        String imagen = request.getParameter("rimagen");
        
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date fechaNacimientoEnviar = new Date();
        try {
            fechaNacimientoEnviar = format.parse(fechaNacimiento);
        } catch (ParseException ex) {
            Logger.getLogger(RegistroServerlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        RegistroDTO userARegistrar = new RegistroDTO(nickname, nombre, apellido, password1, fechaNacimientoEnviar, email, imagen);
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
            
            RegistroDTO userARegistrarArt = new RegistroDTO(biografia, descripcion, url, nickname);
            Client client2 = ClientBuilder.newClient();
            WebTarget target2 = client2.target("http://localhost:8080/rest/api/auth/registroArtista");
            
            Response respuesta = target2.request().accept(MediaType.APPLICATION_JSON).post(Entity.json(userARegistrarArt));
            if(respuesta.getStatus()==200){
                objSesion.setAttribute("tipo", "artista");
                request.setAttribute("message", "Registrado con éxito, Bienvenido");
                RequestDispatcher view = request.getRequestDispatcher("/home"); 
                view.forward(request, response);
            }else{
                objSesion.setAttribute("tipo", "error");
                RequestDispatcher view = request.getRequestDispatcher("Pages/Login/login.jsp");
                view.forward(request, response);
            }
            //response.sendRedirect("/Pages/Home.jsp");
            
            //
        } catch (WebApplicationException e) {
            if(e.getResponse().getStatus()==401){
                request.setAttribute("error", "El usuario ya existe o no se pudo registrar por otro motivo");
                RequestDispatcher view = request.getRequestDispatcher("/Pages/Login/login.jsp");
                view.forward(request, response);
            }
        }
        
//        if (ICU.addArtista(nickname, descripcion, biografia, url) == true) {
//            objSesion.setAttribute("tipo", "artista");
//            RequestDispatcher view = request.getRequestDispatcher("home");
//            view.forward(request, response);
//        } else {
//            objSesion.setAttribute("tipo", "error");
//            RequestDispatcher view = request.getRequestDispatcher("Pages/Login/login.jsp");
//            view.forward(request, response);
//        }
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

    public DTFecha dateToDTFecha(java.sql.Date fecha) {
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String fechaDB = dateFormat.format(fecha);
        String[] partes = fechaDB.split("-");
        return new DTFecha(Integer.parseInt(partes[2]), Integer.parseInt(partes[1]), Integer.parseInt(partes[0]));
    }

}

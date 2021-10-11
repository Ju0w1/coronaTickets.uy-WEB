package Serverlets;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import Logica.Clases.Artista;
import Logica.Clases.Espectador;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Logica.Clases.Usuario;
import Logica.Fabrica;
import Logica.Interfaz.IControladorPaquete;
import Logica.Interfaz.IControladorUsuario;
import java.util.HashSet;
import org.apache.jasper.tagplugins.jstl.core.Url;

/**
 *
 * @author LucasCiceri
 */
@WebServlet(name = "Users", urlPatterns = {"/users"})
public class UsersServlet extends HttpServlet {

    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    Fabrica fabrica = Fabrica.getInstance();
    IControladorUsuario ICU = fabrica.getIControladorUsuario();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        Map<String, Usuario> usuarios = (Map<String, Usuario>) ICU.obtenerUsuarios();
        String respuesta;
        if(usuarios.isEmpty()){
            System.out.println("NO HAY USERS");
            respuesta="Vacio";
        }else{
            System.out.println("SI HAY USERS");
            respuesta="No vacio";
        }
        try (PrintWriter out = response.getWriter()) {
            request.setAttribute("usuarios", usuarios);
            request.setAttribute("mensaje", respuesta);
            RequestDispatcher view = request.getRequestDispatcher("/Pages/Users/Users-list.jsp");
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
        String nickname = request.getParameter("nick");
        
        if (ICU.obtenerArtistaPorNick(nickname)==null){
            System.out.println("NO ES ARTISTA");
            Usuario espect = ICU.obtenerEspectadorPorNick(nickname);
            System.out.println("ES ESPECTADOR");
            request.setAttribute("Espectador", espect);
            RequestDispatcher view = request.getRequestDispatcher("/Pages/Users/Perfil/Espectador.jsp");
            view.forward(request, response);
        } else {
            Artista art=ICU.obtenerArtistaPorNick(nickname);
            System.out.println("IMAGEN GUARDADA: " + art.getImagen());
            
            request.setAttribute("Artista", art);
            RequestDispatcher view = request.getRequestDispatcher("/Pages/Users/Perfil/Artista.jsp");
            view.forward(request, response);
        }
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

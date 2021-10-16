/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Serverlets;

import Logica.Fabrica;
import Logica.Clases.Artista;
import Logica.Clases.Espectaculo;
import Logica.Clases.Funcion;
import Logica.Clases.Usuario;

import Logica.Interfaz.IControladorEspectaculo;
import Logica.Interfaz.IControladorFuncion;

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

/**
 *
 * @author milto
 */
@WebServlet(name = "Usuario", urlPatterns = {"/Usuario"})
public class UserDetalleServlet extends HttpServlet {

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
    IControladorEspectaculo ICE = fabrica.getIControladorEspectaculo();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
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
//        ServletContext context = getServletContext( );
//        context.log(user);
//        String[] datos = user.split(",");
        //int size = datos.length;
//        String nick = datos[0];           request.setAttribute("nick", nick);
//        String nombre = datos[1];      request.setAttribute("nombre", nombre);
//        String apellido = datos[2];      request.setAttribute("apellido", apellido);
//        String email = datos[3];         request.setAttribute("email", email);
//        String imagen = datos[4];        request.setAttribute("imagen", imagen);
//        String nacimiento = datos[5];            request.setAttribute("nacimiento", nacimiento);
        //String imagen = datos[6];           request.setAttribute("imagen", imagen);
        /*if(size<7){
            String web = datos[0];           request.setAttribute("web", web);
            String desc = datos[1];      request.setAttribute("desc", desc);
            String bio = datos[2];      request.setAttribute("bio", bio);   
            RequestDispatcher view = request.getRequestDispatcher("/Pages/Users/Perfil/Artista.jsp");
            view.forward(request, response);
        } else{*/
        
        if (ICU.obtenerArtistaPorNick(nick)==null){
            System.out.println("NO ES ARTISTA");
            Usuario espect = ICU.obtenerEspectadorPorNick(nick);
            System.out.println("ES ESPECTADOR");
            request.setAttribute("Espectador", espect);
            //IControladorFuncion ICF=fabrica.getIControladorFuncion();
            Map<String, Funcion> funciones = ICE.getRegistroDeFuncionesDeUsuarioPorNick(nick);
            //
            request.setAttribute("Funciones", funciones);
            if (funciones.isEmpty()){
                System.out.println("FUNCIONES VACIAS");
            } else {
                System.out.println("SI HAY FUNCIONES");
            }
            RequestDispatcher view = request.getRequestDispatcher("/Pages/Users/Perfil/Espectador.jsp");
            view.forward(request, response);
        } else {
            Artista art=ICU.obtenerArtistaPorNick(nick);
            System.out.println("IMAGEN GUARDADA: " + art.getImagen());
            request.setAttribute("Artista", art);
            Map<String, Espectaculo> espectaculos = ICE.obtenerEspectaculosAceptadosDeArtistaPorNick(nick);
            request.setAttribute("Espectaculos", espectaculos);
            if (espectaculos.isEmpty()){
                System.out.println("ESPECTACULOS VACIOS");
            }
            RequestDispatcher view = request.getRequestDispatcher("/Pages/Users/Perfil/Artista.jsp");
            view.forward(request, response);
        }
//        RequestDispatcher view = request.getRequestDispatcher("/Pages/Users/Perfil/Espectador.jsp");
//        view.forward(request, response);
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

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
import Logica.Clases.Paquete;
import Logica.Clases.Usuario;

import Logica.Interfaz.IControladorEspectaculo;
import Logica.Interfaz.IControladorFuncion;
import Logica.Interfaz.IControladorPaquete;

import Logica.Interfaz.IControladorUsuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;
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
    IControladorPaquete ICP = fabrica.getIControladorPaquete();
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
        
        if(request.getParameter("esEspectador")!=null){
            String nuevaFecha = request.getParameter("fecha");
            String[] datos = nuevaFecha.split("/");
            Date date=Date.valueOf(datos[2]+ "-" + datos[1] + "-" + datos[0]);
            String nuevaImagen = request.getParameter("urlImagen");
            if(nuevaImagen.equals("")){
                Usuario espect = ICU.obtenerEspectadorPorNick(nick);
                nuevaImagen= espect.getImagen();
            }
            String email = request.getParameter("email");
            String nuevoNombre = request.getParameter("nombre");
            String nuevoApellido = request.getParameter("apellido");
            ICU.modificarUsuarioEspectador(nick, email, nuevoNombre, nuevoApellido, date, nuevaImagen);
            objSesion.setAttribute("imagen", nuevaImagen);
        }
        if(request.getParameter("esArtista")!=null){
            
            String nuevaFecha = request.getParameter("fecha");
            String[] datos = nuevaFecha.split("/");
            Date date=Date.valueOf(datos[2]+ "-" + datos[1] + "-" + datos[0]);
            String nuevaImagen = request.getParameter("urlImagen");
            if(nuevaImagen.equals("")){
                Usuario espect = ICU.obtenerEspectadorPorNick(nick);
                nuevaImagen= espect.getImagen();
            }
            String email = request.getParameter("email");
            String nuevoNombre = request.getParameter("nombre");
            String nuevoApellido = request.getParameter("apellido");
            String nuevaDescripcion = request.getParameter("descripcion");
            String nuevaBiografia = request.getParameter("bio");
            System.out.println("Biografia que llega: " + nuevaBiografia);
            String nuevoUrl=request.getParameter("sitio");
            ICU.modificarUsuarioArtista(nick, email, nuevoNombre, nuevoApellido, date, nuevaImagen, nuevaDescripcion, nuevaBiografia, nuevoUrl);
            objSesion.setAttribute("imagen", nuevaImagen);
            //ICU.modificarUsuarioEspectador(nick, email, nuevoNombre, nuevoApellido, date, nuevaImagen);
        }
        if (ICU.obtenerArtistaPorNick(nick)==null){
            System.out.println("NO ES ARTISTA");
            Usuario espect = ICU.obtenerEspectadorPorNick(nick);
            System.out.println("ES ESPECTADOR");
            request.setAttribute("Espectador", espect);
            //IControladorFuncion ICF=fabrica.getIControladorFuncion();
            Map<String, Funcion> funciones = ICE.getRegistroDeFuncionesDeUsuarioPorNick(nick);
            int idEspectador = ICU.getIdEspectadorPorNick(nick);
            Map<String, Paquete> paquetesRegistrado = ICP.getPaquetesQueComproUsuario(idEspectador);
            request.setAttribute("paquetes", paquetesRegistrado);
            
            request.setAttribute("Funciones", funciones);

            if(objSesion.getAttribute("nickname")==null){
                request.setAttribute("login", false);
                RequestDispatcher view = request.getRequestDispatcher("/Pages/Users/Perfil/Espectador.jsp");
                view.forward(request, response);
            } else {
                if(objSesion.getAttribute("nickname").toString().equals(nick)){
                    RequestDispatcher view = request.getRequestDispatcher("/Pages/Users/Perfil/Espectador-yourself.jsp");
                    view.forward(request, response);
                } else {
//                    if(ICU.loSigo(objSesion.getAttribute("nickname").toString(), nick)){
//                        request.setAttribute("losigo", true);
//                    } else {
//                        request.setAttribute("losigo", false);
//                    }
                    RequestDispatcher view = request.getRequestDispatcher("/Pages/Users/Perfil/Espectador.jsp");
                    //processRequest(request, response);
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
                    System.out.println("AHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH");
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

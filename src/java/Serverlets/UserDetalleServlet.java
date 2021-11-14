/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Serverlets;

import DTOs.UserDTO;
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
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Entity;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.MediaType;

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
//Si se entra tu propio perfil inmediatamente despues de haber actualizado sus datos, entrara a uno de esos 2 if y modificara todos los datos antes de visualizarlo
        if(request.getParameter("esEspectador")!=null){
            Client client = ClientBuilder.newClient();
            WebTarget target = client.target("http://localhost:8080/rest/api/usuarios/updateUser");
            String nuevaFecha = request.getParameter("fecha");
            String[] datos = nuevaFecha.split("/");
            Date date=Date.valueOf(datos[2]+ "-" + datos[1] + "-" + datos[0]);
            System.out.println("Fecha en formato Date:" + date);
            String nuevaImagen = request.getParameter("urlImagen");
            String email = request.getParameter("email");
            String nuevoNombre = request.getParameter("nombre");
            String nuevoApellido = request.getParameter("apellido");
            UserDTO user = new UserDTO(nick, nuevoNombre, nuevoApellido, email, date, nuevaImagen);
            
            UserDTO responseAPI = target.request(MediaType.APPLICATION_JSON).accept(MediaType.APPLICATION_JSON).post(Entity.json(user), UserDTO.class);
            objSesion.setAttribute("imagen", responseAPI.getUrl_imagen());
        }
        if(request.getParameter("esArtista")!=null){
            Client client = ClientBuilder.newClient();
            WebTarget target = client.target("http://localhost:8080/rest/api/usuarios/updateUser");
            String nuevaFecha = request.getParameter("fecha");
            String[] datos = nuevaFecha.split("/");
            Date date=Date.valueOf(datos[2]+ "-" + datos[1] + "-" + datos[0]);
            String nuevaImagen = request.getParameter("urlImagen");

            String email = request.getParameter("email");
            String nuevoNombre = request.getParameter("nombre");
            String nuevoApellido = request.getParameter("apellido");
            String nuevaDescripcion = request.getParameter("descripcion");
            String nuevaBiografia = request.getParameter("bio");
            String nuevoUrl=request.getParameter("sitio");
            UserDTO art = new UserDTO(nick, nuevoNombre, nuevoApellido, email, date, nuevaImagen, nuevaDescripcion, nuevaBiografia, nuevoUrl);
            UserDTO responseAPI = target.request(MediaType.APPLICATION_JSON).accept(MediaType.APPLICATION_JSON).post(Entity.json(art), UserDTO.class);
            objSesion.setAttribute("imagen", responseAPI.getUrl_imagen());
        }
//###########################################################################################################################################################################
        // Aqui se visualiza el usuario con el nick recibido
        Client client = ClientBuilder.newClient();
        WebTarget target = client.target("http://localhost:8080/rest/api/usuarios/loadUser");
        UserDTO user = new UserDTO(nick);
        UserDTO responseAPI = target.request(MediaType.APPLICATION_JSON).accept(MediaType.APPLICATION_JSON).post(Entity.json(user), UserDTO.class);
        
        
        
        if (responseAPI.getTipo().equals("espectador")){
            System.out.println("NO ES ARTISTA");
            Usuario espect = ICU.obtenerEspectadorPorNick(nick);
            System.out.println("ES ESPECTADOR");
            request.setAttribute("Espectador", espect);

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
//        if (ICU.obtenerArtistaPorNick(nick)==null){
//            System.out.println("NO ES ARTISTA");
//            Usuario espect = ICU.obtenerEspectadorPorNick(nick);
//            System.out.println("ES ESPECTADOR");
//            request.setAttribute("Espectador", espect);
//
//            Map<String, Funcion> funciones = ICE.getRegistroDeFuncionesDeUsuarioPorNick(nick);
//            int idEspectador = ICU.getIdEspectadorPorNick(nick);
//            Map<String, Paquete> paquetesRegistrado = ICP.getPaquetesQueComproUsuario(idEspectador);
//            request.setAttribute("paquetes", paquetesRegistrado);
//            
//            request.setAttribute("Funciones", funciones);
//
//            if(objSesion.getAttribute("nickname")==null){
//                request.setAttribute("login", false);
//                RequestDispatcher view = request.getRequestDispatcher("/Pages/Users/Perfil/Espectador.jsp");
//                view.forward(request, response);
//            } else {
//                if(objSesion.getAttribute("nickname").toString().equals(nick)){
//                    RequestDispatcher view = request.getRequestDispatcher("/Pages/Users/Perfil/Espectador-yourself.jsp");
//                    view.forward(request, response);
//                } else {
//                    RequestDispatcher view = request.getRequestDispatcher("/Pages/Users/Perfil/Espectador.jsp");
//                    view.forward(request, response);
//                }
//            }
//        } else {
//            Artista art=ICU.obtenerArtistaPorNick(nick);
//            System.out.println("IMAGEN GUARDADA: " + art.getImagen());
//            request.setAttribute("Artista", art);
//            Map<String, Espectaculo> espectaculosA = ICE.obtenerEspectaculosAceptadosDeArtistaPorNick(nick);
//            Map<String, Espectaculo> espectaculosI = ICE.obtenerEspectaculosIngresadosDeArtistaPorNick(nick);
//            Map<String, Espectaculo> espectaculosR = ICE.obtenerEspectaculosRechazadosDeArtistaPorNick(nick);
//            
//            request.setAttribute("EspectaculosA", espectaculosA);
//            request.setAttribute("EspectaculosI", espectaculosI);
//            request.setAttribute("EspectaculosR", espectaculosR);
//            if (espectaculosA.isEmpty()){
//                System.out.println("ESPECTACULOS VACIOS");
//            }
//            if(objSesion.getAttribute("nickname")==null){
//                request.setAttribute("login", false);
//                RequestDispatcher view = request.getRequestDispatcher("/Pages/Users/Perfil/Artista.jsp");
//                    view.forward(request, response);
//            } else {
//                if(objSesion.getAttribute("nickname").toString().equals(nick)){
//                    System.out.println("AHHH");
//                    System.out.println("SITIO: " + art.getLinkWeb());
//                    RequestDispatcher view = request.getRequestDispatcher("/Pages/Users/Perfil/Artista-yourself.jsp");
//                    view.forward(request, response);
//                } else {
//                    
//                    System.out.println("BBBBBBBBBBBBBBBBBBBBBBBBBBHHHHHHHHHHHHHHHHHHHHHHHHHHHHH");
//                    RequestDispatcher view = request.getRequestDispatcher("/Pages/Users/Perfil/Artista.jsp");
//                    view.forward(request, response);
//                }
//            }
//        }
//###########################################################################################################################################################################        
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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Serverlets;

import Logica.Clases.Artista;
import Logica.Clases.Espectaculo;
import Logica.Clases.Usuario;
import Logica.DataTypes.DTFecha;
import Logica.DataTypes.DTTimeStamp;
import Logica.Fabrica;
import Logica.Interfaz.IControladorEspectaculo;
import Logica.Interfaz.IControladorFuncion;
import Logica.Interfaz.IControladorUsuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
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

/**
 *
 * @author pabli
 */
@WebServlet(name = "AltaFuncion", urlPatterns = {"/AltaFuncion"})
public class AltaFuncion extends HttpServlet {

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
    IControladorFuncion ICF = fabrica.getIControladorFuncion();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession objSesion = request.getSession();
        String user = (String) objSesion.getAttribute("nickname");
        Map<String, Espectaculo> espectaculos = ICE.obtenerEspectaculosAceptadosDeArtistaPorNick(user);
        ArrayList<String> nicknameArtistas = ICU.obtenerArtistasNicks();
        ServletContext context = getServletContext();
        if(nicknameArtistas==null){
            context.log("El arreglo de usuarios está vacío"); 
        }else{
            context.log("El arreglo de usuarios NO está vacío"); 
        }  
        try (PrintWriter out = response.getWriter()) {
            request.setAttribute("espectaculos", espectaculos);
            request.setAttribute("artistas", nicknameArtistas);
            RequestDispatcher view = request.getRequestDispatcher("/Pages/Funciones/altaFuncion.jsp");
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
        HttpSession objSesion = request.getSession();
        String user = (String) objSesion.getAttribute("nickname");
        //OBTENIENDO DATOS DEL JSP
        
        String nombreEspectaculo = request.getParameter("espectaculo");
        String nombre = request.getParameter("inputNombre");
        
        String fecha = request.getParameter("inputFechaFuncion");
        String[] fechaSeparada = fecha.split("-");
        DTFecha fechaFun = new DTFecha(Integer.parseInt(fechaSeparada[2]),Integer.parseInt(fechaSeparada[1]),Integer.parseInt(fechaSeparada[0]));
        
        String horaWeb = (request.getParameter("inputHoraInicio"));
        String[] horaSeparada = horaWeb.split(":");
        DTTimeStamp hora = new DTTimeStamp(new DTFecha(0,0,0),Integer.parseInt(horaSeparada[0]),Integer.parseInt(horaSeparada[1]),0);
        String imagen = request.getParameter("urlImagen");
        String[] artistas = request.getParameterValues("artista");
        
        Map<String, Artista> artistasAgregar = new HashMap<>();
        
        for (String artista : artistas) {
            Artista a = ICU.obtenerArtistaPorNick(artista);
            artistasAgregar.put(a.getNickname(), a);
        }
        ServletContext context = getServletContext();
        for (Map.Entry<String, Artista> entry : artistasAgregar.entrySet()) {
            String key = entry.getKey();
            Artista value = entry.getValue();
            context.log(value.getEmail());
        }
        
        LocalDate date = LocalDate.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String fechaC = date.format(formatter);
        String[] fechaCr = fechaC.split("-");
        DTFecha fechaCreado = new DTFecha(Integer.parseInt(fechaCr[2]),Integer.parseInt(fechaCr[1]),Integer.parseInt(fechaCr[0]));
        
        //addFuncion(String nombreEspec, String nombre, DTFecha fecha_registro, DTTimeStamp hora_inicio, DTFecha fecha_comienzo, Map <String,Artista> artistas) 
        ICF.addFuncionWEB(nombreEspectaculo, nombre, fechaCreado, hora, fechaFun, artistasAgregar, imagen);
        processRequest(request, response);
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

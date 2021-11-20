/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Serverlets;

import DTOs.AltaFuncionDTO;
import DTOs.TransporteListaArtistasDTO;
import DTOs.TransporteListaEspectaculosAceptadosArtistaDTO;
import DTOs.TransporteListaPaquetesHomeDTO;
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
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
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
import javax.ws.rs.core.Response;

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
        
        List<String> arregloEspecAceptados = new ArrayList<>();
        List<String> arregloArtistas = new ArrayList<>();
        
        Client client = ClientBuilder.newClient();
        WebTarget target = client.target("http://localhost:8080/rest/api/funciones/espectaculosAceptados?artista="+user);
        
        try {
            TransporteListaEspectaculosAceptadosArtistaDTO trsEspecs = target.request(MediaType.APPLICATION_JSON).accept(MediaType.APPLICATION_JSON).get(TransporteListaEspectaculosAceptadosArtistaDTO.class);
            arregloEspecAceptados = trsEspecs.getEspectaculos();
            request.setAttribute("espectaculos", arregloEspecAceptados);
        } catch (WebApplicationException e) {

        }
        
        Client client2 = ClientBuilder.newClient();
        WebTarget target2 = client2.target("http://localhost:8080/rest/api/usuarios/artistas");
        try {
            TransporteListaArtistasDTO trsArtistas = target2.request(MediaType.APPLICATION_JSON).accept(MediaType.APPLICATION_JSON).get(TransporteListaArtistasDTO.class);
            arregloArtistas = trsArtistas.getArtistas();
            request.setAttribute("artistas", arregloArtistas);
        } catch (WebApplicationException e) {

        }
        
//        Map<String, Espectaculo> espectaculos = ICE.obtenerEspectaculosAceptadosDeArtistaPorNick(user);
//        ArrayList<String> nicknameArtistas = ICU.obtenerArtistasNicks();
//        ServletContext context = getServletContext();
//        if(nicknameArtistas==null){
//            context.log("El arreglo de usuarios está vacío"); 
//        }else{
//            context.log("El arreglo de usuarios NO está vacío"); 
//        }  
            RequestDispatcher view = request.getRequestDispatcher("/Pages/Funciones/altaFuncion.jsp");
            view.forward(request, response);
//        try (PrintWriter out = response.getWriter()) {
////            request.setAttribute("espectaculos", trsEspecs);
////            request.setAttribute("artistas", trsArtistas);
//            RequestDispatcher view = request.getRequestDispatcher("/Pages/Funciones/altaFuncion.jsp");
//            view.forward(request, response);
//        }
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
        Time horaTime = new Time(Integer.parseInt(horaSeparada[0]), Integer.parseInt(horaSeparada[1]), 0);
        
        String imagen = request.getParameter("urlImagen");
        String[] artistas = request.getParameterValues("artista");
        
        //Map<String, Artista> artistasAgregar = new HashMap<>();
        List<String> artistasList = new ArrayList<>();
        if(artistas != null){
            for (String artista : artistas) {
                artistasList.add(artista);
//                Artista a = ICU.obtenerArtistaPorNick(artista);
//                artistasAgregar.put(a.getNickname(), a);
            }
//            ServletContext context = getServletContext();
//            for (Map.Entry<String, Artista> entry : artistasAgregar.entrySet()) {
//                String key = entry.getKey();
//                Artista value = entry.getValue();
//                context.log(value.getEmail());
//            }
        }
        

        
        LocalDate date = LocalDate.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

        String fechaC = date.format(formatter);
        String[] fechaCr = fechaC.split("-");
        DTFecha fechaCreado = new DTFecha(Integer.parseInt(fechaCr[2]),Integer.parseInt(fechaCr[1]),Integer.parseInt(fechaCr[0]));
        
        String error = "";
        ServletContext context = getServletContext();
        context.log("NO ANDA O SI"+nombreEspectaculo);
        if(nombreEspectaculo.equals("Seleccione un espectaculo")){
            error = "Debe selecciona un espectáculo";
        } 
        if(ICF.checkearFuncionExistenteWeb(nombre)){
            request.setAttribute("error", "El nombre de función ingresado ya existe, por favor ingrese uno distinto");
            request.setAttribute("nombreEspec", nombreEspectaculo);
            request.setAttribute("nombreFun", nombre);
            request.setAttribute("fechaFun", fecha);
            request.setAttribute("horaFun", horaWeb);
            request.setAttribute("imagenFun", imagen);
        }else{
            if(error.equals("")){
                try {
                    AltaFuncionDTO alta = new AltaFuncionDTO(nombre, fecha, horaWeb, fechaC, imagen, nombreEspectaculo, artistasList);
                    
                    Client client = ClientBuilder.newClient();
                    WebTarget target = client.target("http://localhost:8080/rest/api/funciones/alta");
                    
                    try {
                        Response res = target.request(MediaType.APPLICATION_JSON).accept(MediaType.APPLICATION_JSON).post(Entity.json(alta));
                        if(res.getStatus()==200){
                            request.setAttribute("success", "Agregado correctamente!");
                        }
                    } catch (Exception e) {
                        request.setAttribute("error", e);
                    }
                    
                //ICF.addFuncionWEB(nombreEspectaculo, nombre, fechaCreado, hora, fechaFun, artistasAgregar, imagen);
                    //request.setAttribute("success", "Agregado correctamente!");
                } catch (Exception e) {
                    request.setAttribute("error", e);
                }
            }else{
                request.setAttribute("error", error);
                request.setAttribute("nombreEspec", nombreEspectaculo);
                request.setAttribute("nombreFun", nombre);
                request.setAttribute("fechaFun", fecha);
                request.setAttribute("horaFun", horaWeb);
                request.setAttribute("imagenFun", imagen);
            }
        }
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

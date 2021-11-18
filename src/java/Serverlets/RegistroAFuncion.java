/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Serverlets;

import DTOs.CanjearFuncionesDTO;
import DTOs.RegistroFuncionDTO;
import DTOs.TransportadorListaRegistrosPreviosDTO;
import DTOs.TransporteListaPaquetesRegistroDTO;
import Logica.Clases.Paquete;
import Logica.Clases.Registro;
import Logica.Fabrica;
import Logica.Interfaz.IControladorEspectaculo;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "RegistroAFuncion", urlPatterns = {"/RegistroAFuncion"})
public class RegistroAFuncion extends HttpServlet {
    Fabrica fabrica = Fabrica.getInstance();
    IControladorEspectaculo ICE = fabrica.getIControladorEspectaculo();
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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
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
        response.setContentType("text/html;charset=UTF-8");
        
        HttpSession objSesion = request.getSession();
        String user = (String) objSesion.getAttribute("nickname");
        String nombreFuncion = (String) request.getParameter("nombreFuncionDesdeFuncion");
        
        String nuevoUserConREGEX = user.replaceAll(" ", "%20");
        Client client = ClientBuilder.newClient();
        WebTarget target = client.target("http://localhost:8080/rest/api/registros/registrosPrevios?user="+nuevoUserConREGEX);
        try {
            TransportadorListaRegistrosPreviosDTO responseAPI = target.request(MediaType.APPLICATION_JSON).get(TransportadorListaRegistrosPreviosDTO.class);
            request.setAttribute("registrosFunciones", responseAPI);
            request.setAttribute("nombreFuncionHaciaRegistro", nombreFuncion);
            RequestDispatcher view = request.getRequestDispatcher("/Pages/Funciones/registroAFuncion.jsp");
            view.forward(request, response);
        }catch(WebApplicationException e){
            if(e.getResponse().getStatus()==204){
                //request.setAttribute("error", "No hay 3 registros previos");
                String nuevaFuncionConREGEX = nombreFuncion.replaceAll(" ", "%20");
                Client client2 = ClientBuilder.newClient();
                WebTarget target2 = client2.target("http://localhost:8080/rest/api/registros/paquetesSinCanjear?user="+nuevoUserConREGEX+"&funcion="+nuevaFuncionConREGEX);
                
                try {
                    TransporteListaPaquetesRegistroDTO responseAPI2 = target2.request(MediaType.APPLICATION_JSON).get(TransporteListaPaquetesRegistroDTO.class);
                    
                    request.setAttribute("paquetes", responseAPI2);
                    RequestDispatcher view = request.getRequestDispatcher("/Pages/Funciones/registroAFuncionPaquetes.jsp");
                    view.forward(request, response);
                
                }catch (WebApplicationException e2) {
                    if(e.getResponse().getStatus()==204){
                        Client client3 = ClientBuilder.newClient();
                        WebTarget target3 = client3.target("http://localhost:8080/rest/api/registros/registro");
                        
                        
                        try {
                            RegistroFuncionDTO registro = new RegistroFuncionDTO(user,nombreFuncion);
                            Response responseAPI3 = target3.request(MediaType.APPLICATION_JSON).post(Entity.json(registro));
                            
                            if(responseAPI3.getStatus() == 200){
                                RequestDispatcher view = request.getRequestDispatcher("/funciones");
                                view.forward(request, response);
                            }
                        } catch (WebApplicationException e3) {
                            request.setAttribute("error", "Error al registrarte a la funcions: "+nombreFuncion);
                            RequestDispatcher view = request.getRequestDispatcher("/funciones");
                            view.forward(request, response);
                        }
                        

                    }
                }
            }
        }
//        Map<String,Registro> registrosPrevios = ICE.obtenerRegistrosPreviosDeEspectador(user);
//        if(registrosPrevios.size()>=3){
//            request.setAttribute("registrosFunciones", registrosPrevios);
//            ServletContext context = getServletContext();
//            context.log("primero: "+nombreFuncion);
//            request.setAttribute("nombreFuncionHaciaRegistro", nombreFuncion);
//            RequestDispatcher view = request.getRequestDispatcher("/Pages/Funciones/registroAFuncion.jsp");
//            view.forward(request, response);
//        }else if(!ICE.obtenerPaquetesSinCanjear(user, nombreFuncion).isEmpty()){
//            Map<String, Paquete> paquetes = ICE.obtenerPaquetesSinCanjear(user, nombreFuncion);
//            request.setAttribute("paquetes", paquetes);
//            RequestDispatcher view = request.getRequestDispatcher("/Pages/Funciones/registroAFuncionPaquetes.jsp");
//            view.forward(request, response);
//        }else{
//            ServletContext context = getServletContext();
//            context.log("primero: "+nombreFuncion);
//            ICE.registroFuncionWEB(nombreFuncion, user);
//            RequestDispatcher view = request.getRequestDispatcher("/funciones");
//            view.forward(request, response);
//        }
        
        
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
                String nombreFuncionAAgregar = (String) request.getParameter("nombreFuncionNueva");
                ServletContext context = getServletContext();
                context.log(nombreFuncionAAgregar);
                String nombreFuncion1 = (String) request.getParameter("funcion1");
                String nombreFuncion2 = (String) request.getParameter("funcion2");
                String nombreFuncion3 = (String) request.getParameter("funcion3");
                RequestDispatcher view;
                if(request.getParameter("funcion1").equals("") || request.getParameter("funcion2").equals("") || request.getParameter("funcion3").equals("")){
                    String error = "Debes seleccionar al menos 3 funciones para canjear.";
                    request.setAttribute("error", error);
                    request.setAttribute("nombreFuncionHaciaRegistro", nombreFuncionAAgregar);
                    
                    String nuevoUserConREGEX = user.replaceAll(" ", "%20");
                    Client client = ClientBuilder.newClient();
                    WebTarget target = client.target("http://localhost:8080/rest/api/registros/registrosPrevios?user="+nuevoUserConREGEX);

                    TransportadorListaRegistrosPreviosDTO responseAPI = target.request(MediaType.APPLICATION_JSON).get(TransportadorListaRegistrosPreviosDTO.class);
                    request.setAttribute("registrosFunciones", responseAPI);
                    view = request.getRequestDispatcher("/Pages/Funciones/registroAFuncion.jsp");

                }else{
                    CanjearFuncionesDTO canje = new CanjearFuncionesDTO(user, nombreFuncionAAgregar, nombreFuncion1, nombreFuncion2, nombreFuncion3);
                    
                    Client client2 = ClientBuilder.newClient();
                    WebTarget target2 = client2.target("http://localhost:8080/rest/api/registros/canjearFunciones");
                    
                    try {
                        Response responseAPI2 = target2.request(MediaType.APPLICATION_JSON).post(Entity.json(canje));
                        if(responseAPI2.getStatus()==200){
                            view = request.getRequestDispatcher("/funciones");
                        }else{
                            request.setAttribute("error", "No se pudo realizar el canje");
                            view = request.getRequestDispatcher("/funciones");
                        }
                    }catch (WebApplicationException e2) {
                        request.setAttribute("error", "No se pudo realizar el canje");
                        view = request.getRequestDispatcher("/funciones");
                    }
                }
                view.forward(request, response);
                
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

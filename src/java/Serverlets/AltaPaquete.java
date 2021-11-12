/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Serverlets;

import DTOs.AltaPaqueteDTO;
import Logica.Fabrica;
import Logica.Interfaz.IControladorPaquete;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
@WebServlet(name = "AltaPaquete", urlPatterns = {"/AltaPaquete"})
public class AltaPaquete extends HttpServlet {

    Fabrica fabrica = Fabrica.getInstance();
    IControladorPaquete ICP = fabrica.getIControladorPaquete();

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
            RequestDispatcher view = request.getRequestDispatcher("/Pages/Paquetes/altaPaquete.jsp");
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
        //processRequest(request, response);
        String nombre = request.getParameter("inputNombre");
        String descripcion = request.getParameter("inputDescripcion");
        String fechaInicio = request.getParameter("inputFechaInicio");
        String fechaFin = request.getParameter("inputFechaFin");

        LocalDate date = LocalDate.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String fechaCreado = date.format(formatter);

        double descuento = Double.parseDouble(request.getParameter("inputDescuento"));
        String urlImagen = request.getParameter("urlImagen");

        //(String nombre,String fechaInicio, String fechaFin,String fechaCreado,int descuento,String descripcion)
        String error = "";
        int contador_errores = 0;
//        if (ICP.isNombrePaqueteUsado(nombre) == true) {
//            error += "El nombre del paquete ya existe.";
//            contador_errores++;
//        }
//        ICP.altaPaquete(nombre, fechaInicio, fechaFin, fechaCreado, descuento, descripcion, urlImagen);
//        request.setAttribute("success", "Agregado correctamente!");
        if (error.equals("")) {

            AltaPaqueteDTO paquete = new AltaPaqueteDTO(nombre, fechaInicio, fechaFin, fechaCreado, descuento, descripcion, urlImagen);
            Client client = ClientBuilder.newClient();
            WebTarget target = client.target("http://localhost:8080/rest/api/paquetes/alta");
            try {
                Response respuesta = target.request().accept(MediaType.APPLICATION_JSON).post(Entity.json(paquete));
                if (respuesta.getStatus() == 200){
                    request.setAttribute("success", "Agregado correctamente!");
                    RequestDispatcher view = request.getRequestDispatcher("/Pages/Paquetes/altaPaquete.jsp");
                    view.forward(request, response);
                }else{
                    request.setAttribute("error", "Verifique sus datos, Puede que el nombre del paquete ingresado ya exista.");
                    request.setAttribute("rNombre", request.getParameter("inputNombre"));
                    request.setAttribute("rDescripcion", request.getParameter("inputDescripcion"));
                    request.setAttribute("rFechaInicio", request.getParameter("inputFechaInicio"));
                    request.setAttribute("rFechaFin", request.getParameter("inputFechaFin"));
                    request.setAttribute("rDescuento", request.getParameter("inputDescuento"));
                    RequestDispatcher view = request.getRequestDispatcher("/Pages/Paquetes/altaPaquete.jsp");
                    view.forward(request, response);
                }
                    //ICE.altaEspectaculo(plataforma, user, nombre, descripcion, duracion, especMin, especMax, url, costo, "i", urlImagen, categorias);
            } catch (WebApplicationException e) {
                request.setAttribute("error", "Verifique sus datos, Puede que el nombre del paquete ingresado ya exista.");
                request.setAttribute("rNombre", request.getParameter("inputNombre"));
                request.setAttribute("rDescripcion", request.getParameter("inputDescripcion"));
                request.setAttribute("rFechaInicio", request.getParameter("inputFechaInicio"));
                request.setAttribute("rFechaFin", request.getParameter("inputFechaFin"));
                request.setAttribute("rDescuento", request.getParameter("inputDescuento"));
                RequestDispatcher view = request.getRequestDispatcher("/Pages/Paquetes/altaPaquete.jsp");
                view.forward(request, response);
            }
               
                
                

        } else {
            request.setAttribute("error", error);
            request.setAttribute("rNombre", request.getParameter("inputNombre"));
            request.setAttribute("rDescripcion", request.getParameter("inputDescripcion"));
            request.setAttribute("rFechaInicio", request.getParameter("inputFechaInicio"));
            request.setAttribute("rFechaFin", request.getParameter("inputFechaFin"));
            request.setAttribute("rDescuento", request.getParameter("inputDescuento"));
            RequestDispatcher view = request.getRequestDispatcher("/Pages/Paquetes/altaPaquete.jsp");
            view.forward(request, response);
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

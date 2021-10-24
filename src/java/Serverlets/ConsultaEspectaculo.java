/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Serverlets;

import Logica.Clases.Categoria;
import Logica.Clases.Espectaculo;
import Logica.Clases.Funcion;
import Logica.Clases.Paquete;
import Logica.Fabrica;
import Logica.Interfaz.IControladorEspectaculo;
import Logica.Interfaz.IControladorPaquete;
import Logica.Interfaz.IControladorUsuario;
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

/**
 *
 * @author Admin
 */
@WebServlet(name = "ConsultaEspectaculo", urlPatterns = {"/Espectaculo"})
public class ConsultaEspectaculo extends HttpServlet {

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
    IControladorEspectaculo ICE = fabrica.getIControladorEspectaculo();
    IControladorUsuario ICU = fabrica.getIControladorUsuario();
    IControladorPaquete ICP = fabrica.getIControladorPaquete();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ConsultaEspectaculo</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ConsultaEspectaculo at " + request.getContextPath() + "</h1>");
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
        String espec = request.getParameter("ver_mas");
        ServletContext context = getServletContext();
        context.log(espec);
        String[] datos = espec.split(",");
        context.log(datos[0]);
        Map<String, Espectaculo> escp = (Map<String, Espectaculo>) ICE.getEspectaculos();
        Espectaculo espcSeleccionado = escp.get(datos[0]);
        Map<String, Categoria> categoriasMap = (Map<String, Categoria>) espcSeleccionado.getCategorias();

        String artista = ICU.obtenerArtista(ICU.getIdUsuarioUsingIdArtista(Integer.parseInt(datos[1]))).getNickname();

        Map<String, Funcion> funcionesDeEspec = ICE.obtenerMapFunciones(datos[0]);
        Map<String, Paquete> paquetes = (Map<String, Paquete>) ICP.getPaqueteDeEspectaculo(datos[0]);
        request.setAttribute("funcionesDeEspec", funcionesDeEspec);
        request.setAttribute("paquetes", paquetes);

        String nombre = datos[0];
        request.setAttribute("nombre", nombre);
        //String artista = datos[1];
        request.setAttribute("artista", artista);
        String descripcion = datos[2];
        request.setAttribute("descripcion", descripcion);
        String especmax = datos[3];
        request.setAttribute("especmax", especmax);
        String especmin = datos[4];
        request.setAttribute("especmin", especmin);
        String url = datos[5];
        request.setAttribute("url", url);
        String costo = datos[6];
        request.setAttribute("costo", costo);
        String duracion = datos[7];
        request.setAttribute("duracion", duracion);
        String fecha = datos[8];
        request.setAttribute("fecha", fecha);
        String urlImagen = datos[9];
        request.setAttribute("urlImagen", urlImagen);
        request.setAttribute("categorias", categoriasMap);
        RequestDispatcher view = request.getRequestDispatcher("/Pages/Espectaculos/consultaEspectaculo.jsp");
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

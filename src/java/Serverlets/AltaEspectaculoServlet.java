/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Serverlets;

import Logica.Clases.Categoria;
import Logica.Clases.Plataforma;
import Logica.Fabrica;
import Logica.Interfaz.IControladorEspectaculo;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Davila
 */
public class AltaEspectaculoServlet extends HttpServlet {
    
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
        response.setContentType("text/html;charset=UTF-8");
        
        // map de las plataformas:
        Map<String, Plataforma> plataformas = ICE.getPlataformas();
        // map de las categorias:
        Map<String, Categoria> categorias = ICE.getCategorias();
        
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            //request.setAttribute("", plataformas);
          RequestDispatcher view = request.getRequestDispatcher("/Pages/Espectaculos/altaEspectaculo.jsp");
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
        
        // va a tener que mostrar antes las plataformas y asi la seleccionada se guarda aqui
        String plataforma = request.getParameter("inputPlataforma");
        String nombreEspectaculo = request.getParameter("inputNombre");
        String descripcion = request.getParameter("inputDescripcion");
        Double duracion = new Double(request.getParameter("inputDuracion"));
        Integer espectadoresMinimos = new Integer (request.getParameter("inputEspectadoresMinimos"));
        Integer espectadoresMaximos = new Integer (request.getParameter("inputEspectadoresMaximos"));
        String url = request.getParameter("inputURL"); // comprobar la url
        Double costo = new Double (request.getParameter("inputCosto"));
        // va a tener que mostrar antes las categorias y asi las seleccionadas se guardan aqui
        String [] categorias = request.getParameterValues("inputCategoria"); // recibe un array
        String imagenEspectaculo = request.getParameter("inputImagenEspectaculo");
        
        
        // verificar si se selecciono una plataforma
        if (plataforma != null){
            
        }else{
            request.setAttribute("errorPlataforma", "Debe seleccionar una Plataforma");
            RequestDispatcher view = request.getRequestDispatcher("/Pages/Espectaculos/altaEspectaculo.jsp");
            view.forward(request, response);
        }
        // verificar si el nombre del espectaculo, que no sea repetido o que el campo no este vacio
        // verificar duracion que no este vacio y no sea un numero negativo
        // verificar espectadores minimos que no este vacio y no sea un numero negativo
        // verificar espectadores maximos que no este vacio y no sea un numero menor a espectadores minimos
        // verificar URL que no este vacio y sea una URL valida
        // verificar el costo no este vacio y no sea un numero negativo
        // verificar que categoria no este vacio 
        // verificar imagen si esta vacio definir una imagen padron para los que no pongan imagen
        
        String nombreArtista = "algo"; // debo obtener nickname del usuario que es un artista que esta creando este espectaculo 
        ICE.altaEspectaculo(plataforma, nombreArtista, nombreEspectaculo, descripcion, duracion, espectadoresMinimos, espectadoresMaximos, url, costo, "Ingresado", imagenEspectaculo);
       
        // categorias me puede devolver varias asi que hay que agregar de a una en addCategorias_Espectaculos
        for (int i = 0; i < categorias.length; i++){
            if(categorias[i] != null){
            //System.out.println(categorias[i]);
            ICE.addCategorias_Espectaculos(nombreEspectaculo, categorias[i]);
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

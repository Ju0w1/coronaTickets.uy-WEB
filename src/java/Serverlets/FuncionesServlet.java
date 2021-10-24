/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Serverlets;

import Logica.Clases.Categoria;
import Logica.Clases.Espectaculo;
import Logica.Clases.Funcion;
import Logica.Clases.Plataforma;
import Logica.Clases.Usuario;
import Logica.Fabrica;
import Logica.Interfaz.IControladorEspectaculo;
import Logica.Interfaz.IControladorFuncion;
import Logica.Interfaz.IControladorUsuario;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author milto
 */
@WebServlet(name = "FuncionesServlet", urlPatterns = {"/funciones"})
public class FuncionesServlet extends HttpServlet {

    Fabrica fabrica = Fabrica.getInstance();
    IControladorUsuario ICU = fabrica.getIControladorUsuario();
    IControladorEspectaculo ICE = fabrica.getIControladorEspectaculo();
    IControladorFuncion ICF = fabrica.getIControladorFuncion();
    
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
        
        //Map<String, Usuario> usuarios = (Map<String, Usuario>) ICU.obtenerUsuarios();
        Map<String, Plataforma> plataformas = (Map<String, Plataforma>) ICE.getPlataformas();
        Map<String, Categoria> categorias = (Map<String, Categoria>) ICE.getCategorias();
        Map<String, Espectaculo> espectaculos = (Map<String, Espectaculo>) ICE.getEspectaculos();
        Map<String, Funcion> funciones = new HashMap<>(); //(Map<String, Funcion>) ICF.getFunciones();
        
        
        
        request.setAttribute("funciones", funciones);
        request.setAttribute("espectaculos", espectaculos);
        request.setAttribute("categorias", categorias);
        request.setAttribute("plataformas", plataformas);
        
        //String categoriaSelect=request.getParameter("categoriaSelect");
        //request.setAttribute("categoriaSelect", categoriaSelect);
        
        RequestDispatcher view = request.getRequestDispatcher("/Pages/Funciones/Funciones-list.jsp");
        view.forward(request, response);
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

        //String nombre = request.getParameter("nombre");
        
        
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
            Map<String, Espectaculo> espectaculos = (Map<String, Espectaculo>) ICE.getEspectaculos();
            String categoria=request.getParameter("cat");
            String Espect = request.getParameter("data");
            String plataforma = request.getParameter("pla");
            Map<String, Espectaculo> EspectAux = new HashMap<>();
            
            if(!(request.getParameter("data")==null)){
                Map<String, Funcion> funcionesDeEspec = ICE.obtenerMapFunciones(Espect);
                request.setAttribute("funcionesDeEspec", funcionesDeEspec);    
            }
            if(!(request.getParameter("pla")==null)){
                System.out.println("Plataforma Seleccionada: " + plataforma);
                for (Map.Entry<String, Espectaculo> entry : espectaculos.entrySet()) {
                    String key = entry.getKey();
                    Espectaculo value = entry.getValue();
                    if(value.getPlataforma().equals(plataforma)){
                        EspectAux.put(entry.getKey(),entry.getValue());
                    }
                }
            }
            if(!(request.getParameter("cat")==null)){
                System.out.println("Categoria Seleccionada: " + categoria);
                Map<String, Categoria> categoriasAux;
                for (Map.Entry<String, Espectaculo> entry : espectaculos.entrySet()) {
                    String key = entry.getKey();
                    Espectaculo value = entry.getValue();  
                    categoriasAux = value.getCategorias();
                    for (Map.Entry<String, Categoria> entry2 : categoriasAux.entrySet()){
                        String key2 = entry2.getKey(); 
                        if(key2.equals(categoria)){
                            EspectAux.put(entry.getKey(),entry.getValue());
                            break;
                        }
                    }
                }
            }
            request.setAttribute("espectaculosFiltrados", EspectAux);
            request.setAttribute("categoriaSelect", categoria);
            RequestDispatcher view = request.getRequestDispatcher("/Pages/Funciones/Funciones-list.jsp");
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

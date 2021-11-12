/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Serverlets;

import DTOs.AltaEspectaculoDTO;
import Logica.Clases.Categoria;
import Logica.Clases.Paquete;
import Logica.Clases.Plataforma;
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
@WebServlet(name = "AltaEspectaculo", urlPatterns = {"/AltaEspectaculo"})
public class AltaEspectaculo extends HttpServlet {

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
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        Map<String, Plataforma> plataformas = (Map<String, Plataforma>) ICE.getPlataformas();
        Map<String, Categoria> categorias = (Map<String, Categoria>) ICE.getCategorias();
        try (PrintWriter out = response.getWriter()) {
            request.setAttribute("plataformas", plataformas);
            request.setAttribute("categorias", categorias);
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
        HttpSession objSesion = request.getSession();
        ServletContext context = getServletContext();
        String user = (String) objSesion.getAttribute("nickname");
        //OBTENIENDO DATOS DEL JSP
        String nombre = request.getParameter("inputNombre");
        String descripcion = request.getParameter("inputDescripcion");
        String plataforma = request.getParameter("plataforma");
        
        String error = "";
        int contador_errores = 0;
        if(plataforma.equals("Plataforma *")){
            error += "Ingrese una plataforma correcta";
            contador_errores++;
        }if(nombre.equals("")){
            if(contador_errores > 0){
                error += ", El campo Nombre está vacío";
            }else{
                error += "El campo Nombre está vacío";
            }
            contador_errores++;
        }if(descripcion.equals("")){
            if(contador_errores > 0){
                error += ", El campo Descripción está vacío";
            }else{
                error += "El campo Descripción está vacío";
            }
            contador_errores++;
        }
        double duracion;
        if(request.getParameter("inputDuracion").equals("")){
            duracion = 0;
            if(duracion == 0){
                if(contador_errores > 0){
                    error += ", El campo Duración está vacío";
                }else{
                    error += "El campo Duración está vacío";
                }
                contador_errores++;
            }
        }else{
            duracion = Double.parseDouble(request.getParameter("inputDuracion"));
        }
        
        String[] categorias = null;
        
        if(request.getParameterValues("categoria") == null){
            if(contador_errores > 0){
                error += ", Debe seleccionar al menos una categoría";
            }else{
                error += "Debe seleccionar al menos una categoría";
            }
            contador_errores++;
        }else{
            categorias = request.getParameterValues("categoria");
        }
        
        
        //context.log(categorias[0]);
        //context.log(categorias[1]);
        
        int especMin = 0;
        int especMax = 0;
        String url = request.getParameter("inputURL");
        String urlImagen = request.getParameter("urlImagen");
        
        if(request.getParameter("inputEspecMin").equals("")){
            if(contador_errores > 0){
                error += ", El campo Espectadores Mínimos está vacío";
            }else{
                error += "El campo Espectadores Mínimos está vacío";
            }
            contador_errores++;
        }else{
            especMin = Integer.parseInt(request.getParameter("inputEspecMin"));
        }
        
        if(request.getParameter("inputEspecMax").equals("")){
            if(contador_errores > 0){
                error += ", El campo Espectadores Máximos está vacío";
            }else{
                error += "El campo Espectadores Máximos está vacío";
            }
            contador_errores++;
        }else{
            especMax = Integer.parseInt(request.getParameter("inputEspecMax"));
        }
        
        if(especMin >= especMax && especMin != 0 && especMax !=0){
            if(contador_errores > 0){
                error += ", El campo Espectadores Mínimos debe ser menor a el campo Espectadores Máximos";
            }else{
                error += "El campo Espectadores Mínimos debe ser menor a el campo Espectadores Máximos";
            }
            contador_errores++;
        }
        double costo;
        if(request.getParameter("inputCosto").equals("")){
            costo = 0;
            if(costo == 0){
                if(contador_errores > 0){
                    error += ", El campo Costo está vacío";
                }else{
                    error += "El campo Costo está vacío";
                }
                contador_errores++;
            }
        }else{
            costo = Double.parseDouble(request.getParameter("inputCosto"));
        }
        
        if(error.equals("")){
            AltaEspectaculoDTO espectaculo = new AltaEspectaculoDTO(plataforma, user, nombre, descripcion, duracion, especMin, especMax, url, costo, "i", urlImagen, categorias);
            Client client = ClientBuilder.newClient();
            WebTarget target = client.target("http://localhost:8080/rest/api/espectaculos/alta");
            try {
                Response respuesta = target.request().accept(MediaType.APPLICATION_JSON).post(Entity.json(espectaculo));
                if (respuesta.getStatus() == 200){
                    request.setAttribute("success", "Agregado correctamente!");
                }else{
                    request.setAttribute("error", "Verifique sus datos, Puede que el nombre del espectáculo ingresado ya exista.");
                    request.setAttribute("nombreEspec", request.getParameter("inputNombre"));
                    request.setAttribute("descripcion", request.getParameter("inputDescripcion"));
                    request.setAttribute("duracion", request.getParameter("inputDuracion"));
                    request.setAttribute("espectadoresMinimos", request.getParameter("inputEspecMin"));
                    request.setAttribute("espectadoresMaximos", request.getParameter("inputEspecMax"));
                    request.setAttribute("url", request.getParameter("inputURL"));
                    request.setAttribute("urlImagen", urlImagen);
                    request.setAttribute("costo", request.getParameter("inputCosto"));
                }
                //ICE.altaEspectaculo(plataforma, user, nombre, descripcion, duracion, especMin, especMax, url, costo, "i", urlImagen, categorias);
            } catch (WebApplicationException e) {
                if(e.getResponse().getStatus()==401){
                    request.setAttribute("error", "Verifique sus datos, Puede que el nombre del espectáculo ingresado ya exista.");
                    request.setAttribute("nombreEspec", request.getParameter("inputNombre"));
                    request.setAttribute("descripcion", request.getParameter("inputDescripcion"));
                    request.setAttribute("duracion", request.getParameter("inputDuracion"));
                    request.setAttribute("espectadoresMinimos", request.getParameter("inputEspecMin"));
                    request.setAttribute("espectadoresMaximos", request.getParameter("inputEspecMax"));
                    request.setAttribute("url", request.getParameter("inputURL"));
                    request.setAttribute("urlImagen", urlImagen);
                    request.setAttribute("costo", request.getParameter("inputCosto"));
                }
            }
        }else{
            request.setAttribute("error", error);
            request.setAttribute("nombreEspec", request.getParameter("inputNombre"));
            request.setAttribute("descripcion", request.getParameter("inputDescripcion"));
            request.setAttribute("duracion", request.getParameter("inputDuracion"));
            request.setAttribute("espectadoresMinimos", request.getParameter("inputEspecMin"));
            request.setAttribute("espectadoresMaximos", request.getParameter("inputEspecMax"));
            request.setAttribute("url", request.getParameter("inputURL"));
            request.setAttribute("urlImagen", urlImagen);
            request.setAttribute("costo", request.getParameter("inputCosto"));
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

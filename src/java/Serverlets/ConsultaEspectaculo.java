/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Serverlets;

import DTOs.ConsultaEspectaculoDTO;
import DTOs.EspecFinalizadoDTO;
import DTOs.LoginDTO;
import DTOs.TransporteListaEspecFinalizadosDTO;
import DTOs.TransporteListaNombresEspectaculosAceptadosDTO;
import DTOs.getFavoritosDTO;
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
import javax.servlet.http.HttpSession;
import javax.ws.rs.WebApplicationException;
import javax.ws.rs.client.AsyncInvoker;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Entity;
import javax.ws.rs.client.Invocation;
import javax.ws.rs.client.InvocationCallback;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.Response.Status;

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
            processRequest(request, response);
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
        response.setContentType("text/html;charset=UTF-8");

        String espec = request.getParameter("nombreEspectaculo");
        ServletContext context = getServletContext();
        
        context.log("Nombre del espec: "+espec);

        
        espec = espec.replaceAll("Ã¡", "\u00E1");
        espec = espec.replaceAll("Ã©", "\u00E9");
        espec = espec.replaceAll("Ã-", "\u00ED");
        espec = espec.replaceAll("Ã³", "\u00F3");
        espec = espec.replaceAll("Ãº", "\u00FA");
        espec = espec.replaceAll("Ã±", "\u00F1");
         context.log("Nombre del espec: "+espec);
        espec = espec.replaceAll("Ã±", "\u00F1");
         context.log("Nombre del espec: "+espec);
        
        HttpSession objSesion = request.getSession();
        String user = (String) objSesion.getAttribute("nickname");
        Client client2 = ClientBuilder.newClient();
        WebTarget target2 = client2.target("http://localhost:8080/rest/api/espectaculos/espectaculosDeArtista?artista="+user);
        boolean especFin = false;
        try {
            TransporteListaNombresEspectaculosAceptadosDTO responseAPI = target2.request(MediaType.APPLICATION_JSON).get(TransporteListaNombresEspectaculosAceptadosDTO.class);
            for (String especF : responseAPI.getEspectaculos()) {
                if(especF.equals(espec)){
                    especFin = true;
                }
            }
            request.setAttribute("especFinalizado", especFin);
        } catch (Exception e) {
            System.out.println(e);
        }
        
        
        String nuevaFuncionConREGEX = espec.replaceAll(" ", "%20");
        //ConsultaEspectaculoDTO consultaespec = new ConsultaEspectaculoDTO(espcSeleccionado.getNombre(), espcSeleccionado.getArtista(), espcSeleccionado.getDescripcion(), espcSeleccionado.getMin(), espcSeleccionado.getMax(), espcSeleccionado.getUrl(), espcSeleccionado.getCosto(), espcSeleccionado.getDuracion(), espcSeleccionado.getFecha(), espcSeleccionado.getCategorias(), espcSeleccionado.getUrlIamgen(), espcSeleccionado.getPlataforma(), espcSeleccionado.getEstado(), funcionesDeEspec, paquetes);
        Client client = ClientBuilder.newClient();
        WebTarget target = client.target("http://localhost:8080/rest/api/espectaculos?nombre="+nuevaFuncionConREGEX);
        //ConsultaEspectaculoDTO responseAPI = target.request(MediaType.APPLICATION_JSON).accept(MediaType.APPLICATION_JSON).post(Entity.json(login), ConsultaEspectaculoDTO.class);
//        String data = target.request(MediaType.APPLICATION_JSON).accept(MediaType.APPLICATION_JSON).get(String.class);
        Client clientNew = ClientBuilder.newClient();
        WebTarget targetNew = clientNew.target("http://localhost:8080/rest/api/espectaculos/getFavoritos?nombre="+nuevaFuncionConREGEX);
        try {
            ConsultaEspectaculoDTO responseAPI = target.request(MediaType.APPLICATION_JSON).get(ConsultaEspectaculoDTO.class);
            getFavoritosDTO favoritos = targetNew.request(MediaType.APPLICATION_JSON).get(getFavoritosDTO.class);
//              ConsultaEspectaculoDTO especDTO = new Gson().fromJson(data, ConsultaEspectaculoDTO.class);
//              context.log(datos[0]);
//            JsonObject convertedObject = new Gson().fromJson(data, JsonObject.class);
//            context.log(convertedObject.get("Nombre").getAsString());  
            request.setAttribute("cantidadFavoritos", favoritos.getCantidadFavoritos());
            request.setAttribute("funcionesDeEspec", responseAPI.getFunciones());
            request.setAttribute("paquetes", responseAPI.getPaquetes());
            request.setAttribute("nombre", responseAPI.getNombre());
            request.setAttribute("artista", responseAPI.getArtista());
            request.setAttribute("descripcion", responseAPI.getDescripcion());
            request.setAttribute("especmax", responseAPI.getCant_max_espectadores());
            request.setAttribute("especmin", responseAPI.getCant_min_espectadores());
            request.setAttribute("url", responseAPI.getUrl());
            request.setAttribute("costo", responseAPI.getCosto());
            request.setAttribute("duracion", responseAPI.getDuracion());
            request.setAttribute("fecha", responseAPI.getFecha_Registro());
            if(responseAPI.getUrl_imagen() == null){
                request.setAttribute("urlImagen","");
            }else{
                request.setAttribute("urlImagen",responseAPI.getUrl_imagen());
            }
            request.setAttribute("categorias", responseAPI.getCategorias());
            RequestDispatcher view = request.getRequestDispatcher("/Pages/Espectaculos/consultaEspectaculo.jsp");
            view.forward(request, response);
        } catch (WebApplicationException e) {
            if (e.getResponse().getStatus() == 401) {
                request.setAttribute("error", "La contraseña y/o el Nickname ingresado no son válidos.");
                RequestDispatcher view = request.getRequestDispatcher("/Pages/Login/login.jsp");
                view.forward(request, response);
            }
        }

//        request.setAttribute("funcionesDeEspec", funcionesDeEspec);
//        request.setAttribute("paquetes", paquetes);
//
//        String nombre = datos[0];
//        request.setAttribute("nombre", nombre);
//        //String artista = datos[1];
//        request.setAttribute("artista", artista);
//        String descripcion = datos[2];
//        request.setAttribute("descripcion", descripcion);
//        String especmax = datos[3];
//        request.setAttribute("especmax", especmax);
//        String especmin = datos[4];
//        request.setAttribute("especmin", especmin);
//        String url = datos[5];
//        request.setAttribute("url", url);
//        String costo = datos[6];
//        request.setAttribute("costo", costo);
//        String duracion = datos[7];
//        request.setAttribute("duracion", duracion);
//        String fecha = datos[8];
//        request.setAttribute("fecha", fecha);
//        String urlImagen = datos[9];
//        request.setAttribute("urlImagen", urlImagen);
//        request.setAttribute("categorias", categoriasMap);
//        RequestDispatcher view = request.getRequestDispatcher("/Pages/Espectaculos/consultaEspectaculo.jsp");
//        view.forward(request, response);
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
package org.apache.jsp.Pages;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import Logica.Interfaz.IControladorPaquete;
import Logica.Fabrica;
import java.util.HashMap;
import Logica.Clases.Paquete;
import java.util.Map;

public final class Home_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(2);
    _jspx_dependants.add("/Pages/Common/Header2.jsp");
    _jspx_dependants.add("/Pages/Common/Header.jsp");
  }

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("    <!DOCTYPE html>\r\n");
      out.write("\r\n");
      out.write("    <html>\r\n");
      out.write("    <head>\r\n");
      out.write("\r\n");
      out.write("        <meta charset=\"UTF-8\">\r\n");
      out.write("        <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n");
      out.write("        <title>Document</title>\r\n");
      out.write("        <!-- CSS only -->\r\n");
      out.write("        <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css\" rel=\"stylesheet\" integrity=\"sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We\" crossorigin=\"anonymous\">\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css\">\r\n");
      out.write("\r\n");
      out.write("        <link rel=\"preconnect\" href=\"https://fonts.googleapis.com\">\r\n");
      out.write("        <link rel=\"preconnect\" href=\"https://fonts.gstatic.com\" crossorigin>\r\n");
      out.write("        <link href=\"https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700&display=swap\" rel=\"stylesheet\">\r\n");
      out.write("        <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css\" rel=\"stylesheet\" integrity=\"sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We\" crossorigin=\"anonymous\">\r\n");
      out.write("        <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js\" integrity=\"sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ\" crossorigin=\"anonymous\"></script>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("        <!-- JavaScript Bundle with Popper -->\r\n");
      out.write("        <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js\" integrity=\"sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM\" crossorigin=\"anonymous\"></script>\r\n");
      out.write("        <style>\r\n");
      out.write("            body {\r\n");
      out.write("                font-family: 'Montserrat', sans-serif;\r\n");
      out.write("            }\r\n");
      out.write("        </style>\r\n");
      out.write("    </head>\r\n");
      out.write("    ");

            HttpSession objSesion = request.getSession();
            String usuario;
            String imgPerfil;
            if (objSesion.getAttribute("nickname") != null) {
      out.write("\r\n");
      out.write("                ");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css\" rel=\"stylesheet\" integrity=\"sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We\" crossorigin=\"anonymous\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css\">\r\n");
      out.write("<script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js\" integrity=\"sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ\" crossorigin=\"anonymous\"></script>\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("\r\n");
      out.write("<nav class=\"navbar navbar-expand-lg navbar-light bg-light\">\r\n");
      out.write("    <div class=\"container\">\r\n");
      out.write("        <a class=\"navbar-brand\" href=\"#\" style=\"margin-right: 40px;margin-right: 40px;\">\r\n");
      out.write("            <img src=\"https://i.imgur.com/9HUpz3c.png\" alt=\"\" width=\"100\" height=\"40\">\r\n");
      out.write("        </a>\r\n");
      out.write("        <div class=\"collapse navbar-collapse\" id=\"navbarSupportedContent\">\r\n");
      out.write("            <ul class=\"navbar-nav me-auto mb-2 mb-lg-0\">\r\n");
      out.write("                <li class=\"nav-item\" style=\"margin-right: 40px;\">\r\n");
      out.write("                    <div class=\"input-group\" style=\"width: 400px;\">\r\n");
      out.write("                        <input class=\"form-control border-end-0 border rounded-pill\" value=\"Espectáculos, Paquetes\" type=\"search\" id=\"example-search-input\">\r\n");
      out.write("                        <span class=\"input-group-append\">\r\n");
      out.write("                            <button class=\"btn btn-outline-secondary bg-white border-bottom-0 border rounded-pill\" style=\"margin-left: -40px; height: 37px\" type=\"button\">\r\n");
      out.write("                                <i class=\"bi bi-search\"></i>\r\n");
      out.write("                            </button>\r\n");
      out.write("                        </span>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </li>\r\n");
      out.write("                <li class=\"nav-item dropdown\" style=\"margin-right: 40px;\">\r\n");
      out.write("                    <a class=\"nav-link dropdown-toggle\" href=\"#\" id=\"navbarDropdown\" role=\"button\" data-bs-toggle=\"dropdown\" aria-expanded=\"false\">\r\n");
      out.write("                        <strong>Plataformas</strong>\r\n");
      out.write("                    </a>\r\n");
      out.write("                    <ul class=\"dropdown-menu\" aria-labelledby=\"navbarDropdown\">\r\n");
      out.write("                        <li><a class=\"dropdown-item\" href=\"#\">Action</a></li>\r\n");
      out.write("                        <li><a class=\"dropdown-item\" href=\"#\">Another action</a></li>\r\n");
      out.write("                        <li><hr class=\"dropdown-divider\"></li>\r\n");
      out.write("                        <li><a class=\"dropdown-item\" href=\"#\">Something else here</a></li>\r\n");
      out.write("                    </ul>\r\n");
      out.write("                </li>\r\n");
      out.write("                <li class=\"nav-item dropdown\" style=\"margin-right: 40px;\">\r\n");
      out.write("                    <a class=\"nav-link dropdown-toggle\" href=\"#\" id=\"navbarDropdown\" role=\"button\" data-bs-toggle=\"dropdown\" aria-expanded=\"false\">\r\n");
      out.write("                        <strong>Categorías</strong>\r\n");
      out.write("                    </a>\r\n");
      out.write("                    <ul class=\"dropdown-menu\" aria-labelledby=\"navbarDropdown\">\r\n");
      out.write("                        <li><a class=\"dropdown-item\" href=\"#\">Action</a></li>\r\n");
      out.write("                        <li><a class=\"dropdown-item\" href=\"#\">Another action</a></li>\r\n");
      out.write("                        <li><hr class=\"dropdown-divider\"></li>\r\n");
      out.write("                        <li><a class=\"dropdown-item\" href=\"#\">Something else here</a></li>\r\n");
      out.write("                    </ul>\r\n");
      out.write("                </li>\r\n");
      out.write("\r\n");
      out.write("            </ul>\r\n");
      out.write("        </div>\r\n");
      out.write("        <ul class=\"navbar-nav me-auto mb-2 mb-lg-0\">\r\n");
      out.write("            <li class=\"nav-item dropdown\" style=\"margin-right: 40px;\">\r\n");
      out.write("                <a class=\"nav-link dropdown-toggle\" href=\"#\" id=\"navbarDropdown\" role=\"button\" data-bs-toggle=\"dropdown\" aria-expanded=\"false\">\r\n");
      out.write("                    <img\r\n");
      out.write("                        src=\"\r\n");
      out.write("                        ");

                            imgPerfil = objSesion.getAttribute("imagen").toString();
                            out.print(imgPerfil);
                        
      out.write("\r\n");
      out.write("                        \"\r\n");
      out.write("                        class=\"rounded-circle z-depth-0\"\r\n");
      out.write("                        alt=\"avatar image\"\r\n");
      out.write("                        height=\"35\"\r\n");
      out.write("                        hight=\"35\"\r\n");
      out.write("                        />\r\n");
      out.write("                </a>\r\n");
      out.write("                <ul class=\"dropdown-menu\" aria-labelledby=\"navbarDropdown\">\r\n");
      out.write("                    <li><a class=\"dropdown-item\" href=\"#\">Action</a></li>\r\n");
      out.write("                    <li><a class=\"dropdown-item\" href=\"#\">Another action</a></li>\r\n");
      out.write("                    <li><hr class=\"dropdown-divider\"></li>\r\n");
      out.write("                    <li><a class=\"dropdown-item\" href=\"/CoronaTickets-Web/Pages/Users/CerrarSesion.jsp\">Cerrar Sesión</a></li>\r\n");
      out.write("                </ul>\r\n");
      out.write("                \r\n");
      out.write("            </li>\r\n");
      out.write("            <h6 style=\"margin-top: 10%; padding-left: 0px;\"> \r\n");
      out.write("            ");

                usuario = objSesion.getAttribute("nickname").toString();
                out.print(usuario);
            
      out.write(" </h6>\r\n");
      out.write("        </ul>\r\n");
      out.write("    </div>\r\n");
      out.write("</nav>\r\n");
      out.write("\r\n");
      out.write("            ");
}
            else{
      out.write("\r\n");
      out.write("                ");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css\" rel=\"stylesheet\" integrity=\"sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We\" crossorigin=\"anonymous\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css\">\r\n");
      out.write("<script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js\" integrity=\"sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ\" crossorigin=\"anonymous\"></script>\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("\r\n");
      out.write("<nav class=\"navbar navbar-expand-lg navbar-light bg-light\">\r\n");
      out.write("    <div class=\"container\">\r\n");
      out.write("        <a class=\"navbar-brand\" href=\"#\" style=\"margin-right: 40px;margin-right: 40px;\">\r\n");
      out.write("            <img src=\"https://i.imgur.com/9HUpz3c.png\" alt=\"\" width=\"100\" height=\"40\">\r\n");
      out.write("        </a>\r\n");
      out.write("        <div class=\"collapse navbar-collapse\" id=\"navbarSupportedContent\">\r\n");
      out.write("            <ul class=\"navbar-nav me-auto mb-2 mb-lg-0\">\r\n");
      out.write("                <li class=\"nav-item\" style=\"margin-right: 40px;\">\r\n");
      out.write("                    \r\n");
      out.write("                    <div class=\"input-group\" style=\"width: 400px;\">\r\n");
      out.write("                        <input class=\"form-control border-end-0 border rounded-pill\" value=\"Espectáculos, Paquetes\" type=\"search\" id=\"example-search-input\">\r\n");
      out.write("                        <span class=\"input-group-append\">\r\n");
      out.write("                            <button class=\"btn btn-outline-secondary bg-white border-bottom-0 border rounded-pill\" style=\"margin-left: -40px; height: 37px\" type=\"button\">\r\n");
      out.write("                                <i class=\"bi bi-search\"></i>\r\n");
      out.write("                            </button>\r\n");
      out.write("                        </span>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    \r\n");
      out.write("                </li>\r\n");
      out.write("                <li class=\"nav-item dropdown\" style=\"margin-right: 40px;\">\r\n");
      out.write("                    <a class=\"nav-link dropdown-toggle\" href=\"#\" id=\"navbarDropdown\" role=\"button\" data-bs-toggle=\"dropdown\" aria-expanded=\"false\">\r\n");
      out.write("                        <strong>Plataformas</strong>\r\n");
      out.write("                    </a>\r\n");
      out.write("                    <ul class=\"dropdown-menu\" aria-labelledby=\"navbarDropdown\">\r\n");
      out.write("                        <li><a class=\"dropdown-item\" href=\"#\">Action</a></li>\r\n");
      out.write("                        <li><a class=\"dropdown-item\" href=\"#\">Another action</a></li>\r\n");
      out.write("                        <li><hr class=\"dropdown-divider\"></li>\r\n");
      out.write("                        <li><a class=\"dropdown-item\" href=\"#\">Something else here</a></li>\r\n");
      out.write("                    </ul>\r\n");
      out.write("                </li>\r\n");
      out.write("                <li class=\"nav-item dropdown\" style=\"margin-right: 40px;\">\r\n");
      out.write("                    <a class=\"nav-link dropdown-toggle\" href=\"#\" id=\"navbarDropdown\" role=\"button\" data-bs-toggle=\"dropdown\" aria-expanded=\"false\">\r\n");
      out.write("                        <strong>Categorías</strong>\r\n");
      out.write("                    </a>\r\n");
      out.write("                    <ul class=\"dropdown-menu\" aria-labelledby=\"navbarDropdown\">\r\n");
      out.write("                        <li><a class=\"dropdown-item\" href=\"#\">Action</a></li>\r\n");
      out.write("                        <li><a class=\"dropdown-item\" href=\"#\">Another action</a></li>\r\n");
      out.write("                        <li><hr class=\"dropdown-divider\"></li>\r\n");
      out.write("                        <li><a class=\"dropdown-item\" href=\"#\">Something else here</a></li>\r\n");
      out.write("                    </ul>\r\n");
      out.write("                </li>\r\n");
      out.write("            </ul>\r\n");
      out.write("        </div>\r\n");
      out.write("        <form method=\"get\" action=\"/CoronaTickets-Web/Pages/Login/login.jsp\"> \r\n");
      out.write("        <button type=\"submit\" class=\"btn btn-outline-dark\"><strong>Ingresar</strong> <svg xmlns=\"http://www.w3.org/2000/svg\" width=\"16\" height=\"16\" fill=\"currentColor\" class=\"bi bi-box-arrow-in-right\" viewBox=\"0 0 16 16\" >\r\n");
      out.write("            <path fill-rule=\"evenodd\" d=\"M6 3.5a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-2a.5.5 0 0 0-1 0v2A1.5 1.5 0 0 0 6.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-8A1.5 1.5 0 0 0 5 3.5v2a.5.5 0 0 0 1 0v-2z\"/>\r\n");
      out.write("            <path fill-rule=\"evenodd\" d=\"M11.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H1.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3z\"/>\r\n");
      out.write("            </svg></button>\r\n");
      out.write("        </form>\r\n");
      out.write("    </div>\r\n");
      out.write("</nav>\r\n");
      out.write("\r\n");
      out.write("            ");
}
        
      out.write("\r\n");
      out.write("    <body>\r\n");
      out.write("        <div class=\"d-flex justify-content-md-center align-items-center mt-5\">\r\n");
      out.write("            <div class=\"container w-75 \">\r\n");
      out.write("                    <div class=\"row \">\r\n");
      out.write("                        <div class=\"col-6\"  style=\"overflow-y: scroll; height: 85vh\">\r\n");
      out.write("                            <h1>Paquetes</h1>\r\n");
      out.write("                            ");

                                Map<String, Paquete> paquetes = (Map<String, Paquete>) request.getAttribute("paquetes");
                                if(paquetes == null){
                                    System.out.println("VACIO");
                                }else{
                                    for (Map.Entry<String, Paquete> entry : paquetes.entrySet()) {
                                        String key = entry.getKey();
                                        Paquete value = entry.getValue();
                                        String nombre =value.getNombre();
                                        String desc = value.getDescripcion();
                                        String fechaIni = value.getFecha_Inicio().getDia()+"/"+value.getFecha_Inicio().getMes()+"/"+value.getFecha_Inicio().getAnio();
                                        String fechaFin = value.getFecha_Fin().getDia()+"/"+value.getFecha_Fin().getMes()+"/"+value.getFecha_Fin().getAnio();
                                        float descuento = value.getDescuento();
                                        float costo = value.getCosto();
                                        String urlImagen = value.getUrl();
                                        String concat = nombre+","+desc+","+fechaIni+","+fechaFin+","+Float.toString(descuento)+","+Float.toString(costo)+","+urlImagen;
                            
      out.write("\r\n");
      out.write("                            <div class=\"row \">\r\n");
      out.write("                                <div class=\"container w-100 mt-3 mb-3\">\r\n");
      out.write("                                    <div class=\"card bg-dark text-white\">\r\n");
      out.write("                                        <img src=\"");
      out.print( value.getUrl());
      out.write("\" id=\"");
      out.print( key);
      out.write("\" class=\"card-img\">\r\n");
      out.write("                                        <div class=\"card-img-overlay d-flex justify-content-md-center align-items-center\">\r\n");
      out.write("                                            <form name=\"ver_mas\" method=\"POST\" action=\"/CoronaTickets-Web/Paquete\" >\r\n");
      out.write("                                                <input type=\"hidden\" value=\"");
      out.print( concat );
      out.write("\" name=\"ver_mas\">\r\n");
      out.write("                                                <input type=\"submit\" value=\"Ver más\" id=\"btn_ver_mas\" class=\"btn btn-secondary\">\r\n");
      out.write("                                            </form>\r\n");
      out.write("                                        </div>\r\n");
      out.write("                                    </div>\r\n");
      out.write("                                    \r\n");
      out.write("                                </div>\r\n");
      out.write("                            </div>\r\n");
      out.write("                            ");

                                    }
                                }
                            
      out.write(" \r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div class=\"col-6\"  style=\"overflow-y: scroll; height: 85vh\">\r\n");
      out.write("                            <h1>Espectáculos</h1>\r\n");
      out.write("                            <div class=\"container\">\r\n");
      out.write("                                \r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                             \r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("    <script src=\"https://code.jquery.com/jquery-3.3.1.slim.min.js\" integrity=\"sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo\" crossorigin=\"anonymous\"></script>\r\n");
      out.write("    <script src=\"https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js\" integrity=\"sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1\" crossorigin=\"anonymous\"></script>\r\n");
      out.write("    <script src=\"https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js\" integrity=\"sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM\" crossorigin=\"anonymous\"></script>\r\n");
      out.write("    </body>\r\n");
      out.write("\r\n");
      out.write("    </html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}

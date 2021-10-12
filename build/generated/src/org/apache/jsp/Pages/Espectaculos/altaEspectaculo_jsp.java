package org.apache.jsp.Pages.Espectaculos;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.HashMap;
import Logica.Clases.Plataforma;
import Logica.Clases.Categoria;
import java.util.Map;

public final class altaEspectaculo_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(1);
    _jspx_dependants.add("/Pages/Common/Header2.jsp");
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
      out.write("    <!DOCTYPE html>\r\n");
      out.write("<html lang=\"en\">\r\n");
      out.write("\r\n");
      out.write("<head>\r\n");
      out.write("    <meta charset=\"UTF-8\">\r\n");
      out.write("    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n");
      out.write("    <title>Document</title>\r\n");
      out.write("    <!-- CSS only -->\r\n");
      out.write("    <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css\" rel=\"stylesheet\" integrity=\"sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We\" crossorigin=\"anonymous\">\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css\">\r\n");
      out.write("    <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js\" integrity=\"sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl\" crossorigin=\"anonymous\"></script>\r\n");
      out.write("    <link rel=\"preconnect\" href=\"https://fonts.googleapis.com\">\r\n");
      out.write("    <link rel=\"preconnect\" href=\"https://fonts.gstatic.com\" crossorigin>\r\n");
      out.write("    <link href=\"https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700&display=swap\" rel=\"stylesheet\">\r\n");
      out.write("    <style>\r\n");
      out.write("        body {\r\n");
      out.write("            font-family: 'Montserrat', sans-serif;\r\n");
      out.write("        }\r\n");
      out.write("    </style>\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("<body>\r\n");
      out.write("    ");
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
      out.write("                    <li><a class=\"dropdown-item\" href=\"#\">Something else here</a></li>\r\n");
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
      out.write("    <div class=\"d-flex justify-content-md-center align-items-center mt-5\">\r\n");
      out.write("\r\n");
      out.write("        <form name=\"altaEspectaculo\" method=\"POST\" action=\"/CoronaTickets-Web/AltaEspectaculo\" >\r\n");
      out.write("            <div style=\"width: 80vh;\" class=\"form-register d-flex justify-content-md-center align-items-center\">\r\n");
      out.write("                <h1 class=\"mb-5\">ALTA DE ESPECTÁCULO</h1>\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"row\">\r\n");
      out.write("                <div class=\"col-6\">\r\n");
      out.write("                    <div class=\"form-group \">\r\n");
      out.write("                        <input type=\"text\" class=\"form-control rounded-pill mb-2 \" id=\"inputNombre\" name=\"inputNombre\" placeholder=\"Nombre \">\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <textarea class=\"form-control rounded-3 mb-2\" id=\"inputDescripcion\" name=\"inputDescripcion\" style=\"resize: none; \" placeholder=\"Descripción \" rows=\"2 \"></textarea>\r\n");
      out.write("                    <div class=\"form-group \">\r\n");
      out.write("                        <div class=\"input-group \">\r\n");
      out.write("                            <input type=\"number\" class=\"form-control rounded-pill mb-2 \" id=\"inputDuracion\" name=\"inputDuracion\" placeholder=\"Duración(minutos)\">\r\n");
      out.write("                            <span class=\"input-group-append \">\r\n");
      out.write("                                <button class=\"btn btn-outline-secondary bg-white border-0 rounded-pill \" style=\"margin-left: -41px; margin-top: 1.5px; height: 32px \" type=\"button \"disabled>\r\n");
      out.write("                                    <i class=\"bi bi-clock \"></i>\r\n");
      out.write("                                </button>\r\n");
      out.write("                            </span>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"form-group mt-1\">\r\n");
      out.write("                        <div class=\"row\">\r\n");
      out.write("                            <div class=\"col\">\r\n");
      out.write("                                <select class=\"form-select\" name=\"plataforma\" aria-label=\"Plataformas\">\r\n");
      out.write("                                    <option selected>Plataformas</option>\r\n");
      out.write("                                    ");

                                        int i=0;
                                        Map<String, Plataforma> plataformas = (Map<String, Plataforma>) request.getAttribute("plataformas");
                                        if(plataformas == null){
                                            System.out.println("VACIO");
                                        }else{
                                            for (Map.Entry<String, Plataforma> entry : plataformas.entrySet()) {
                                                String key = entry.getKey();
                                                Plataforma value = entry.getValue();
                                    
      out.write("\r\n");
      out.write("                                    <option value=\"");
      out.print(i);
      out.write("\" id=\"");
      out.print(key);
      out.write('"');
      out.write('>');
      out.print(key);
      out.write("</option>\r\n");
      out.write("                                    ");

                                                i++;
                                            }
                                        }
                                    
      out.write("\r\n");
      out.write("                                </select>\r\n");
      out.write("                            </div>\r\n");
      out.write("                            <div class=\"col\" style=\"height: 8vh; overflow-y: scroll;\">\r\n");
      out.write("                                \r\n");
      out.write("                                    ");

                                    Map<String, Categoria> categorias = (Map<String, Categoria>) request.getAttribute("categorias");
                                    if(plataformas == null){
                                        System.out.println("VACIO");
                                    }else{
                                        for (Map.Entry<String, Categoria> entry : categorias.entrySet()) {
                                            String key2 = entry.getKey();
                                            Categoria value2 = entry.getValue();

                                
      out.write("\r\n");
      out.write("\r\n");
      out.write("                                <div class=\"row\">\r\n");
      out.write("                                    <div class=\"form-check\">\r\n");
      out.write("                                        <input class=\"form-check-input\" name=\"categoria\" type=\"checkbox\" value=\"");
      out.print(value2.getNombre());
      out.write("\" >\r\n");
      out.write("                                        <label class=\"form-check-label\" for=\"flexCheckDefault\">\r\n");
      out.write("                                          ");
      out.print(value2.getNombre());
      out.write("\r\n");
      out.write("                                        </label>\r\n");
      out.write("                                    </div>\r\n");
      out.write("                                </div>\r\n");
      out.write("                                ");

                                        }
                                    }
                                
      out.write("\r\n");
      out.write("                                \r\n");
      out.write("                                \r\n");
      out.write("                            </div>\r\n");
      out.write("\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("\r\n");
      out.write("                <div class=\"col-6\">\r\n");
      out.write("                    <div class=\"input-group \">\r\n");
      out.write("                        <input type=\"number\" class=\"form-control rounded-pill mb-2 \" id=\"inputEspecMin\" name=\"inputEspecMin\" placeholder=\"Espectadores mínimos \">\r\n");
      out.write("                        <span class=\"input-group-append \">\r\n");
      out.write("                            <button class=\"btn btn-outline-secondary bg-white border-0 rounded-pill \" style=\"margin-left: -41px; margin-top: 1.5px; height: 32px \" type=\"button \"disabled>\r\n");
      out.write("                                <i class=\"bi bi-person-fill \"></i>\r\n");
      out.write("                            </button>\r\n");
      out.write("                        </span>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"input-group \">\r\n");
      out.write("                        <input type=\"number \" class=\"form-control rounded-pill mb-2 \" id=\"inputEspecMax\" name=\"inputEspecMax\" placeholder=\"Espectadores máximos \">\r\n");
      out.write("                        <span class=\"input-group-append \">\r\n");
      out.write("                            <button class=\"btn btn-outline-secondary bg-white border-0 rounded-pill \" style=\"margin-left: -41px; margin-top: 1.5px; height: 32px \" type=\"button \"disabled>\r\n");
      out.write("                                <i class=\"bi bi-person-fill \"></i>\r\n");
      out.write("                            </button>\r\n");
      out.write("                        </span>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"input-group\">\r\n");
      out.write("                        <input type=\"url \" class=\"form-control rounded-pill mb-2 \" id=\"inputURL\" name=\"inputURL\" placeholder=\"URL\">\r\n");
      out.write("                        <span class=\"input-group-append \">\r\n");
      out.write("                            <button class=\"btn btn-outline-secondary bg-white border-0 rounded-pill \" style=\"margin-left: -41px; margin-top: 1.5px; height: 32px \" type=\"button \"disabled>\r\n");
      out.write("                                <i class=\"bi bi-link-45deg \"></i>\r\n");
      out.write("                            </button>\r\n");
      out.write("                        </span>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"input-group\">\r\n");
      out.write("                        <input type=\"number\" step=\"0.01\" class=\"form-control rounded-pill mb-2 \" id=\"inputCosto\" name=\"inputCosto\" placeholder=\"Costo\">\r\n");
      out.write("                        <span class=\"input-group-append \">\r\n");
      out.write("                            <button class=\"btn btn-outline-secondary bg-white border-0 rounded-pill \" style=\"margin-left: -41px; margin-top: 1.5px; height: 32px \" type=\"button \"disabled>\r\n");
      out.write("                                <i class=\"bi bi-currency-dollar \"></i>\r\n");
      out.write("                            </button>\r\n");
      out.write("                        </span>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <label for=\"altaEspectaculo\" class=\"form-label\">URL de imagen (Opcional):</label>\r\n");
      out.write("                    <div class=\"input-group\">\r\n");
      out.write("                        <input type=\"file\" class=\"form-control rounded-pill mb-2 \" id=\"inputFile\"  name=\"inputFile\" placeholder=\"\">\r\n");
      out.write("                        <span class=\"input-group-append \">\r\n");
      out.write("                            <button class=\"btn btn-outline-secondary bg-white border-0 rounded-pill \" style=\"margin-left: -41px; margin-top: 1.5px; height: 32px \" type=\"button \"disabled>\r\n");
      out.write("                                <i class=\"bi bi-link-45deg \"></i>\r\n");
      out.write("                            </button>\r\n");
      out.write("                        </span>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"form-register mt-5 d-flex justify-content-md-center align-items-center \">\r\n");
      out.write("                <button type=\"submit\" class=\"btn btn-outline-secondary rounded-pill \">\r\n");
      out.write("                    CREAR\r\n");
      out.write("                </button>\r\n");
      out.write("            </div>\r\n");
      out.write("\r\n");
      out.write("        </form>\r\n");
      out.write("    </div>\r\n");
      out.write("\r\n");
      out.write("    <script src=\"https://code.jquery.com/jquery-3.5.1.slim.min.js \" integrity=\"sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj \" crossorigin=\"anonymous \"></script>\r\n");
      out.write("    <script src=\"https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js \" integrity=\"sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN \" crossorigin=\"anonymous \"></script>\r\n");
      out.write("    <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js \" integrity=\"sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF \" crossorigin=\"anonymous \"></script>\r\n");
      out.write("</body>\r\n");
      out.write("\r\n");
      out.write("</html>");
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

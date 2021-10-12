package org.apache.jsp.Pages.Users.Perfil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class Espectador_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

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
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html lang=\"en\">\r\n");
      out.write("\r\n");
      out.write("<head>\r\n");
      out.write("  <meta charset=\"UTF-8\">\r\n");
      out.write("  <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n");
      out.write("  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n");
      out.write("  <title>ESPECTADOR</title>\r\n");
      out.write("  <link rel=\"stylesheet\" href=\"source/Style.css\">\r\n");
      out.write("  <script async=\"\" defer=\"\" src=\"https://buttons.github.io/buttons.js\"></script>\r\n");
      out.write("  <script src=\"https://code.jquery.com/jquery-3.3.1.js\" integrity=\"sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=\"\r\n");
      out.write("    crossorigin=\"anonymous\">\r\n");
      out.write("  </script>\r\n");
      out.write("  <script>\r\n");
      out.write("    $(function () {\r\n");
      out.write("      $(\"#header\").load(\"Pages/Common/Header2.jsp\");\r\n");
      out.write("    });\r\n");
      out.write("  </script>\r\n");
      out.write("</head>\r\n");
      out.write("<body style=\"background-color: rgb(230, 232, 240);\">\r\n");
      out.write("  <div id=\"header\"></div>\r\n");
      out.write("  <div class=\"container\">\r\n");
      out.write("    <div class=\"main-body\">\r\n");
      out.write("      <div class=\"row gutters-sm\">\r\n");
      out.write("        <div class=\"col-md-4 mb-3\">\r\n");
      out.write("          <div class=\"card\">\r\n");
      out.write("            <!-- Tarjeta de perfil -->\r\n");
      out.write("            <div class=\"card-body\">\r\n");
      out.write("              <div class=\"d-flex flex-column align-items-center text-center\">\r\n");
      out.write("                <!-- IMAGEN -->\r\n");
      out.write("                <img src=\"https://i.pinimg.com/236x/56/cc/4a/56cc4afe5b46ba2e089c8e2ba2bbe897.jpg\" alt=\"Admin\" class=\"rounded-circle\" width=\"150\">\r\n");
      out.write("                <div class=\"mt-3\">\r\n");
      out.write("                  <h4>Negrii</h4>\r\n");
      out.write("                  <p class=\"text-secondary mb-1\">Espectador</p>\r\n");
      out.write("                  <label> <a style=\"color: black; text-decoration: none;\" href=\"#\">Seguidores <b>1230</b></a></label>\r\n");
      out.write("                  <label> <a style=\"color: black; text-decoration: none;\" href=\"#\">Seguidos <b>534</b></a> </label>\r\n");
      out.write("                  <button class=\"btn btn-primary\">Seguir <!-- O dejar de seguir --></button>\r\n");
      out.write("                </div>\r\n");
      out.write("              </div>\r\n");
      out.write("            </div>\r\n");
      out.write("          </div>\r\n");
      out.write("          <div class=\"card mt-3\">\r\n");
      out.write("            <!-- Informacion basica -->\r\n");
      out.write("            <ul class=\"list-group list-group-flush\">\r\n");
      out.write("              <li class=\"list-group-item d-flex justify-content-between align-items-center flex-wrap\">\r\n");
      out.write("                <!-- NOMBRE -->\r\n");
      out.write("                <h6 class=\"mb-0\"> Nombre</h6>\r\n");
      out.write("                <span class=\"text-secondary\">Negrita Morocha</span>\r\n");
      out.write("              </li>\r\n");
      out.write("              <li class=\"list-group-item d-flex justify-content-between align-items-center flex-wrap\">\r\n");
      out.write("                <!-- APELLIDO -->\r\n");
      out.write("                <h6 class=\"mb-0\"> Apellido</h6>\r\n");
      out.write("                <span class=\"text-secondary\">Alves López</span>\r\n");
      out.write("              </li>\r\n");
      out.write("              <li class=\"list-group-item d-flex justify-content-between align-items-center flex-wrap\">\r\n");
      out.write("                <!-- FECHA DE NACIMIENTO -->\r\n");
      out.write("                <h6 class=\"mb-0\">\r\n");
      out.write("                  <svg xmlns=\"http://www.w3.org/2000/svg\" width=\"24\" height=\"24\" fill=\"currentColor\" class=\"bi bi-calendar-event\" viewBox=\"0 0 16 16\">\r\n");
      out.write("                    <path d=\"M11 6.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1z\"/>\r\n");
      out.write("                    <path d=\"M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z\"/>\r\n");
      out.write("                  </svg>\r\n");
      out.write("                  </svg> Nacimiento</h6>\r\n");
      out.write("                <span class=\"text-secondary\">04/08/1997</span>\r\n");
      out.write("              </li>\r\n");
      out.write("              <li class=\"list-group-item d-flex justify-content-between align-items-center flex-wrap\">\r\n");
      out.write("                <!-- EMAIL -->\r\n");
      out.write("                <h6 class=\"mb-0\">\r\n");
      out.write("                  <svg xmlns=\"http://www.w3.org/2000/svg\" width=\"24\" height=\"24\" fill=\"currentColor\"\r\n");
      out.write("                    class=\"bi bi-envelope\" viewBox=\"0 0 16 16\">\r\n");
      out.write("                    <path\r\n");
      out.write("                      d=\"M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4zm2-1a1 1 0 0 0-1 1v.217l7 4.2 7-4.2V4a1 1 0 0 0-1-1H2zm13 2.383-4.758 2.855L15 11.114v-5.73zm-.034 6.878L9.271 8.82 8 9.583 6.728 8.82l-5.694 3.44A1 1 0 0 0 2 13h12a1 1 0 0 0 .966-.739zM1 11.114l4.758-2.876L1 5.383v5.73z\" />\r\n");
      out.write("                  </svg>\r\n");
      out.write("                  </svg> Mail</h6>\r\n");
      out.write("                <span class=\"text-secondary\">Alves.negri@gmail.com</span>\r\n");
      out.write("              </li>\r\n");
      out.write("            </ul>\r\n");
      out.write("          </div>\r\n");
      out.write("        </div>\r\n");
      out.write("        <div class=\"col-md-8\">\r\n");
      out.write("          <div class=\"card mb-3\">\r\n");
      out.write("            <div class=\"card-body\">\r\n");
      out.write("              <!-- FUNCIONES REGISTRADO -->\r\n");
      out.write("              <h6 class=\"d-flex align-items-center mb-3\"><i class=\"material-icons text-info mr-2\"> Funciones </i>  Registrado\r\n");
      out.write("              </h6>\r\n");
      out.write("              <div class=\"func\">\r\n");
      out.write("                <!-- FUNCION EJEMPLO -->\r\n");
      out.write("                <ul class=\"list-group list-group-flush\">\r\n");
      out.write("                  <li class=\"list-group-item d-flex justify-content-between align-items-center flex-wrap\">\r\n");
      out.write("                    <!-- NOMBRE -->\r\n");
      out.write("                    <h6 class=\"mb-0\"> Nombre</h6>\r\n");
      out.write("                    <span class=\"text-secondary\">El entierro</span>\r\n");
      out.write("                  </li>\r\n");
      out.write("                  <li class=\"list-group-item d-flex justify-content-between align-items-center flex-wrap\">\r\n");
      out.write("                    <!-- NOMBRE -->\r\n");
      out.write("                    <h6 class=\"mb-0\"> Espectaculo</h6>\r\n");
      out.write("                    <span class=\"text-secondary\">Carnaval</span>\r\n");
      out.write("                  </li>\r\n");
      out.write("                  <li class=\"list-group-item d-flex justify-content-between align-items-center flex-wrap\">\r\n");
      out.write("                    <!-- PLATAFORMA -->\r\n");
      out.write("                    <h6 class=\"mb-0\">\r\n");
      out.write("                      <svg xmlns=\"http://www.w3.org/2000/svg\" width=\"16\" height=\"16\" fill=\"currentColor\"\r\n");
      out.write("                        class=\"bi bi-collection-play\" viewBox=\"0 0 16 16\">\r\n");
      out.write("                        <path\r\n");
      out.write("                          d=\"M2 3a.5.5 0 0 0 .5.5h11a.5.5 0 0 0 0-1h-11A.5.5 0 0 0 2 3zm2-2a.5.5 0 0 0 .5.5h7a.5.5 0 0 0 0-1h-7A.5.5 0 0 0 4 1zm2.765 5.576A.5.5 0 0 0 6 7v5a.5.5 0 0 0 .765.424l4-2.5a.5.5 0 0 0 0-.848l-4-2.5z\" />\r\n");
      out.write("                        <path\r\n");
      out.write("                          d=\"M1.5 14.5A1.5 1.5 0 0 1 0 13V6a1.5 1.5 0 0 1 1.5-1.5h13A1.5 1.5 0 0 1 16 6v7a1.5 1.5 0 0 1-1.5 1.5h-13zm13-1a.5.5 0 0 0 .5-.5V6a.5.5 0 0 0-.5-.5h-13A.5.5 0 0 0 1 6v7a.5.5 0 0 0 .5.5h13z\" />\r\n");
      out.write("                      </svg>\r\n");
      out.write("                      Plataforma</h6>\r\n");
      out.write("                    <span class=\"text-secondary\">Twitch</span>\r\n");
      out.write("                  </li>\r\n");
      out.write("                  <li class=\"list-group-item d-flex justify-content-between align-items-center flex-wrap\">\r\n");
      out.write("                    <button class=\"btn btn-outline-primary\">Detalles</button>\r\n");
      out.write("                  </li>\r\n");
      out.write("                </ul>\r\n");
      out.write("              </div>\r\n");
      out.write("            </div>\r\n");
      out.write("          </div>\r\n");
      out.write("        </div>\r\n");
      out.write("      </div>\r\n");
      out.write("    </div>\r\n");
      out.write("  </div>\r\n");
      out.write("</body>\r\n");
      out.write("\r\n");
      out.write("</html>\r\n");
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

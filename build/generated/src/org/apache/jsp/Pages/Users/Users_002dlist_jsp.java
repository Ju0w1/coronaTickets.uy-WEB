package org.apache.jsp.Pages.Users;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class Users_002dlist_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("   <meta charset=\"UTF-8\">\r\n");
      out.write("   <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n");
      out.write("   <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n");
      out.write("   <title>LIST USER</title>\r\n");
      out.write("   <link rel=\"stylesheet\" href=\"User-list.css\">\r\n");
      out.write("   <script async=\"\" defer=\"\" src=\"https://buttons.github.io/buttons.js\"></script>\r\n");
      out.write("   <script src=\"https://code.jquery.com/jquery-3.3.1.js\" integrity=\"sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=\"\r\n");
      out.write("      crossorigin=\"anonymous\"> </script>\r\n");
      out.write("   <script>\r\n");
      out.write("      $(function () {\r\n");
      out.write("         $(\"#header\").load(\"Pages/Common/Header2.jsp\");\r\n");
      out.write("      });\r\n");
      out.write("   </script>\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("<body>\r\n");
      out.write("   <div id=\"header\"></div>\r\n");
      out.write("   <br>\r\n");
      out.write("   <div class=\"container\">\r\n");
      out.write("      <div class=\"row\">\r\n");
      out.write("         <div class=\"col-lg-6\">\r\n");
      out.write("            <br> <br>\r\n");
      out.write("            <div class=\"articles card\">\r\n");
      out.write("               <div class=\"card-header d-flex align-items-center\">\r\n");
      out.write("                  <h2 class=\"h3\">Artistas</h2>\r\n");
      out.write("               </div>\r\n");
      out.write("               <!--ARTISTAS-->\r\n");
      out.write("               <div class=\"card-body no-padding\">\r\n");
      out.write("                  <!--USUARIO-->\r\n");
      out.write("                  <div class=\"item d-flex align-items-center\">\r\n");
      out.write("                     <div class=\"image\"><img src=\"https://bootdey.com/img/Content/avatar/avatar2.png\" alt=\"fotoPerfil\"\r\n");
      out.write("                           class=\"img-fluid rounded-circle\"></div>\r\n");
      out.write("                     <div class=\"text\"><a href=\"#\">\r\n");
      out.write("                           <h3 class=\"h5\">Facu</h3>\r\n");
      out.write("                        </a><small>Facundo@gmail.com</small>\r\n");
      out.write("                     </div>\r\n");
      out.write("                  </div>\r\n");
      out.write("                  <!--USUARIO-->\r\n");
      out.write("                  <div class=\"item d-flex align-items-center\">\r\n");
      out.write("                     <div class=\"image\"><img src=\"https://bootdey.com/img/Content/avatar/avatar3.png\" alt=\"fotoPerfil\"\r\n");
      out.write("                           class=\"img-fluid rounded-circle\"></div>\r\n");
      out.write("                     <div class=\"text\"><a href=\"#\">\r\n");
      out.write("                           <h3 class=\"h5\">JuanPa</h3>\r\n");
      out.write("                        </a><small>Pablo.Juan@gmail.com</small>\r\n");
      out.write("                     </div>\r\n");
      out.write("                  </div>\r\n");
      out.write("                  <!--USUARIO-->\r\n");
      out.write("                  <div class=\"item d-flex align-items-center\">\r\n");
      out.write("\r\n");
      out.write("                     <div class=\"image\"><img src=\"https://bootdey.com/img/Content/avatar/avatar4.png\" alt=\"fotoPerfil\"\r\n");
      out.write("                           class=\"img-fluid rounded-circle\"></div>\r\n");
      out.write("                     <div class=\"text\"><a href=\"#\">\r\n");
      out.write("                           <h3 class=\"h5\"> Dieter </h3>\r\n");
      out.write("                        </a><small>Dieter@crack.com</small>\r\n");
      out.write("                     </div>\r\n");
      out.write("                  </div>\r\n");
      out.write("               </div>\r\n");
      out.write("            </div>\r\n");
      out.write("         </div>\r\n");
      out.write("         <div class=\"col-lg-6\">\r\n");
      out.write("            <br> <br>\r\n");
      out.write("            <div class=\"articles card\">\r\n");
      out.write("               <div class=\"card-header d-flex align-items-center\">\r\n");
      out.write("                  <h2 class=\"h3\">Espectadores</h2>\r\n");
      out.write("               </div>\r\n");
      out.write("               <!--ESPECTADORES-->\r\n");
      out.write("               <div class=\"card-body no-padding\">\r\n");
      out.write("                  <!--USUARIO-->\r\n");
      out.write("                  <div class=\"item d-flex align-items-center\">\r\n");
      out.write("\r\n");
      out.write("                     <div class=\"image\"><img src=\"https://bootdey.com/img/Content/avatar/avatar6.png\" alt=\"fotoPerfil\"\r\n");
      out.write("                           class=\"img-fluid rounded-circle\"></div>\r\n");
      out.write("                     <div class=\"text\"><a href=\"#\">\r\n");
      out.write("                           <h3 class=\"h5\">Milton</h3>\r\n");
      out.write("                        </a><small>milton.ayala@gmail.com</small></div>\r\n");
      out.write("                  </div>\r\n");
      out.write("                  <!--USUARIO-->\r\n");
      out.write("                  <div class=\"item d-flex align-items-center\">\r\n");
      out.write("                     <div class=\"image\"><img src=\"https://bootdey.com/img/Content/avatar/avatar5.png\" alt=\"fotoPerfil\"\r\n");
      out.write("                           class=\"img-fluid rounded-circle\"></div>\r\n");
      out.write("                     <div class=\"text\"><a href=\"#\">\r\n");
      out.write("                           <h3 class=\"h5\">FedeR</h3>\r\n");
      out.write("                        </a><small>Federkiller@gmail.com</small>\r\n");
      out.write("                     </div>\r\n");
      out.write("                  </div>\r\n");
      out.write("                  <!--USUARIO-->\r\n");
      out.write("                  <div class=\"item d-flex align-items-center\">\r\n");
      out.write("                     <div class=\"image\"><img src=\"https://bootdey.com/img/Content/avatar/avatar6.png\" alt=\"fotoPerfil\"\r\n");
      out.write("                           class=\"img-fluid rounded-circle\"></div>\r\n");
      out.write("                     <div class=\"text\"><a href=\"#\">\r\n");
      out.write("                           <h3 class=\"h5\"> Dávila </h3>\r\n");
      out.write("                        </a><small>Rafa.davila@hotmail.com</small></div>\r\n");
      out.write("                  </div>\r\n");
      out.write("               </div>\r\n");
      out.write("            </div>\r\n");
      out.write("         </div>\r\n");
      out.write("      </div>\r\n");
      out.write("   </div>\r\n");
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

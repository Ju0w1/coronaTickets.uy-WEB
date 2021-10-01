package org.apache.jsp.Pages;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class Home_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("        <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css\" rel=\"stylesheet\" integrity=\"sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We\" crossorigin=\"anonymous\">\n");
      out.write("        <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js\" integrity=\"sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl\" crossorigin=\"anonymous\"></script>\n");
      out.write("        <script type=\"text/javascript\">\n");
      out.write("            function validarUsuario(){\n");
      out.write("                var email = \"pablopeculio@cras-dev.com\";\n");
      out.write("                var contra = \"123456\";\n");
      out.write("                if(document.formulario.mail.value == email){\n");
      out.write("                    if(document.formulario.contrasenia.value == contra){\n");
      out.write("                        ");

                        RequestDispatcher req = request.getRequestDispatcher("homeLogueado.jsp");
			req.forward(request, response);
                        
      out.write("\n");
      out.write("                    }else{\n");
      out.write("                        alert(\"Error de contraseña\");\n");
      out.write("                    }\n");
      out.write("                }else{\n");
      out.write("                    alert(\"Error de email\")\n");
      out.write("                }\n");
      out.write("            }\n");
      out.write("        </script>\n");
      out.write("    </head>\n");
      out.write("    <body\n");
      out.write("        <div class=\"d-flex justify-content-md-center align-items-center vh-100\">\n");
      out.write("          <form name=\"formulario\">\n");
      out.write("            <div class=\"mb-3\">\n");
      out.write("              <label for=\"exampleInputEmail1\" class=\"form-label\">Email address</label>\n");
      out.write("              <input type=\"email\" class=\"form-control\" id=\"exampleInputEmail1\" name=\"mail\" aria-describedby=\"emailHelp\">\n");
      out.write("            </div>\n");
      out.write("            <div class=\"mb-3\">\n");
      out.write("              <label for=\"exampleInputPassword1\" class=\"form-label\">Password</label>\n");
      out.write("              <input type=\"password\" class=\"form-control\" name=\"contrasenia\" id=\"exampleInputPassword1\">\n");
      out.write("            </div>\n");
      out.write("               <div class=\"d-flex justify-content-md-center align-items-center\">\n");
      out.write("                   <button type=\"submit\" class=\"btn btn-primary\" onclick=\"return validarUsuario();\">Login</button>\n");
      out.write("            </div>\n");
      out.write("          </form>\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("\n");
      out.write("\n");
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

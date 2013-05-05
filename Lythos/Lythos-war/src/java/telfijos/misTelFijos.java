/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package telfijos;

import dao.AutorizacionFacade;
import dao.TerminalfijoFacade;
import dao.UsuarioFacade;
import entidades.Terminalfijo;
import entidades.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author IsmiKin
 */
@WebServlet(name = "misTelFijos", urlPatterns = {"/telfijos/mistelfijos"})
public class misTelFijos extends HttpServlet {
    @EJB
    private TerminalfijoFacade terminalfijoFacade;
    @EJB
    private UsuarioFacade usuarioFacade;
    @EJB
    private AutorizacionFacade autorizacionFacade;

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        String nickname = request.getParameter("nickname");
        
        Usuario usuario = usuarioFacade.getUserByNickname(nickname);
        List<Terminalfijo> misTerminales = terminalfijoFacade.getByUsuario(usuario);
        
        request.setAttribute("misTerminales", misTerminales);
        
         RequestDispatcher rd=null; 
        
        rd = this.getServletContext().getRequestDispatcher("/mistelfijos.jsp");       
        rd.forward(request, response);
        
        try {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet misTelFijos</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet misTelFijos at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } finally {            
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
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
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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

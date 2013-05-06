/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package telmoviles;

import dao.LineaFacade;
import dao.ModelomovilFacade;
import dao.TerminalmovilFacade;
import dao.UsuarioFacade;
import entidades.Linea;
import entidades.Modelomovil;
import entidades.Terminalmovil;
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
 * @author Rocio
 */
@WebServlet(name = "formEditarTelMovil", urlPatterns = {"/formEditarTelMovil"})
public class formEditarTelMovil extends HttpServlet {

    
    @EJB
    private TerminalmovilFacade terminalmovilfacade;
    @EJB
    private ModelomovilFacade modelomovilfacade;
    @EJB
    private UsuarioFacade usuariofacade;
    @EJB
    private LineaFacade lineafacade;
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
        
        String idTelMovil = request.getParameter("idTerminalMovil");
        
        Terminalmovil aEditar = terminalmovilfacade.find(Integer.parseInt(idTelMovil));
        List<Modelomovil> modelos = modelomovilfacade.findAll();
        List<Usuario> usuarios = usuariofacade.findAll();
        List<Linea> lineas = lineafacade.findAll();
        
        request.setAttribute("modelos", modelos);
        request.setAttribute("usuarios", usuarios);
        request.setAttribute("lineas", lineas);
        
        request.setAttribute("terminal", aEditar);
        
        RequestDispatcher rd=null; 
        
        rd = this.getServletContext().getRequestDispatcher("/editarTelMovil.jsp");       
        rd.forward(request, response);
        
        
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet formEditarTelMovil</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet formEditarTelMovil at " + request.getContextPath() + "</h1>");
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

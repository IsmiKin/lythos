/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package telmoviles;

import dao.LineaFacade;
import dao.ModelomovilFacade;
import dao.TerminalmovilFacade;
import dao.UsuarioFacade;
import entidades.Terminalmovil;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "editarTelMovil", urlPatterns = {"/editarTelMovil"})
public class editarTelMovil extends HttpServlet {

    @EJB
    private TerminalmovilFacade terminalmovilfacade;
    @EJB
    private UsuarioFacade usuariofacade;
    @EJB
    private LineaFacade lineafacade;
    @EJB
    private ModelomovilFacade modelomovilfacade;
    
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
        
        String Codigo = request.getParameter("Codigo");
        String Modelo = request.getParameter("Modelo");
        String Usuario = request.getParameter("Usuario");
        String Linea = request.getParameter("Linea");
        String idTerminal = request.getParameter("idTerminal");
        
        Terminalmovil editado = terminalmovilfacade.find(Integer.parseInt(idTerminal));
        
        editado.setCodigo(Codigo);                 
        
        if (Modelo!="")
            editado.setModeloMovilidModeloMovil(modelomovilfacade.find(Integer.parseInt(Modelo)));        
        if(Usuario!="")
            editado.setUsuarioidUsuario(usuariofacade.find(Integer.parseInt(Usuario)));
        if(Linea!="")
            editado.setLineaidLinea(lineafacade.find(Integer.parseInt(Linea)));
        
        terminalmovilfacade.edit(editado);
        
        RequestDispatcher rd=null; 
        
        rd = this.getServletContext().getRequestDispatcher("/adminTelMovil?operacionrealizada=editado&codigousado="+Codigo);       
        rd.forward(request, response);
        
        try {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet editarTelMovil</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet editarTelMovil at " + request.getContextPath() + "</h1>");
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

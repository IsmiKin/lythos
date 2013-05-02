/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package telfijos;

import dao.LineaFacade;
import dao.ModelofijoFacade;
import dao.TerminalfijoFacade;
import dao.UsuarioFacade;
import entidades.Terminalfijo;
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
 * @author IsmiKin
 */
@WebServlet(name = "insertarTelFijo", urlPatterns = {"/telfijos/insertar"})
public class insertarTelFijo extends HttpServlet {
    @EJB
    private LineaFacade lineaFacade;
    @EJB
    private UsuarioFacade usuarioFacade;
    @EJB
    private ModelofijoFacade modelofijoFacade;
    @EJB
    private TerminalfijoFacade terminalfijoFacade;

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
        
        Terminalfijo nuevo = new Terminalfijo();
        
        nuevo.setCodigo(Codigo);                 
        
        if (Modelo!="")
            nuevo.setModeloFijoidModeloFijo(modelofijoFacade.find(Integer.parseInt(Modelo)));        
        if(Usuario!="")
            nuevo.setUsuarioidUsuario(usuarioFacade.find(Integer.parseInt(Usuario)));
        if(Linea!="")
            nuevo.setLineaidLinea(lineaFacade.find(Integer.parseInt(Linea)));
        
        terminalfijoFacade.create(nuevo);               
        
        RequestDispatcher rd=null; 
        
        rd = this.getServletContext().getRequestDispatcher("/telfijos/admin");       
        rd.forward(request, response);
        
        try {
            /* TODO output your page here. You may use following sample code. */
        
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

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package telmoviles;

import dao.ModelomovilFacade;
import dao.UsuarioFacade;
import dao.LineaFacade;
import dao.TerminalmovilFacade;
import entidades.Modelomovil;
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
@WebServlet(name = "insertarTelMovil", urlPatterns = {"/insertarTelMovil"})
public class insertarTelMovil extends HttpServlet {
    
    @EJB
    private ModelomovilFacade modelomovilfacade;
    @EJB
    private UsuarioFacade usuariofacade;
    @EJB
    private LineaFacade lineafacade;
    @EJB
    private TerminalmovilFacade terminalmovilfacade;
    
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String Codigo = request.getParameter("Codigo");
        String Modelo = request.getParameter("Modelo");
        String Usuario = request.getParameter("Usuario");
        String Linea = request.getParameter("Linea");
        
        Terminalmovil nuevo = new Terminalmovil();
        
        nuevo.setCodigo(Codigo);                 
        
        if (Modelo!="")
            nuevo.setModeloMovilidModeloMovil(modelomovilfacade.find(Integer.parseInt(Modelo)));        
        if(Usuario!="")
            nuevo.setUsuarioidUsuario(usuariofacade.find(Integer.parseInt(Usuario)));
        if(Linea!="")
            nuevo.setLineaidLinea(lineafacade.find(Integer.parseInt(Linea)));
        
        terminalmovilfacade.create(nuevo);               
        
        RequestDispatcher rd=null; 
        
        rd = this.getServletContext().getRequestDispatcher("/adminTelMovil?operacionrealizada=insertado&codigousado="+Codigo);       
        rd.forward(request, response);
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

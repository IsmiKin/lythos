/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
// Antonio Sánchez Valadez.

package modelosTelFijos;

import dao.ModelofijoFacade;
import entidades.Modelofijo;
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
 * @author ROOT
 */
@WebServlet(name = "eliminarmodelofijo", urlPatterns = {"/eliminarmodelofijo"})
public class eliminarmodelofijo extends HttpServlet {
    @EJB
    private ModelofijoFacade ModelofijoFacade;
    
     

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
         
        Modelofijo aEliminar = ModelofijoFacade.find(Integer.parseInt(request.getParameter("idAEliminar")));
        
        ModelofijoFacade.remove(aEliminar);
        
        RequestDispatcher rd=null; 
         
        rd = this.getServletContext().getRequestDispatcher("/modelosfijos?operacionrealizada=eliminado&modelousado="+aEliminar.getModelo());       
        rd.forward(request, response);
        
       
        try {
           
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

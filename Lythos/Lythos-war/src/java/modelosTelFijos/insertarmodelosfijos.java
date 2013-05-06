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
import java.text.DateFormat;
import java.sql.Date;
import java.text.ParseException;
//import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
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
@WebServlet(name = "insertarmodelosfijos", urlPatterns = {"/insertarmodelosfijos"})
public class insertarmodelosfijos extends HttpServlet {
     @EJB
    private ModelofijoFacade ModeloFijoFacade;
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
            throws ServletException, IOException, ParseException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
         Modelofijo mun = new Modelofijo();
        //Random rd = new Random();
        
        
        //Date df = Date.valueOf(request.getParameter("lanzamiento"));
         
        //Date g = new Date();
        mun.setMarca(request.getParameter("marca"));
        mun.setModelo(request.getParameter("modelo"));
        //mun.setLanzamiento(df);
        
        mun.setDetalles(request.getParameter("detalles"));
        
        ModeloFijoFacade.create(mun);
        
        RequestDispatcher rd = null; 
        
        rd = this.getServletContext().getRequestDispatcher("/modelosfijos?operacionrealizada=insertado&modelousado="+mun.getModelo());        
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
         try {
             processRequest(request, response);
         } catch (ParseException ex) {
             Logger.getLogger(insertarmodelosfijos.class.getName()).log(Level.SEVERE, null, ex);
         }
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
         try {
             processRequest(request, response);
         } catch (ParseException ex) {
             Logger.getLogger(insertarmodelosfijos.class.getName()).log(Level.SEVERE, null, ex);
         }
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

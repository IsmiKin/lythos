/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package gestionInterna;

import dao.MunicipioFacade;
import entidades.Municipio;
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
 * @author Pablo
 */
@WebServlet(name = "editarMunicipio", urlPatterns = {"/editarMunicipio"})
public class editarMunicipio extends HttpServlet {
     @EJB
    private MunicipioFacade MunicipioFacade;
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
        
        
        
        
        String nombre = request.getParameter("nombre");
        String cp = request.getParameter("cp");
        String fax = request.getParameter("fax");
        String numero = request.getParameter("numero");
        String idMunicipio = request.getParameter("idMunicipio");
        
        Municipio edit = MunicipioFacade.find(Integer.parseInt(idMunicipio));
        
        edit.setNombre(nombre);
        edit.setCp(cp);
        edit.setFax(fax);
        edit.setNumero(numero);
        
        MunicipioFacade.edit(edit);
             
        RequestDispatcher rd = null; 
        
        rd = this.getServletContext().getRequestDispatcher("/AdminMunicipios?operacionrealizada=editado&nombreusado="+nombre);        
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

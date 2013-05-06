/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package modeloTelMovil;

import dao.ModelomovilFacade;
import entidades.Modelomovil;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
 * @author kuku
 */
@WebServlet(name = "insertModelo", urlPatterns = {"/insertModelo"})
public class insertModelo extends HttpServlet {
    @EJB
    private ModelomovilFacade modelomovilFacade;

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
        
        
        //DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        
        String marca = request.getParameter("Marca");
        String modelo = request.getParameter("Modelo");
        //Date lanzamiento = df.parse(request.getParameter("Lanzamiento"));
        String detalles = request.getParameter("Detalles");
        
        Modelomovil mm = new Modelomovil();
                
        mm.setMarca(marca);
        mm.setModelo(modelo);
        mm.setDetalles(detalles);
        //mm.setLanzamiento(lanzamiento);
        
        modelomovilFacade.create(mm);
        
        RequestDispatcher rd=null;
        
        rd = this.getServletContext().getRequestDispatcher("/adminModeloTelMovil?operacionrealizada=insertado&modelousado="+modelo);        
        rd.forward(request, response);
        
        PrintWriter out = response.getWriter();
        try {
            out.println(request.getParameter("Lanzamiento"));
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
            Logger.getLogger(insertModelo.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(insertModelo.class.getName()).log(Level.SEVERE, null, ex);
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

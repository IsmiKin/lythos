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
@WebServlet(name = "editarModeloFijo", urlPatterns = {"/editarModeloFijo"})
public class editarModeloFijo extends HttpServlet {
    
     @EJB
    private ModelofijoFacade modelofijoFacade;

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
        
        String marca = request.getParameter("marca");
        String modelo = request.getParameter("modelo");
        String detalles = request.getParameter("detalles");
        
        String idModeloFijo = request.getParameter("idModeloFijo");
        
        Modelofijo edit = modelofijoFacade.find(Integer.parseInt(idModeloFijo));
        
        try{
            edit.setMarca(marca);
            edit.setModelo(modelo);
            edit.setDetalles(detalles);
        }catch(NumberFormatException e){
            throw new RuntimeException(" fallo..");
            
        };
        
        
        modelofijoFacade.edit(edit);
        
        RequestDispatcher rd = null; 
        
        rd = this.getServletContext().getRequestDispatcher("/modelosfijos?operacionrealizada=editado&modelousado="+edit.getModelo());        
        rd.forward(request, response);
        
        try {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet editarModeloFijo</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet editarModeloFijo at " + request.getContextPath() + "</h1>");
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

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package modeloTelMovil;

import dao.ModelomovilFacade;
import entidades.Modelomovil;
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
 * @author kuku
 */
@WebServlet(name = "editModelo", urlPatterns = {"/editModelo"})
public class editModelo extends HttpServlet {
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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        
        String idModelo = request.getParameter("idModeloMovil");
        String Modelo = request.getParameter("Modelo");
        String Marca = request.getParameter("Marca");
        String Detalles = request.getParameter("Detalles");
        //Date lanzamiento = df.parse(request.getParameter("Lanzamiento"));
        
        Modelomovil modeloEditar = modelomovilFacade.find(Integer.parseInt(idModelo));
        
        modeloEditar.setDetalles(Detalles);
        modeloEditar.setMarca(Marca);
        //modeloEditar.setLanzamiento(null);
        modeloEditar.setModelo(Modelo);
        
        modelomovilFacade.edit(modeloEditar);
        
        RequestDispatcher rd=null;
        
        rd = this.getServletContext().getRequestDispatcher("/adminModeloTelMovil?operacionrealizada=editado&modelousado="+Modelo);        
        rd.forward(request, response);
        
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet editModelo</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet editModelo at " + request.getContextPath() + "</h1>");
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

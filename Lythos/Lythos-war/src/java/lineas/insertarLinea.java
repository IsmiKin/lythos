/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package lineas;

import dao.LineaFacade;
import dao.TarifaFacade;
import entidades.Linea;
import entidades.Tarifa;
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
@WebServlet(name = "insertarLinea", urlPatterns = {"/insertarLinea"})
public class insertarLinea extends HttpServlet {

    
    @EJB
    private TarifaFacade tarifaFacade;
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
        
        
        String Numero = request.getParameter("Numero");
        String Tipo = request.getParameter("Tipo");
        String VoIP = request.getParameter("VoIP");
        String Pais = request.getParameter("Pais");
        String Tarifa = request.getParameter("Tarifa");
        
        
        Linea nuevo = new Linea();
        
        nuevo.setNumero(Numero);
        nuevo.setTipo(Tipo);
        nuevo.setVoIP(VoIP);
        nuevo.setPais(Pais);
      
        
        if (Tarifa!="")
            nuevo.setTarifaidTarifa(tarifaFacade.find(Integer.parseInt(Tarifa)));        
        
        
        lineafacade.create(nuevo);               
        
        RequestDispatcher rd=null; 
        
        rd = this.getServletContext().getRequestDispatcher("/adminLineas?operacionrealizada=insertado&numerousado="+Numero);       
        rd.forward(request, response);
        
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet insertarLinea</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet insertarLinea at " + request.getContextPath() + "</h1>");
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

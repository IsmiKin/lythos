/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package gestionInterna;


import dao.MunicipioFacade;
import entidades.Municipio;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
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
 * @author Pablo
 */
@WebServlet(name = "formMunicipios", urlPatterns = {"/formMunicipios"})
public class formMunicipios extends HttpServlet {
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
       /*
        Municipio mun = new Municipio();
        mun.setNombre(request.getParameter("nombre"));
        mun.setCp(request.getParameter("cp"));
        mun.setFax(request.getParameter("fax"));
        mun.setNumero(request.getParameter("numero"));
        */ 
        RequestDispatcher rd = null; 
        
        rd = this.getServletContext().getRequestDispatcher("/insertarMunicipio.jsp");        
        rd.forward(request, response);
       
        
        try {
           
        } finally {            
            out.close();
        }
    }
  /*  
    public void doPost(HttpServletRequest req, 
  HttpServletResponse res) throws ServletException,
  IOException{
 
        
        
   String connectionURL = "jdbc:mysql://localhost:3306/mysql?zeroDateTimeBehavior=convertToNull [root on Default schema]";
  Connection connection=null;
  ResultSet rs;
  res.setContentType("insertarMunicipio.jsp");
  PrintWriter out = res.getWriter();
  //get the variables entered in the form
  String nombre = req.getParameter("nombre");
  String cp = req.getParameter("cp");
  String fax = req.getParameter("fax");
  String numero = req.getParameter("numero");
  
  try {
  // Load the database driver
  Class.forName("org.gjt.mm.mysql.Driver");
  // Get a Connection to the database
  connection = DriverManager.getConnection
  (connectionURL, "root", "admin"); 
  //Add the data into the database
  String sql = 
  "insert into Municipio values (nombre,cp,fax,numero)";
  PreparedStatement pst = 
  connection.prepareStatement(sql);
  pst.setString(1, nombre);
  pst.setString(2, cp);
  pst.setString(3, fax);
  pst.setString(4, numero);
  
  int numRowsChanged = pst.executeUpdate();
 
 

  try {
  if (connection != null) connection.close();
  }
  catch (SQLException ignored){
  out.println(ignored);
  }
  }     catch (SQLException ex) {
            Logger.getLogger(formMunicipios.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(formMunicipios.class.getName()).log(Level.SEVERE, null, ex);
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

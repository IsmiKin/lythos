/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package usuarios;

import dao.GruporescateFacade;
import dao.MunicipioFacade;
import dao.UsuarioFacade;
import entidades.Usuario;
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
@WebServlet(name = "insertarUsuario", urlPatterns = {"/insertarUsuario"})
public class insertarUsuario extends HttpServlet {

    @EJB
    private UsuarioFacade usuariofacade;
    @EJB
    private MunicipioFacade municipiofacade;
    @EJB
    private GruporescateFacade grupofacade;
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
        
        String Nombre = request.getParameter("Nombre");
        String Apellidos = request.getParameter("Apellidos");
        String Rol = request.getParameter("Rol");
        String Sexo = request.getParameter("Sexo");
        String DNI = request.getParameter("DNI");
        String Direccion = request.getParameter("Direccion");
        String Email = request.getParameter("Email");
        String Cargo = request.getParameter("Cargo");
        
        String Municipio = request.getParameter("Municipio");
        String Grupo = request.getParameter("Grupo");
        
        Usuario nuevo = new Usuario();
        
        nuevo.setNombre(Nombre);
        nuevo.setApellidos(Apellidos);
        nuevo.setRol(Rol);
        nuevo.setSexo(Sexo);
        nuevo.setDni(DNI);
        nuevo.setDireccion(Direccion);
        nuevo.setEmail(Email);
        nuevo.setCargo(Cargo);
        
        
        if (Municipio!="")
            nuevo.setMunicipioidMunicipio(municipiofacade.find(Integer.parseInt(Municipio))); 
        if (Grupo!="")
            nuevo.setGrupoRescateidGrupoRescate(grupofacade.find(Integer.parseInt(Grupo))); 
        
        
        
        usuariofacade.create(nuevo);               
        
        RequestDispatcher rd=null; 
        
        rd = this.getServletContext().getRequestDispatcher("/adminUsuario?operacionrealizada=insertado&nombreusado="+Nombre);       
        rd.forward(request, response);
        
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet insertarUsuario</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet insertarUsuario at " + request.getContextPath() + "</h1>");
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

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package api;

import dao.AutorizacionFacade;
import dao.UsuarioFacade;
import entidades.Autorizacion;
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
import javax.servlet.http.HttpSession;

/**
 *
 * @author IsmiKinPorti
 */
@WebServlet(name = "login", urlPatterns = {"/login"})
public class login extends HttpServlet {        
    @EJB
    private UsuarioFacade usuarioFacade;
    @EJB
    private AutorizacionFacade autFac;

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
        
        String nickname = request.getParameter("nickname");
        String pass = request.getParameter("pass");        
        
        boolean existe = autFac.checkUsername(nickname, pass);
        
         String pagina ;
        
        if(existe){
            
            /*int idAut = autFac.getIdByNickname(nickname);
            Autorizacion autUser = autFac.find(idAut);*/
            HttpSession session = request.getSession(true);           
            int idAutori = autFac.getIdByNickname(nickname);
            Autorizacion autori = autFac.find(idAutori);
            Usuario usuario = usuarioFacade.getUserByAuto(autori);
            session.setAttribute("nickname", nickname);
            session.setAttribute("nombre",usuario.getNombre() );
            session.setAttribute("rol",usuario.getRol()); 
            if("Administrador".equals(usuario.getRol()))
                session.setAttribute("rolNumber",0);
            else if("Controlador".equals(usuario.getRol()))
                session.setAttribute("rolNumber",1);
            else if("JefeServicio".equals(usuario.getRol()))
                session.setAttribute("rolNumber",2);
            else if("Usuario".equals(usuario.getRol()))
                session.setAttribute("rolNumber",3);
           else
                session.setAttribute("rolNumber",4);
            
            pagina = "/home.jsp";
        }
        else
                pagina ="/errorLogin.jsp";
        
        
        RequestDispatcher rd = null;
                             
        request.setAttribute("nickname", nickname);
        
        rd = this.getServletContext().getRequestDispatcher(pagina);        
        rd.forward(request, response);
        
        try {
            /* TODO output your page here. You may use following sample code. */
            
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

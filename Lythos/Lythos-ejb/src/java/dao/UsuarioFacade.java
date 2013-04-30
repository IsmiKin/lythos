/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entidades.Autorizacion;
import entidades.Usuario;
import java.util.List;
import javax.ejb.EJB;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author IsmiKinPorti
 */
@Stateless
public class UsuarioFacade extends AbstractFacade<Usuario> {
    @EJB
    private AutorizacionFacade autFac;
    @PersistenceContext(unitName = "Lythos-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public UsuarioFacade() {
        super(Usuario.class);
    }
    
    public String getUserByNickname(String nickname){
        int idUser=  autFac.getIdByNickname(nickname);
        Query consulta = em.createQuery("SELECT u FROM Usuario u WHERE u.autorizacionidAutorizacion = :idUser ").setParameter("idUser", idUser);
        List<Usuario> resultados = consulta.getResultList();
        String salida = null;
        if(resultados.size()>0)
            salida = resultados.get(0).toString();
        return "";
        //return Integer.parseInt(salida);
        //int idUser = 
        
    }
    
}

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entidades.Autorizacion;
import entidades.Terminalfijo;
import entidades.Usuario;
import java.util.Iterator;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author IsmiKinPorti
 */
@Stateless
public class TerminalfijoFacade extends AbstractFacade<Terminalfijo> {
    @PersistenceContext(unitName = "Lythos-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public TerminalfijoFacade() {
        super(Terminalfijo.class);
    }
    
    public boolean existeCodigo(String Codigo){
        Query consulta = em.createQuery("SELECT t FROM Terminalfijo t WHERE  t.codigo = :Codigo").setParameter("Codigo", Codigo);
        List<Terminalfijo> resultados = consulta.getResultList();
        
         return resultados.size()>0;
            
    }
    
    public List<Terminalfijo> getByUsuario(Usuario usuario){
        Query consulta = em.createQuery("SELECT t FROM Terminalfijo t WHERE  t.usuarioidUsuario = :Usuario").setParameter("Usuario", usuario);
        List<Terminalfijo> resultados = consulta.getResultList();
                 
        return resultados;
    }
    
}

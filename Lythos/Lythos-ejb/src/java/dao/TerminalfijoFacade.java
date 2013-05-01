/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entidades.Terminalfijo;
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
    
    public List<Terminalfijo> findAllFull(){
        
        List<Terminalfijo> todos = this.findAll();
        
       // Query consulta = em.createQuery("SELECT a FROM Autorizacion a WHERE a.nickname = :Nickname AND a.password = :Pass").setParameter("Nickname", nickname).setParameter("Pass", pass);
        //SELECT s from Computers s where s.id.column1 = :column1").setParameter("column1", "SONY LAPTOPS");
     //   int checking = consulta.getResultList().size();     // Comprobamos si concuerda password y nickname, si es 0 es que casca
    
        
        /*
        for (Iterator iter = todos.iterator(); iter.hasNext();) {
	  Terminalfijo element = (Terminalfijo) iter.next();
                    element.setLineaidLinea(null);
        }*/
        return null;        
    }
    
}

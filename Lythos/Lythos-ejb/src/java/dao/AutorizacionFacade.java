/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entidades.Autorizacion;
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
public class AutorizacionFacade extends AbstractFacade<Autorizacion> {
    @PersistenceContext(unitName = "Lythos-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public AutorizacionFacade() {
        super(Autorizacion.class);
    }
   
    public boolean checkUsername(String nickname, String pass){
        Query consulta = em.createQuery("SELECT a FROM Autorizacion a WHERE a.nickname = :Nickname AND a.password = :Pass").setParameter("Nickname", nickname).setParameter("Pass", pass);
        //SELECT s from Computers s where s.id.column1 = :column1").setParameter("column1", "SONY LAPTOPS");
        int checking = consulta.getResultList().size();     // Comprobamos si concuerda password y nickname, si es 0 es que casca
        return checking==1;
    }
    
}

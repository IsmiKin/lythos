/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entidades.Tarifa;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author IsmiKinPorti
 */
@Stateless
public class TarifaFacade extends AbstractFacade<Tarifa> {
    @PersistenceContext(unitName = "Lythos-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public TarifaFacade() {
        super(Tarifa.class);
    }
    
}

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entidades.Municipio;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author IsmiKinPorti
 */
@Stateless
public class MunicipioFacade extends AbstractFacade<Municipio> {
    @PersistenceContext(unitName = "Lythos-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public MunicipioFacade() {
        super(Municipio.class);
    }
    
    public Municipio getById(int idMunicipio){
        Query queryAuto= em.createNamedQuery("Municipio.findByIdMunicipio");
        queryAuto.setParameter("idMunicipio", idMunicipio);
        
        Municipio salida =(Municipio) queryAuto.getSingleResult();
        return salida;
    }
    
}

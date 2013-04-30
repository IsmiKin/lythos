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
    
    public String getNicknameById(int idAut){
        Query consulta = em.createQuery("SELECT a.nickname FROM Autorizacion a WHERE a.idAutorizacion = :idAut ").setParameter("idAut", idAut);
        List<Autorizacion> resultados = consulta.getResultList();
        String salida = null;
        if(resultados.size()>0)
            salida = resultados.get(0).toString();
        return salida;
    }
    
    public int getIdByNickname(String nickname){
        Query consulta = em.createQuery("SELECT a.idAutorizacion FROM Autorizacion a WHERE a.nickname = :nickname ").setParameter("nickname", nickname);
        List<Autorizacion> resultados = consulta.getResultList();
        String salida = null;
        if(resultados.size()>0)
            salida = resultados.get(0).toString();
        return Integer.parseInt(salida);
    }
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejb;

import entity.Staff;
import entity.TicketType;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author Sunny
 */
@Stateless
public class ArtistEJB {

    @PersistenceContext(unitName = "ArtMuseumPU")
    private EntityManager em;

    public void persist(Object object) {
        em.persist(object);
    }

    public void remove(Object object) {
        if (!em.contains(object)) {
            object = em.merge(object);
        }
        em.remove(object);
    }

    public void modify(Object object) {
//        TicketType ticket = em.find(TicketType.class, "A");
//        em.getTransaction().begin();
//        ticket.setPrice(01);
//        em.getTransaction().commit();
//       if (em.contains(object)) {
//            object = em.merge(object);
//        }
//        em.refresh(object);
    }

    public List<Staff> findAllStaff() {
        return em.createNamedQuery("Staff.findAll", Staff.class).getResultList();
    }

    public List<TicketType> findAllTicket() {
        return em.createNamedQuery("TicketType.findAll", TicketType.class).getResultList();
    }

    public TicketType getTicket(String type) {
        return em.createNamedQuery("TicketType.findByType", TicketType.class)
                .setParameter("type", type)
                .getSingleResult();
    }
    public void updatePrice(){
       Query q = em.createQuery("UPDATE TicketType SET price = 10");
       q.executeUpdate();
    }
    public List<TicketType> updatePrice(String type) {
        return em.createNamedQuery("TicketType.Update", TicketType.class)
        //        .setParameter("type", type)
                .getResultList();
    }

}

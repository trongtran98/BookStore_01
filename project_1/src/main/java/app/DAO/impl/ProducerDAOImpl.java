package app.DAO.impl;

import app.DAO.GenericDAO;
import app.DAO.ProducerDAO;
import app.model.Producer;
import org.hibernate.LockMode;

import javax.persistence.criteria.CriteriaBuilder;
import java.util.List;

public class ProducerDAOImpl extends GenericDAO<Integer, Producer> implements ProducerDAO {
    @Override
    public List<Producer> findProducers() {
        return getSession().createQuery("FROM Producer ").getResultList();
    }

    @Override
    public Long sumProductThemProducer(String producer) {
        return getSession().createQuery("SELECT COUNT(pB.id) FROM Producer p " +
                "JOIN p.books pB  WHERE p.producerName = :name", Long.class)
                .setParameter("name", producer).uniqueResult();
    }

    @Override
    public Producer findProducerById(Integer id, boolean lock) {
        if (lock == false)
            return (Producer) getSession().createQuery("FROM Producer WHERE id = :id")
                    .setParameter("id", id).getSingleResult();

        return getSession().load(Producer.class, id, LockMode.PESSIMISTIC_WRITE);

    }
}

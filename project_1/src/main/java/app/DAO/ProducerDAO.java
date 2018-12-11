package app.DAO;

import app.model.Producer;

import java.util.List;

public interface ProducerDAO extends BaseDAO<Integer, Producer> {
    List<Producer> findProducers();

    Producer findProducerById(Integer id, boolean lock);

    Long sumProductThemProducer(String producer);
}

package app.service.impl;

import app.model.Producer;
import app.service.ProducerService;

import java.io.Serializable;
import java.util.List;

public class ProducerServiceImpl extends BaseServiceImpl implements ProducerService {
    @Override
    public List<Producer> findProducers() {
        return producerDAO.findProducers();
    }

    @Override
    public Producer saveOrUpdate(Producer entity) {
        try {
            return producerDAO.saveOrUpdate(entity);
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public Producer findById(Serializable key) {
        return producerDAO.findById(key);
    }
    public Producer findById(Integer key) {
        return producerDAO.findById(key);
    }

    @Override
    public boolean delete(Integer id) {
        try {
            Producer producer = producerDAO.findProducerById(id, true);
            if (producer == null) {
                return false;
            }
            producerDAO.delete(producer);
            return true;
        } catch (Exception e) {
            throw e;
        }
    }
}

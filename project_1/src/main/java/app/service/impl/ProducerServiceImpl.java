package app.service.impl;

import app.model.Producer;
import app.service.ProducerService;

import java.io.Serializable;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class ProducerServiceImpl extends BaseServiceImpl implements ProducerService {
    @Override
    public Map<String, Long> totalProductOfEachProducer() {
        try {
            List<Producer> producers = producerDAO.findProducers();
            if (producers == null)
                return Collections.emptyMap();

            Map<String, Long> map = new LinkedHashMap<>();
            for (Producer producer : producers) {
                map.put(producer.getProducerName(),
                        producerDAO.sumProductThemProducer(producer.getProducerName()) == null ?
                                0l : producerDAO.sumProductThemProducer(producer.getProducerName()));
            }
            return map;

        } catch (Exception e) {
            return Collections.emptyMap();
        }
    }

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

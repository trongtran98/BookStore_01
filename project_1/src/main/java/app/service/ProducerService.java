package app.service;

import app.model.Producer;

import java.util.List;

public interface ProducerService extends BaseService<Integer, Producer> {
    List<Producer> findProducers();
}

package app.service;

import app.model.Producer;

import javax.persistence.criteria.CriteriaBuilder;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public interface ProducerService extends BaseService<Integer, Producer> {
    List<Producer> findProducers();
    Map<String, Long> totalProductOfEachProducer();
}

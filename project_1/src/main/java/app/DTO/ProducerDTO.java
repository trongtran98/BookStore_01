package app.DTO;

import app.model.Producer;

public class ProducerDTO {
    private Integer id;
    private String producerName;
    private String address;
    private String description;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getProducerName() {
        return producerName;
    }

    public void setProducerName(String producerName) {
        this.producerName = producerName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public ProducerDTO() {
    }

    public ProducerDTO(Producer producer) {
        this.id = producer.getId();
        this.producerName = producer.getProducerName();
        this.address = producer.getAddress();
        this.description = producer.getDescription();
    }
}

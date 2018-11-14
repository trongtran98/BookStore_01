package app.DTO;

import app.model.Book;
import org.springframework.web.multipart.MultipartFile;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;

public class BookDTO implements Serializable {

    private Integer id;
    private String title;
    private String description;
    private Integer pages;
    private BigDecimal price;
    private Integer available;
    private Boolean status;
    private Integer author;
    private Integer categoryDetail;
    private Integer producer;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getPages() {
        return pages;
    }

    public void setPages(Integer pages) {
        this.pages = pages;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public Integer getAvailable() {
        return available;
    }

    public void setAvailable(Integer available) {
        this.available = available;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    public Integer getAuthor() {
        return author;
    }

    public void setAuthor(Integer author) {
        this.author = author;
    }

    public Integer getCategoryDetail() {
        return categoryDetail;
    }

    public void setCategoryDetail(Integer categoryDetail) {
        this.categoryDetail = categoryDetail;
    }

    public Integer getProducer() {
        return producer;
    }

    public void setProducer(Integer producer) {
        this.producer = producer;
    }

    public BookDTO() {

    }

    public BookDTO(Book book) {
        this.id = book.getId();
        this.title = book.getTitle();
        this.description = book.getDescription();
        this.pages = book.getPages();
        this.price = book.getPrice();
        this.available = book.getAvailable();
        this.status = book.getStatus();
    }
}

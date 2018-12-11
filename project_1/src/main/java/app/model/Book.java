package app.model;

import app.DTO.BookDTO;

import java.math.BigDecimal;
import java.util.List;

public class Book {

    private Integer id;
    private String title;
    private String description;
    private String avatar;
    private Integer pages;
    private BigDecimal price;
    private Integer available;
    private Boolean status;
    private Author author;
    private CategoryDetail categoryDetail;
    private Producer producer;
    private List<Review> reviews;
    private List<OrderDetail> orderDetails;

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

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
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

    public Author getAuthor() {
        return author;
    }

    public void setAuthor(Author author) {
        this.author = author;
    }

    public Producer getProducer() {
        return producer;
    }

    public void setProducer(Producer producer) {
        this.producer = producer;
    }

    public List<Review> getReviews() {
        return reviews;
    }

    public void setReviews(List<Review> reviews) {
        this.reviews = reviews;
    }

    public CategoryDetail getCategoryDetail() {
        return categoryDetail;
    }

    public void setCategoryDetail(CategoryDetail categoryDetail) {
        this.categoryDetail = categoryDetail;
    }


    public List<OrderDetail> getOrderDetails() {
        return orderDetails;
    }

    public void setOrderDetails(List<OrderDetail> orderDetails) {
        this.orderDetails = orderDetails;
    }

    public Book() {
    }

    public Book(BookDTO bookDTO, String image, Author author, Producer producer , CategoryDetail categoryDetail ) {
        this.id = bookDTO.getId();
        this.title = bookDTO.getTitle();
        this.description = bookDTO.getDescription();
        this.avatar = image;
        this.pages = bookDTO.getPages();
        this.price = bookDTO.getPrice();
        this.available = bookDTO.getAvailable();
        this.status = bookDTO.getStatus();
        this.author = author;
        this.producer = producer;
        this.categoryDetail = categoryDetail;
    }
}

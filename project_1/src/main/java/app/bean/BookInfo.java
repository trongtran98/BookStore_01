package app.bean;

import app.model.*;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;

public class BookInfo implements Serializable {
    private static final long serialVersionUID = 5974438385263559928L;

    private Integer id;
    private String title;
    private String description;
    private String avatar;
    private Integer pages;
    private BigDecimal price;
    private String author;
    private String categoryDetail;
    private String producer;

    public BookInfo(Integer id, String title, String description, String avatar, Integer pages, BigDecimal price, String author, String categoryDetail, String producer) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.avatar = avatar;
        this.pages = pages;
        this.price = price;
        this.author = author;
        this.categoryDetail = categoryDetail;
        this.producer = producer;
    }

    public BookInfo() {
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public void setCategoryDetail(String categoryDetail) {
        this.categoryDetail = categoryDetail;
    }

    public void setProducer(String producer) {
        this.producer = producer;
    }

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

    public String getAuthor() {
        return author;
    }

    public String getCategoryDetail() {
        return categoryDetail;
    }

    public String getProducer() {
        return producer;
    }

    public BookInfo(Book book) {
        this.id = book.getId();
        this.title = book.getTitle();
        this.description = book.getDescription();
        this.avatar = book.getAvatar();
        this.pages = book.getPages();
        this.price = book.getPrice();
        this.author = book.getAuthor().getFullName();
        this.categoryDetail = book.getCategoryDetail().getCategoryDetailName();
        this.producer = book.getProducer().getProducerName();
    }


}

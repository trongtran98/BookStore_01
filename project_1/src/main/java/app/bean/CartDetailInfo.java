package app.bean;

import app.model.CartDetail;

import java.math.BigDecimal;

public class CartDetailInfo {
    private Integer id;
    private BigDecimal price;
    private Integer amount;
    private BookInfo book;

    public Integer getId() {
        return id;
    }

    public CartDetailInfo() {
    }

    public CartDetailInfo(CartDetail cartDetail) {
        this.id = cartDetail.getId();
        this.price = cartDetail.getPrice();
        this.amount = cartDetail.getAmount();
        this.book = new BookInfo(cartDetail.getBook());
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public Integer getAmount() {
        return amount;
    }

    public void setAmount(Integer amount) {
        this.amount = amount;
    }

    public BookInfo getBook() {
        return book;
    }

    public void setBook(BookInfo book) {
        this.book = book;
    }
}

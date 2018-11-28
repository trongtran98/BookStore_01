package app.model;

import java.math.BigDecimal;
import java.util.List;

public class OrderDetail implements java.io.Serializable {
	private Integer id;
	private BigDecimal price;
	private Integer amount;

	private Book book;
	private Order order;

	public OrderDetail() {
	}

    public OrderDetail(CartDetail cartDetail) {
		this.price = cartDetail.getPrice();
		this.amount = cartDetail.getAmount();
		this.book = cartDetail.getBook();
    }

    public Integer getId() {
		return id;
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

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}
}

package app.model;

import app.DTO.AddressDTO;

public class Address implements java.io.Serializable {
	private Integer id;
	private String address;
	private User user;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Address() {
	}
	public Address(AddressDTO addressDTO) {
		this.id = addressDTO.getId();
		this.address = addressDTO.getAddress();
	}

}

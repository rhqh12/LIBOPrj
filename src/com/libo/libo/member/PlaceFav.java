package com.libo.libo.member;

public class PlaceFav {

	private int id;
	private String writerId;
	private String location;
	private String address;
	private String dueDate;

	public PlaceFav(int id, String writerId, String location, String address, String dueDate) {
		this.id = id;
		this.writerId = writerId;
		this.location = location;
		this.address = address;
		this.dueDate = dueDate;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getWriterId() {
		return writerId;
	}

	public void setWriterId(String writerId) {
		this.writerId = writerId;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDueDate() {
		return dueDate;
	}

	public void setDueDate(String dueDate) {
		this.dueDate = dueDate;
	}

	@Override
	public String toString() {
		return "PlaceFav [id=" + id + ", writerId=" + writerId + ", location=" + location + ", address=" + address
				+ ", dueDate=" + dueDate + "]";
	}

}

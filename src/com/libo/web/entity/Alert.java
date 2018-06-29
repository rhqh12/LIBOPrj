package com.libo.web.entity;

public class Alert {
	private int id;
	private String week;
	private String time;
	private String specificDate;
	private String dueDate;
	private String writerId;
	
	public Alert() {
		
	}
	
	//select
	public Alert(String week, String time, String specificDate, String dueDate, String writerId) {
		super();
		this.week = week;
		this.time = time;
		this.specificDate = specificDate;
		this.dueDate = dueDate;
		this.writerId = writerId;
	}
	
	//insert
	public Alert(int id, String week, String time, String specificDate, String dueDate, String writerId) {
		super();
		this.id = id;
		this.week = week;
		this.time = time;
		this.specificDate = specificDate;
		this.dueDate = dueDate;
		this.writerId = writerId;
	}
	
	

	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}

	public String getWeek() {
		return week;
	}

	public void setWeek(String week) {
		this.week = week;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getSpecificDate() {
		return specificDate;
	}

	public void setSpecificDate(String specificDate) {
		this.specificDate = specificDate;
	}

	public String getDueDate() {
		return dueDate;
	}

	public void setDueDate(String dueDate) {
		this.dueDate = dueDate;
	}

	public String getWriterId() {
		return writerId;
	}

	public void setWriterId(String writerId) {
		this.writerId = writerId;
	}

	@Override
	public String toString() {
		return "Alert [id=" + id + ", week=" + week + ", time=" + time + ", specificDate=" + specificDate
				+ ", dueDate=" + dueDate + ", writerId=" + writerId + "]";
	}
}

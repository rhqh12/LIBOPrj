package com.libo.libo.member;

public class Alert {
	private int id;
	private String week;
	private String time;
	private String specific_date;
	private String due_date;
	private String writer_id;
	
	public Alert() {
		
	}

	public Alert(String week, String time, String specific_date, String due_date, String writer_id) {
		super();
		this.week = week;
		this.time = time;
		this.specific_date = specific_date;
		this.due_date = due_date;
		this.writer_id = writer_id;
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

	public String getSpecific_date() {
		return specific_date;
	}

	public void setSpecific_date(String specific_date) {
		this.specific_date = specific_date;
	}

	public String getDue_date() {
		return due_date;
	}

	public void setDue_date(String due_date) {
		this.due_date = due_date;
	}

	public String getWriter_id() {
		return writer_id;
	}

	public void setWriter_id(String writer_id) {
		this.writer_id = writer_id;
	}

	@Override
	public String toString() {
		return "Alert [id=" + id + ", week=" + week + ", time=" + time + ", specific_date=" + specific_date
				+ ", due_date=" + due_date + ", writer_id=" + writer_id + "]";
	}
}

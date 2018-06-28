package com.libo.web.member;

public class Notice {

	private int id;
	private String subject;
	private String constant;
	private String writerId;
	private String duteDate;
	
	public Notice() {
	}

	public Notice(int id, String subject, String constant, String writerId, String duteDate) {
		this.id = id;
		this.subject = subject;
		this.constant = constant;
		this.writerId = writerId;
		this.duteDate = duteDate;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getConstant() {
		return constant;
	}

	public void setConstant(String constant) {
		this.constant = constant;
	}

	public String getWriterId() {
		return writerId;
	}

	public void setWriterID(String writerId) {
		this.writerId = writerId;
	}

	public String getDuteDate() {
		return duteDate;
	}

	public void getDuteDate(String duteDate) {
		this.duteDate = duteDate;
	}

	@Override
	public String toString() {
		return "Notice [id=" + id + ", subject=" + subject + ", constant=" + constant + ", writerId=" + writerId
				+ ", duteDate=" + duteDate + "]";
	}
}

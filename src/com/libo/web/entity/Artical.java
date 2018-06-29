package com.libo.web.entity;

public class Artical {
	int id;
	String subject;
	String link;
	int clicks;
	int keywordId;

	
	
	
	public Artical(int id, String subject, String link, int clicks, int keywordId) {
		super();
		this.id = id;
		this.subject = subject;
		this.link = link;
		this.clicks = clicks;
		this.keywordId = keywordId;
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
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public int getClicks() {
		return clicks;
	}
	public void setClicks(int clicks) {
		this.clicks = clicks;
	}
	public int getKeywordId() {
		return keywordId;
	}
	public void setKeywordId(int keywordId) {
		this.keywordId = keywordId;
	}

	@Override
	public String toString() {
		return "Artical [id=" + id + ", subject=" + subject + ", link=" + link + ", clicks=" + clicks + ", keywordId="
				+ keywordId + "]";
	}
	
}

package com.libo.web.entity;

public class Interset {

	private int id;
	private int articalId;
	private String writerId;
	private int clicks;

	public Interset() {
	}

	public Interset(int id, int articalId, String writerId, int clicks) {
		this.id = id;
		this.articalId = articalId;
		this.writerId = writerId;
		this.clicks = clicks;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getArticalId() {
		return articalId;
	}

	public void setArticalId(int articalId) {
		this.articalId = articalId;
	}

	public String getWriterId() {
		return writerId;
	}

	public void setWriterId(String writerId) {
		this.writerId = writerId;
	}

	public int getClicks() {
		return clicks;
	}

	public void setClicks(int clicks) {
		this.clicks = clicks;
	}

	@Override
	public String toString() {
		return "Interset [id=" + id + ", articalId=" + articalId + ", writerId=" + writerId + ", clicks=" + clicks
				+ "]";
	}

}

package com.libo.libo.member;

public class Course {

	private int id;
	private String startingTime;
	private String startingAlarm;
	private String workplace;
	private String workplaceAddress;
	private String endingTime;
	private String endingAlarm;
	private String home;
	private String homeAddress;
	private String week;
	private String writerId;
	private String dueDate;

	public Course() {
	}

	public Course(int id, String startingTime, String startingAlarm, String workplace, String workplaceAddress,
			String endingTime, String endingAlarm, String home, String homeAddress, String week, String writerId,
			String dueDate) {
		this.id = id;
		this.startingTime = startingTime;
		this.startingAlarm = startingAlarm;
		this.workplace = workplace;
		this.workplaceAddress = workplaceAddress;
		this.endingTime = endingTime;
		this.endingAlarm = endingAlarm;
		this.home = home;
		this.homeAddress = homeAddress;
		this.week = week;
		this.writerId = writerId;
		this.dueDate = dueDate;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getStartingTime() {
		return startingTime;
	}

	public void setStartingTime(String startingTime) {
		this.startingTime = startingTime;
	}

	public String getStartingAlarm() {
		return startingAlarm;
	}

	public void setStartingAlarm(String startingAlarm) {
		this.startingAlarm = startingAlarm;
	}

	public String getWorkplace() {
		return workplace;
	}

	public void setWorkplace(String workplace) {
		this.workplace = workplace;
	}

	public String getWorkplaceAddress() {
		return workplaceAddress;
	}

	public void setWorkplaceAddress(String workplaceAddress) {
		this.workplaceAddress = workplaceAddress;
	}

	public String getEndingTime() {
		return endingTime;
	}

	public void setEndingTime(String endingTime) {
		this.endingTime = endingTime;
	}

	public String getEndingAlarm() {
		return endingAlarm;
	}

	public void setEndingAlarm(String endingAlarm) {
		this.endingAlarm = endingAlarm;
	}

	public String getHome() {
		return home;
	}

	public void setHome(String home) {
		this.home = home;
	}

	public String getHomeAddress() {
		return homeAddress;
	}

	public void setHomeAddress(String homeAddress) {
		this.homeAddress = homeAddress;
	}

	public String getWeek() {
		return week;
	}

	public void setWeek(String week) {
		this.week = week;
	}

	public String getWriterId() {
		return writerId;
	}

	public void setWriterId(String writerId) {
		this.writerId = writerId;
	}

	public String getDueDate() {
		return dueDate;
	}

	public void setDueDate(String dueDate) {
		this.dueDate = dueDate;
	}

	@Override
	public String toString() {
		return "Course [id=" + id + ", startingTime=" + startingTime + ", startingAlarm=" + startingAlarm
				+ ", workplace=" + workplace + ", workplaceAddress=" + workplaceAddress + ", endingTime=" + endingTime
				+ ", endingAlarm=" + endingAlarm + ", home=" + home + ", homeAddress=" + homeAddress + ", week=" + week
				+ ", writerId=" + writerId + ", dueDate=" + dueDate + "]";
	}

}

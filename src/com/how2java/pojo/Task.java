package com.how2java.pojo;

import java.util.Date;

public class Task {
//	id
//	name
//	desc
//	index
//	status complete,delete,planned
//	imem	1 2 3 4
//
//	json-> 
	
	
	private int id;
	private String name;
	private String desc;
	private int index;
	private String status;
	private int quadrant;
    private Date date;

	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	private String uuid;
	
	
	public int getId() {
		return id;
	}
	public int getQuadrant() {
		return quadrant;
	}
	public void setQuadrant(int quadrant) {
		this.quadrant = quadrant;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	public int getIndex() {
		return index;
	}
	public void setIndex(int index) {
		this.index = index;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getUuid() {
		return uuid;
	}
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	@Override
	public String toString() {
		return "Task [id=" + id + ", name=" + name + ", desc=" + desc + ", index=" + index + ", status=" + status
				+ ", quadrant=" + quadrant + ", uuid=" + uuid + "]";
	}
	

	
	
}

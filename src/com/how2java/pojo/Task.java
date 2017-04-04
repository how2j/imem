package com.how2java.pojo;

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
	private int status;
	private int quadrant;
	
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
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}

	
}

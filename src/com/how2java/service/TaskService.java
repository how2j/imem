package com.how2java.service;

import java.util.List;

import com.how2java.pojo.Task;

public interface TaskService {
	
	public List<Task> list();
	public void add(Task t);
	public Task get(int id);
	public void update(Task t);
	public void delete(Task t);
	public List<Task> sync(List<Task> tasks);
}

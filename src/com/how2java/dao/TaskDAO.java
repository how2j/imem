package com.how2java.dao;

import java.util.List;

import com.how2java.pojo.Task;
public interface TaskDAO {
	
	public List<Task> list();
	public void add(Task t);
	public Task get(int id);
	public void update(Task t);
	public void delete(Task t);	
}

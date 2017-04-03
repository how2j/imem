package com.how2java.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate3.HibernateTemplate;

import com.how2java.dao.TaskDAO;
import com.how2java.pojo.Task;

public class TaskDAOImpl extends HibernateTemplate implements TaskDAO{
	
	public List<Task> list() {
		return find("from Task");
	}

	@Override
	public void add(Task t) {
		save(t);
	}

	@Override
	public Task get(int id) {
		return (Task)get(Task.class,id);
	}

	@Override
	public void update(Task t) {
		super.update(t);
		
	}

	@Override
	public void delete(Task t) {
		super.delete(t);
	}
	
}

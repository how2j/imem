package com.how2java.service.impl;

import java.util.List;

import com.how2java.dao.TaskDAO;
import com.how2java.pojo.Task;
import com.how2java.service.TaskService;

public class TaskServiceImpl implements TaskService {

	TaskDAO TaskDAO;

	public List<Task> list() {
		List<Task> Tasks= TaskDAO.list();
		if(Tasks.isEmpty()){
			for (int i = 0; i < 5; i++) {
				Task t = new Task();
				t.setName("Task " + i);
				TaskDAO.add(t);
				Tasks.add(t);
			}
		}
		return Tasks;
	}

	public TaskDAO getTaskDAO() {
		return TaskDAO;
	}

	public void setTaskDAO(TaskDAO taskDAO) {
		this.TaskDAO = taskDAO;
	}

	@Override
	public void add(Task t) {
		TaskDAO.add(t);
		
	}



	@Override
	public void update(Task t) {
		TaskDAO.update(t);
	}

	@Override
	public void delete(Task t) {
		TaskDAO.delete(t);
	}

	@Override
	public Task get(int id) {
		return TaskDAO.get(id);
	}

	
}

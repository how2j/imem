package com.how2java.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.how2java.dao.TaskDAO;
import com.how2java.pojo.Task;
import com.how2java.service.TaskService;

public class TaskServiceImpl implements TaskService {

	TaskDAO taskDAO;

	public List<Task> list() {
		List<Task> Tasks= taskDAO.list();
		
		return Tasks;
	}

	public TaskDAO getTaskDAO() {
		return taskDAO;
	}

	public void setTaskDAO(TaskDAO taskDAO) {
		this.taskDAO = taskDAO;
	}

	@Override
	public void add(Task t) {
		taskDAO.add(t);
		
	}
	
	public List<Task> sync(List<Task> tasks){
		List<Task> addTasks = new ArrayList<>();
		//add
		for (Task t: tasks) {
			
			if(t.getId()==0){
				taskDAO.add(t);
				addTasks.add(t);
			}
			else{
				System.out.println(t);
				taskDAO.update(t);
			}
		}
		//update
		
		return addTasks;
	}
	



	@Override
	public void update(Task t) {
		taskDAO.update(t);
	}

	@Override
	public void delete(Task t) {
		taskDAO.delete(t);
	}

	@Override
	public Task get(int id) {
		return taskDAO.get(id);
	}

	
}

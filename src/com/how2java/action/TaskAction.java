package com.how2java.action;

import java.util.List;

import com.how2java.pojo.Task;
import com.how2java.service.TaskService;

public class TaskAction {

	TaskService taskService;
	List<Task> tasks;
	Task task;

	public String list() {
		tasks = taskService.list();
		return "listTask";
	}
	
	public String add(){
		taskService.add(task);
		return "listTaskAction";
	}
	public String edit(){
		task = taskService.get(task.getId());
		return "editTask";
	}
	public String delete(){
		taskService.delete(task);
		return "listTaskAction";
	}
	public String update(){
		taskService.update(task);
		return "listTaskAction";
	}

	public TaskService getTaskService() {
		return taskService;
	}

	public void setTaskService(TaskService TaskService) {
		this.taskService = TaskService;
	}

	public List<Task> getTasks() {
		return tasks;
	}

	public void setTasks(List<Task> Tasks) {
		this.tasks = Tasks;
	}

	public Task getTask() {
		return task;
	}

	public void setTask(Task Task) {
		this.task = Task;
	}
	
	
	 

}

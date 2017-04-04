package com.how2java.action;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.StringUtils;

import com.how2java.pojo.Task;
import com.how2java.service.TaskService;

import freemarker.template.utility.StringUtil;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class TaskAction {

	TaskService taskService;
	List<Task> tasks;
	Task task;

	String taskJasons;
	 static String JsonStr = "{object:{tasks:" +
			              "[{name:'呵呵',image:'http://10.0.159.132:8080/Web/s1.png'}," +
			             "{name:'哈哈',image:'http://10.0.159.132:8080/Web/s1.png'}," +
			              "{name:'嘿嘿',image:'http://10.0.159.132:8080/Web/s2.jpg'}]}}";
	 
	public static void main(String[] args) throws Exception {
		
		File f =new File("jsons.txt");
		String fc = FileUtils.readFileToString(f);
		fc = "{object:{tasks:" + fc + "}}";
		fc = StringUtils.replace(fc, "\"{", "{");
		fc = StringUtils.replace(fc, "}\"", "}");
		fc = StringUtils.replace(fc, "\\\"", "'");
		
		System.out.println(fc);
		System.out.println(JsonStr);
		System.out.println(fc);
		
		
//		JSONObject jb = JSONObject.fromObject(fc);
//		System.out.println(jb);
		
		new TaskAction(). jsonStrToList(fc);
	}

	  public List<Task> jsonStrToList(String s){
	        List<Task> list=new ArrayList<Task>();
	        
	        JSONObject jb = JSONObject.fromObject(s);  
        
	        JSONObject jsonPersons=jb.getJSONObject("object");
	        //获得json对象组
	        JSONArray arr=jsonPersons.getJSONArray("tasks");

	        
	        for(int i=0;i<arr.size();i++){
	            //循环对象，并通过getString("属性名");来获得值
	            JSONObject tempJson=arr.getJSONObject(i);
	            System.out.println(tempJson.get("id"));
	            System.out.println(tempJson.get("uuid"));
	            System.out.println(tempJson.get("name"));
	            
	            System.out.println(tempJson.get("quadrant"));
	            System.out.println(tempJson.get("index"));
	        }
	        return null;
	        
	    }
	
	public String jsons(){
		System.out.println(taskJasons);
		return null;
	}
	
	
	public String getTaskJasons() {
		return taskJasons;
	}

	public void setTaskJasons(String taskJasons) {
		this.taskJasons = taskJasons;
	}

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

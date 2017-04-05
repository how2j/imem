package com.how2java.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.how2java.pojo.Task;
import com.how2java.service.TaskService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class TaskAction {

	TaskService taskService;
	List<Task> tasks;
	Task task;

	String taskJsons;
	 static String JsonStr = "{object:{tasks:" +
			              "[{name:'呵呵',image:'http://10.0.159.132:8080/Web/s1.png'}," +
			             "{name:'哈哈',image:'http://10.0.159.132:8080/Web/s1.png'}," +
			              "{name:'嘿嘿',image:'http://10.0.159.132:8080/Web/s2.jpg'}]}}";
	 
	public static void main(String[] args) throws Exception {
		
		//声明一个Hash对象并添加数据
		Map params =  new HashMap();

		params.put("username", "xx");
		params.put("user_json", "yy");
		
		

		//声明JSONArray对象并输入JSON字符串
		JSONArray array = JSONArray.fromObject(new Task());
		
		
//		File f =new File("jsons.txt");
//		String fc = FileUtils.readFileToString(f);
//
//		
//		System.out.println(fc);
//		System.out.println(JsonStr);
//		System.out.println(fc);
//		
//		
//		
//		
////		JSONObject jb = JSONObject.fromObject(fc);
////		System.out.println(jb);
//		
//		List<Task> tasks= new TaskAction(). jsonStrToList(fc);
//		for (Task task : tasks) {
//			System.out.println(task);
//		}
		
	}

	  public List<Task> jsonStrToList(String s){
			s = "{object:{tasks:" + s + "}}";
			s = StringUtils.replace(s, "\"{", "{");
			s = StringUtils.replace(s, "}\"", "}");
			s = StringUtils.replace(s, "\\\"", "'");
			
			
			
		  List<Task> tasks=new ArrayList<Task>();
	        try {
				
				JSONObject jb = JSONObject.fromObject(s);  
				JSONObject jsonPersons=jb.getJSONObject("object");
				JSONArray arr=jsonPersons.getJSONArray("tasks");
				for(int i=0;i<arr.size();i++){
				    JSONObject tempJson=arr.getJSONObject(i);
				    int id = Integer.parseInt((tempJson.get("id").toString()));
				    int quadrant = Integer.parseInt((tempJson.get("quadrant").toString()));
				    int index = Integer.parseInt((tempJson.get("index").toString().trim()));

				    String status = tempJson.get("status").toString();
				    String uuid = tempJson.get("uuid").toString();
				    String name = tempJson.get("name").toString();
 				    
				    
				    Task t = new Task();
				    if(-1!=id)
				    	t.setId(id);
				    
				    t.setUuid(uuid);
				    t.setName(name);
				    t.setQuadrant(quadrant);
				    t.setIndex(index);
				    t.setStatus(status);
				    
				    tasks.add(t);
				    

				}
				
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	        
	        return tasks;
	    }
	
	public String jsons(){
		List<Task> tasks= jsonStrToList(taskJsons);
		List<Task> addTasks= taskService.sync(tasks);
		String addTasksJsonsString= JSONArray.fromObject(addTasks).toString();
		
		
		
		try {
			ServletActionContext.getResponse().getWriter().print(addTasksJsonsString);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}
	


	public String getTaskJsons() {
		return taskJsons;
	}

	public void setTaskJsons(String taskJsons) {
		this.taskJsons = taskJsons;
	}

	public String list() {
		tasks = taskService.list();
		return "listTask";
	}
	
	public String homepage(){
		tasks = taskService.list();
		Collections.sort(tasks, new Comparator<Task>() {

			@Override
			public int compare(Task t1, Task t2) {
				return t1.getIndex()-t2.getIndex();

			}
		});
		System.out.println(tasks);
		return "homepage";
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

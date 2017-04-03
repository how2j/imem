<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib prefix="s" uri="/struts-tags" %>


<%@page isELIgnored="false"%>


<div style="margin:0px auto; width:500px">
<table cellspacing="0" border="1" width="100%">
	<tr>
		<td>id</td>
		<td>name</td>
		<td>编辑</td>
		<td>删除</td>
		
	</tr>
	    	    
<s:iterator value="tasks" var="t">
	<tr>
		<td>${t.id}</td>
		<td>${t.name}</td>
		<td><a href="editTask?task.id=${t.id}">编辑</a></td>
		<td><a href="deleteTask?task.id=${t.id}">删除</a></td>		
	</tr>
</s:iterator>

</table>

<br>
<br>

<form action="addTask" method="post">

name: <input name="task.name"> <br>
<button type="submit">提交</button>

</form>
</div>
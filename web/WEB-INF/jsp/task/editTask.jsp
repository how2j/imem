<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib prefix="s" uri="/struts-tags" %>


<%@page isELIgnored="false"%>


<div style="margin:0px auto; width:500px">


<form action="updateTask" method="post">

name: <input name="task.name" value="${task.name}"> <br>

<input name="task.id" type="hidden" value="${task.id}"> 
<button type="submit">提交</button>

</form>
</div>
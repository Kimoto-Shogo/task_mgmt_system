<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List,model.entity.TaskBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>一覧</title>
</head>
<body>
	<h2>一覧表示画面</h2>
	
	<%
		List<TaskBean> employeeList = (List<TaskBean>) request.getAttribute("employeeList");
	%>
	<table border="1">
		<tr>
			<th>タスク名</th>
			<th>カテゴリ名</th>
			<th>期限</th>
			<th>ユーザ名</th>
			<th>ステータス名</th>
			<th>メモ</th>
		</tr>
		
		<% for (TaskBean employee : employeeList) {%> 
		<tr>
			<td><%= employee.getTask_name() %></td>
			<td><%= employee.getCategory_name() %></td>
			
			<td><%= employee.getLimit_date() %></td>
			<td><%= employee.getUser_name()  %></td>
			<td><%= employee.getStatus_name()  %></td>
			
			<td><%= employee.getMemo()  %></td>
			<td><a href="taskEditServlet?task_id=<%=employee.getTask_id()%>"><%=employee.getTask_id()%>編集</a></td>
		
		</tr>
		
		<% } %>
		
		
	</table>
			
		
</body>
</html>

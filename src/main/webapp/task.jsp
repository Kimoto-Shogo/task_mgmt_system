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
			<th>タスクID</th>
			<th>タスク名</th>
			<th>カテゴリID</th>
			<th>期限</th>
			<th>ユーザID</th>
			<th>ステータスコード</th>
			<th>メモ</th>
			<th>登録日時</th>
			<th>更新日時</th>
		</tr>
		<% if (employeeList != null) {
			employeeList = new ArrayList<>();%>
		<% for (TaskBean employee : employeeList) {%> 
		<tr>
			<td>
			<a href="TaskListServlet?code=<%= employee.getTask_id() %>">
			<%= employee.getTask_id() %></a>
			</td>
			<td><%= employee.getTask_name() %></td>
			<td><%= employee.getCategory_id() %></td>
			
			<td><%= employee.getLimit_date() %></td>
			<td><%= employee.getUser_id()  %></td>
			<td><%= employee.getStatus_code()  %></td>
			
			<td><%= employee.getMemo()  %></td>
			<td><%= employee.getCreate_datetime()  %></td>
			<td><%= employee.getUpdate_datetime()  %></td>
		</tr>
		<% } %>
		<% } %>
	</table><br>
	<form action="menu.jsp">
	<input type = "submit" value="メニュー画面へ">
	</form>
</body>
</html>

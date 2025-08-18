<%@page import="model.entity.TaskBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.dao.CategoryBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<%
	TaskBean updateTask = new TaskBean();
	@SuppressWarnings("unchecked")
	List<CategoryBean> categoryList = (ArrayList<CategoryBean>)session.getAttribute("categoryList"); 
%>
<meta charset="UTF-8">
<title>タスク編集画面</title>
</head>
<body>
	<form action="taskEditServlet">
		<table>
			<tr>
				<td>タスクID</td><td><%= updateTask.getTask_id() %></td>
			</tr>
			<tr>
				<td>タスク名</td><td><input type="text" name="task_name"></td>
			</tr>
			<tr>
				<td>カテゴリID</td><td><input type="number" name="category_id"></td>
			</tr>
			<tr>
				<td>期限</td><td><input type="text" name="category_id" pattern="\d{4}-(0[1-9]|1[0-2])-(0[1-9]|[12]\d|3[01])" placeholder="YYYY-MM-DD(ﾊｲﾌﾝあり)"></td>
			</tr>
		</table>
	</form>
</body>
</html>
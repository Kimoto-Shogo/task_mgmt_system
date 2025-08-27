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
	<h2>一覧表示画面</h2><hr><br>
	
	<%
	@SuppressWarnings("unchecked")
		List<TaskBean> taskList = (List<TaskBean>) session.getAttribute("taskList");
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
		
		<% for (TaskBean task : taskList) {%> 
		<tr>
			<td><%= task.getTask_name() %></td>
			<td><%= task.getCategory_name() %></td>
			
			<td><%= task.getLimit_date() %></td>
			<td><%= task.getUser_name()  %></td>
			<td><%= task.getStatus_name()  %></td>
			
			<td><%= task.getMemo()  %></td>
			
			<td>
				<form>
				<input type="hidden" name="task_id" value="<%= task.getTask_id()%>">
				<input type="submit" formaction="CommentDisplayServlet" formmethod="post" value="コメント">
				</form>
			</td>
			
			<td>
				<form>
				<input type="hidden" name="task_id" value="<%= task.getTask_id()%>">
				<input type="submit" formaction="taskEditServlet" formmethod="get" value="編集">
				</form>
			</td>

			<td>
				<form>
				<input type="hidden" name="task_id" value="<%= task.getTask_id()%>">
				<input type="submit" formaction="TaskDeleteServlet" formmethod="get" value="削除">
				</form>
			</td>

		
		</tr>
		
		<% } %>
		
		
	</table><br>
		<form action = "menu.jsp" >
		<input type ="submit" value="メニュー画面へ">
		</form>
		
</body>
</html>

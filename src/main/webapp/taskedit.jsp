<%@page import="model.entity.UserBean"%>
<%@page import="model.entity.StatusBean"%>
<%@page import="model.entity.CategoryBean"%>
<%@page import="model.entity.TaskBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<%
	TaskBean updateTask = (TaskBean)session.getAttribute("task");
	@SuppressWarnings("unchecked")
	List<CategoryBean> categoryList = (ArrayList<CategoryBean>)session.getAttribute("categoryList"); 
	@SuppressWarnings("unchecked")
	List<StatusBean> statusList = (ArrayList<StatusBean>)session.getAttribute("statusList");
	@SuppressWarnings("unchecked")
	List<UserBean> userList = (ArrayList<UserBean>)session.getAttribute("userList");
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
				<td>カテゴリ</td>
				<td>
					<% for(CategoryBean category : categoryList){ %>
						<select name="category_id">
							<option value="<%=category.getCategory_id()%>"><%=category.getCategory_name() %></option>
						</select>
					<%} %>
				<td>
			</tr>
			<tr>
				<td>期限</td><td><input type="text" name="limit_date" pattern="\d{4}-(0[1-9]|1[0-2])-(0[1-9]|[12]\d|3[01])" placeholder="YYYY-MM-DD(ﾊｲﾌﾝあり)"></td>
			</tr>
			<tr>
				<td>ユーザ</td>
				<td>
					<% for(UserBean user : userList){ %>
						<select name="category_id">
							<option value="<%=user.getUser_id() %>"><%=user.getUser_name() %></option>
						</select>
					<%} %>
				</td>
			</tr>
			<tr>
				<td>ステータス</td>
				<td>
					<% for(StatusBean status : statusList){ %>
						<select name="category_id">
							<option value="<%=status.getStatus_code() %>"><%=status.getStatus_name() %></option>
						</select>
					<%} %>
				</td>
			</tr>
			<tr>
				<td>メモ</td><td><textarea name="memo" placeholder="100文字まで" maxlength="100" ><%=updateTask.getMemo() %></textarea></td>
			</tr>
		</table>
	</form>
</body>
</html>
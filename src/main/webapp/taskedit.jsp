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
	TaskBean updateTask = (TaskBean)session.getAttribute("updateTask");
	@SuppressWarnings("unchecked")
	List<CategoryBean> categoryList = (ArrayList<CategoryBean>)session.getAttribute("categoryList"); 
	@SuppressWarnings("unchecked")
	List<StatusBean> statusList = (ArrayList<StatusBean>)session.getAttribute("statusList");
	@SuppressWarnings("unchecked")
	List<UserBean> userList = (ArrayList<UserBean>)session.getAttribute("userList");
%>
<style>
	table {
		text-align: center;
		border: 1px solid  black;
		box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.3);
		}
	table td {
		text-align: center;
		border: 1px solid black;
		border-left: 1px dotted black;
		border-right: 1px dotted black;
		box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.3); 
		 }
</style>
<meta charset="UTF-8">
<title>タスク編集画面</title>
</head>
<body>
	<form action="taskEditServlet" method="POST" >
		<table>
			<tr>
				<td>タスクID</td><td><%= updateTask.getTask_id() %></td>
			</tr>
			<tr>
				<td>タスク名</td><td><input type="text" name="task_name" value="<%=updateTask.getTask_name() %>" required></td>
			</tr>
			<tr>
				<td>カテゴリ</td>
				<td>
					<select name="category_id" required>
						<% for(CategoryBean category : categoryList){ %>
								<option value="<%=category.getCategory_id()%>"
									<%if (updateTask.getCategory_name().equals(category.getCategory_name())){%>
										selected
									<% } %>
									><%=category.getCategory_name() %>
								</option>
						<%} %>
					</select>
				</td>
			</tr>
			<tr>
				<td>期限</td><td><input type="date" name="limit_date" value="<%=updateTask.getLimit_date() %>" required></td>
			</tr>
			<tr>
				<td>ユーザ</td>
				<td>
					<select name="user_id" required>
						<% for(UserBean user : userList){ %>
								<option value="<%=user.getUser_id() %>"
									<%if (updateTask.getUser_name().equals(user.getUser_name())){%>
										selected
									<% } %>
									><%=user.getUser_name() %>
								</option>
						<%} %>
					</select>
				</td>
			</tr>
			<tr>
				<td>ステータス</td>
				<td>
					<select name="status_code" required>
						<% for(StatusBean status : statusList){ %>
							<option value="<%=status.getStatus_code() %>"
								<%if (updateTask.getStatus_name().equals(status.getStatus_name())){%>
									selected
								<% } %>
								><%=status.getStatus_name() %>
							</option>
						<%} %>
					</select>
				</td>
			</tr>
			<tr>
				<td>メモ</td><td><textarea name="memo" placeholder="100文字まで" maxlength="100" ><%=updateTask.getMemo() %></textarea></td>
			</tr>
		</table>
		<input type="submit" value="更新">
	</form>
</body>
</html>
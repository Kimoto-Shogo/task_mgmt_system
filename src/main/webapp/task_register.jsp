<%@page import="java.util.ArrayList , java.util.List , model.entity.CategoryBean , 
					model.entity.StatusBean , model.entity.UserBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>タスク登録画面</title>
</head>
<body>
	<%List<CategoryBean> categorybean = (ArrayList<CategoryBean>)session.getAttribute("category");%>
	<%List<StatusBean> statusbean = (List<StatusBean>)session.getAttribute("status"); %>
	<%UserBean userbean = (UserBean)session.getAttribute("userbean"); %>
	
	<h1>タスク登録画面</h1><hr>
	<form action = "task-register-servlet" method = post>
	<table>
		<tr>	
		<th>ユーザ名</th>
		<td><%=userbean.getUser_name() %></td>
		</tr>
		
		<tr>	
		<th>タスク名</th>
		<td><input type = text name = task_name required></td>
		</tr>
		
		<tr>
		<th>カテゴリ名</th>
		<td>
		<select name = category_id required>
			<option selected value = null hidden>カテゴリ名を選択してください</option>
			<% for(CategoryBean cb : categorybean){%>
				<option value = "<%= cb.getCategory_id()%>"><%= cb.getCategory_name()%></option>
			<% } %>
		</select>
		</td>
		</tr>
		
		<tr>
		<th>期限</th>
		<td><input type = date name = "limit"></td>
		</tr>
		
		<tr>
		<th>ステータス</th>
		<td>
		<select name = status required>
		<% for(StatusBean sb : statusbean){%>
			<option value = "<%= sb.getStatus_code()%>"><%= sb.getStatus_name()%></option>
		<% } %>
		</select>
		</td>
		</tr>
		
		<tr>	
		<th>メモ</th>
		<td><input type = text name = memo size = 100></td>
		</tr>
	</table><hr>
	<input type = submit value = 登録>　
	<input type = reset value = クリア>
	</form>
</body>
</html>
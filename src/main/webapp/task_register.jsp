<%@page import="java.util.List , model.entity.CategoryBean , 
					model.entity.StatusBean , model.entity.UserBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>タスク登録画面</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/task_register.css">
</head>
<body class="scroll-text">
	<%List<CategoryBean> categorybean = (List<CategoryBean>)session.getAttribute("category");%>
	<%List<UserBean> userbean = (List<UserBean>)session.getAttribute("user"); %>
	<%List<StatusBean> statusbean = (List<StatusBean>)session.getAttribute("status"); %>
	<%UserBean myname = (UserBean)session.getAttribute("userbean"); %>
	<h1>タスク登録画面</h1><hr>
	<form action = "task-register-servlet" method = post>
	<table>
		<tr>	
		<th>タスク名</th>
		<td><input type = text name = task_name size = "55" maxlength = 50 placeholder = "50文字以内" required>
		<font color = "red">※必須項目</font></td>
		</tr>
		
		<tr>
		<th>カテゴリ名</th>
		<td>
		<select name = category_id required>
			<option value = "" selected disabled>カテゴリ名を選択してください</option>
			<% for(CategoryBean cb : categorybean){%>
				<option value = "<%= cb.getCategory_id()%>"><%= cb.getCategory_name()%></option>
			<% } %>
		</select><font color = "red">※必須項目</font>
		</td>
		</tr>
		
		<tr>
		<th>期限</th>
		<td><input type = date id="datepicker" min="" name = "limit" required>
		<script>
		//今日の日付情報をだす。
		window.onload = function(){
		    var getToday = new Date();
		    var y = getToday.getFullYear();
		    var m = getToday.getMonth() + 1;
		    var d = getToday.getDate();
		    var today = y + "-" + m.toString().padStart(2,'0') + "-" + d.toString().padStart(2,'0');
		    document.getElementById("datepicker").setAttribute("value",today);
		    document.getElementById("datepicker").setAttribute("min",today);
		}
		</script>
		</tr>
		
		<tr>	
		<th>ユーザ名</th>
		<td>
		<select name = user_id required>
			<option value = "<%= myname.getUser_id() %>" hidden><%= myname.getUser_name() %></option>
			<% for(UserBean ub : userbean){%>
				<option value = "<%= ub.getUser_id()%>"><%= ub.getUser_name()%></option>
			<% } %>
		</select>
		</td>
		</tr>
		
		<tr>
		<th>ステータス</th>
		<td>
		<select name = status_code style="text-align:center" required>
		<% for(StatusBean sb : statusbean){%>
			<option value = "<%= sb.getStatus_code()%>"><%= sb.getStatus_name()%></option>
		<% } %>
		</select>
		</td>
		</tr>
		
		<tr>	
		<th>メモ</th>
		<td><textarea name = memo placeholder = "100文字以内" cols = "55" rows = "4" maxlength = 100></textarea></td>
		</tr>
	</table><hr>
	<input type = submit value = 登録>　
	<input type = reset value = クリア>
	</form><br>
	
	<form action = "menu.jsp">
	<input type = submit value = メニュー画面へ>
	</form>
</body>
</html>
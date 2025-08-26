<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
session.invalidate();
%>
<meta charset="UTF-8">
<link rel ="stylesheet" href ="css/login.css">
<title>ログイン画面</title>
</head>
<body>
	<div class="login-container">
		<form action="LoginServlet" method="POST">
		<label for="userid">ユーザID：</label>
		<input type="text" name="userid" class="input-box"><br>
		
		<label for="password">パスワード:</label>
		<input type="password" id="password" name="password" class="input-box"><br>
		<br>
		
		<input type="submit" value="ログイン" class="login-button">
		</form>
	</div>
</body>
</html>
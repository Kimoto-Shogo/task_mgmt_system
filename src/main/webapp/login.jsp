<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
session.invalidate();
%>
<meta charset="UTF-8">
<link rel ="stylesheet" href ="login.css">
<title>ログイン画面</title>
</head>
<body>

		<form action="LoginServlet" method="POST">
		<label for="userid">ユーザID：</label>
		<input type="text" name="userid" class="input-box"><br>
		パスワード：<input type="password" name="password">
		<br><br>
		<input type="submit" value="ログイン">
		</form>


</body>
</html>
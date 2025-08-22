<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>タスク登録失敗画面</title>
</head>
<body>
	<h2>タスク登録が失敗しました。</h2><br>
	
	<%// セッションの無効化 %>
	<%session.removeAttribute("category"); %>
	<%session.removeAttribute("user"); %>
	<%session.removeAttribute("status"); %>
	
	<form>
		<input type = "submit" value = タスク登録画面 formaction = "task-register-servlet">
		<input type = "submit" value = メニュー画面 formaction = "menu.jsp">
	</form>
</body>
</html>
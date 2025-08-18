<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>メニュー画面</title>
</head>
<body>

<<<<<<< HEAD
	<form action="task-register-servlet" method="GET">
=======
	<form action="TaskRegisterServlet" method="GET">
>>>>>>> 0c4237bf066c71e500f8ee1b0927643eb1689ae8
		<input type="submit" value="タスク登録画面"><br>
	</form>
	
	<form action="TaskListServlet" method="GET">
		<input type="submit" value="タスク一覧表示画面"><br>
		</form>
	
	<form action="logout.jsp" method="POST">
	
		<input type="submit" value="ログアウト"><br>
	</form>

</body>
</html>
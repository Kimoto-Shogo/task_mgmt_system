<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List,model.entity.CommentBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>コメント画面</title>
</head>
<body>
	<h2>コメント画面</h2><hr><br>

	<%
    @SuppressWarnings("unchecked")
    List<CommentBean> commentList = (List<CommentBean>) request.getAttribute("commentList");
	%>

	<% if (commentList != null) {
		for (CommentBean cb : commentList) { %>

	<form action="commentservlet" method="get">
		<input type="hidden" name="task_id" value="<%= cb.getTask_id() %>">
		<input type="hidden" name="user_id" value="<%= cb.getUser_id() %>">

		<table border="1">
			
			
			<tr>
				<th>ユーザーID</th>
				<td><%= cb.getUser_id() %></td>
			</tr>
			<tr>
				<th>コメント</th>
				<td><%= cb.getComment() %></td>
			</tr>
			
		</table>
		<br>
	<% } } %>

		<h3>コメント追加</h3>
		コメント：<input type="text" name="comment" size="100" maxlength="100" required><br><br>
		<input type="submit" value="コメント追加">
	</form>

	<br>
	<form action="task.jsp">
		<input type="submit" value="一覧画面へ">
	</form>
</body>
</html>

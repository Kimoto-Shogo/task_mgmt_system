<%@page import="model.entity.UserBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List,model.entity.CommentBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>コメント画面</title>

<%
@SuppressWarnings("unchecked")
List<CommentBean> comList = (List<CommentBean>)session.getAttribute("comList"); 
UserBean user = (UserBean)session.getAttribute("userbean");
%>
</head>
<body>
	<h2>コメント画面</h2><hr><br>
	
	<table style="text-align: center;">
	<tr >
		<th colspan="2">投稿データ</th>
		<th>コメントメッセージ</th>
	</tr>
	<% for(CommentBean comment : comList){ %>
	<tr>
	<td><%=comment.getComment_id() %></td><!-- colspan -->
	<td><%=comment.getUpdate_datetime() %></td><!-- colspanここまで -->
	<td><%=comment.getComment() %></td>
	<td>
	<%if(comment.getUser_id().equals(user.getUser_id())){ %>
	<form action="commentdelete.jsp" method="post">
		<input type="hidden" name="comment_id" value="<%= comment.getComment_id() %>">
		<input type="submit" value="削除" >
	</form>
	<%} %>
	</td>
	</tr>
	<%} %>
	</table>
	<form>
		<input type="submit" formaction="CommentInsertServlet" formmethod="get" value="コメントを書き込む">
		<input type="submit" formaction="TaskListServlet" formmethod="get" value="タスク一覧に戻る">
	</form>
</body>
</html>

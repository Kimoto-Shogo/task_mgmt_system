<%@page import="model.entity.UserBean"%>
<%@page import="model.entity.CommentBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
@SuppressWarnings("unchecked")
List<CommentBean> comList = (List<CommentBean>)session.getAttribute("comList"); 
UserBean user = (UserBean)session.getAttribute("userbean");
int dCommentId = Integer.parseInt(request.getParameter("comment_id"));
session.setAttribute("dCommentId", dCommentId);
CommentBean deletecomment = null ;
for(CommentBean comment:comList){
	if(comment.getComment_id() ==dCommentId){
		deletecomment = comment; 
	}
}
session.setAttribute("deletecomment", deletecomment);
%>
</head>
<body>

	<h2>以下のコメントを削除しますか？</h2>
	<table style="text-align: center;">
	<tr >
		<th colspan="2">投稿データ</th>
		<th>コメントメッセージ</th>
	</tr>
	<tr>
	<td><%=deletecomment.getComment_id() %></td><!-- colspan -->
	<td><%=deletecomment.getUpdate_datetime() %></td><!-- colspanここまで -->
	<td><%=deletecomment.getComment() %></td>
	</tr>
	</table>
	<form action="CommentDeleteServlet" method="post">
	<input type="submit" value="削除">
	</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>新規コメント書き込みページ</h1><br><hr>
<form action="CommentInsertServlet" method="post">
<table>
	<tr><td>コメント</td></tr>
	<tr>
		<td>
			<textarea name="comment" cols="32" rows="5" maxlength="100"></textarea>
		</td>
	</tr>
	<tr>
		<td>
			<input type="submit"  value="送信">
		</td>
	</tr>
</table>
</form>
</body>
</html>
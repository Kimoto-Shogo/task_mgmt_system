<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.List , model.entity.CategoryBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>タスク登録画面</title>
</head>
<body>
	<% List<CategoryBean> categorybean = (ArrayList<CategoryBean>)session.getAttribute("category");%>
	
	<h1>タスク登録画面</h1><hr>
	<form>
	<table>
		<tr>	
		<th>タスク名</th>
		<td><input type = text name = task_name></td>
		</tr>
		
		<tr>
		<th>カテゴリ名</th>
		<td>
		<select name = category_id>
			<% for(CategoryBean cb : categorybean){%>
				<option value = "<%= cb.getCategory_id()%>"><%= cb.getCategory_name()%></option>
			<% } %>
		</select>
		</td>
		</tr>
		
		<tr>
		<th>価格</th>
		<td width="1200"><input type = text name = "price">円</td>
		</tr>
	</table>
	</form>
</body>
</html>
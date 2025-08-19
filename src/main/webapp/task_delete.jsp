<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<%@ page contentType="text/html; charset=UTF-8" %>
<%
  com.example.task.entity.TaskBean t =
      (com.example.task.entity.TaskBean) request.getAttribute("task");
%>
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>タスク削除確認</title></head>
<body>
<h2>このタスクを削除しますか？</h2>
<table border="1" cellpadding="6">
  <tr><th>タスク名</th><td><%= t.getTask_name() %></td></tr>
  <tr><th>カテゴリ</th><td><%= t.getCategory_name() %></td></tr>
  <tr><th>期限</th><td><%= t.getLimit_date() %></td></tr>
  <tr><th>担当者</th><td><%= t.getUser_name() %></td></tr>
  <tr><th>ステータス</th><td><%= t.getStatus_name() %></td></tr>
  <tr><th>メモ</th><td><%= t.getMemo() %></td></tr>
</table>

<form method="post" action="<%= request.getContextPath() %>/task/delete">
  <input type="hidden" name="task_id" value="<%= t.getTask_id() %>">
  <button type="submit">削除する</button>
  <a href="<%= request.getContextPath() %>/task/list">戻る</a>
</form>
</body>
</html>


</body>
</html>
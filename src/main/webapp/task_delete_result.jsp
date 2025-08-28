<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.entity.TaskBean" %>
<%
    Integer deletedCount = (Integer) request.getAttribute("deletedCount");
    TaskBean t = (TaskBean) request.getAttribute("deletedTask"); // ← 受け取る
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>削除完了</title>
</head>
<body>
  <h2>削除結果画面</h2>
  <hr>

  <% if (deletedCount != null && deletedCount > 0) { %>
    <p>次のデータを削除しました（<%= deletedCount %> 件）。</p>

    <% if (t != null) { %>
      <table border="1">
        <tr><th>タスクID</th>     <td><%= t.getTask_id() %></td></tr>
        <tr><th>カテゴリ名</th>   <td><%= t.getCategory_name() %></td></tr>
        <tr><th>タスク名</th>     <td><%= t.getTask_name() %></td></tr>
        <tr><th>期限</th>         <td><%= t.getLimit_date() %></td></tr>
        <tr><th>担当者</th>       <td><%= t.getUser_name() %></td></tr>
        <tr><th>ステータス</th>   <td><%= t.getStatus_name() %></td></tr>
        <tr><th>メモ</th>         <td><%= t.getMemo() %></td></tr>
      </table>
      <br>
    <% } %>
  <% } else { %>
    <p>削除できませんでした。</p>
  <% } %>

  <form action="<%= request.getContextPath() %>/TaskListServlet" method="get" style="display:inline;">
    <input type="submit" value="一覧へ戻る">
  </form>
</body>
</html>

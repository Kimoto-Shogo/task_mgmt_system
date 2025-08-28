<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.entity.TaskBean" %>
<%
    String errorMessage = (String) request.getAttribute("errorMessage");
    TaskBean t = (TaskBean) request.getAttribute("t"); // あれば表示（nullでもOK）
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>タスク削除エラー</title>

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="<%= request.getContextPath() %>/css/bootstrap.min.css">
  <!-- Bootstrap JS -->
  <script src="<%= request.getContextPath() %>/js/bootstrap.bundle.min.js"></script>

  <style>
    thead tr.bg-danger th {
      background-color: #dc3545 !important; /* Bootstrapのdanger色 */
      color: white !important;
    }
  </style>
</head>
<body>
<div class="container mt-5">
  <h2 class="mb-4 text-danger">タスク削除エラー画面</h2>
  <hr><br>

  <p class="lead text-danger"><strong>削除処理中にエラーが発生しました。</strong></p>

  <table class="table table-bordered">
    <thead>
      <tr class="bg-danger text-white">
        <th>項目</th>
        <th>内容</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <th>エラー内容</th>
        <td><%= (errorMessage != null) ? errorMessage : "不明なエラーです。" %></td>
      </tr>

      <%-- エラー時でも対象タスクが分かる場合は再表示 --%>
      <% if (t != null) { %>
        <tr><th>タスクID</th>     <td><%= t.getTask_id() %></td></tr>
        <tr><th>カテゴリ名</th>   <td><%= t.getCategory_name() %></td></tr>
        <tr><th>タスク名</th>     <td><%= t.getTask_name() %></td></tr>
        <tr><th>期限</th>         <td><%= t.getLimit_date() %></td></tr>
        <tr><th>担当者</th>       <td><%= t.getUser_name() %></td></tr>
        <tr><th>ステータス</th>   <td><%= t.getStatus_name() %></td></tr>
        <tr><th>メモ</th>         <td><%= t.getMemo() %></td></tr>
      <% } %>
    </tbody>
  </table>
  <br>

  <!-- ボタン類 -->
  <div class="actions">
    <!-- 一覧へ戻る -->
    <form action="<%= request.getContextPath() %>/TaskListServlet" method="get" style="display:inline;">
      <input type="submit" class="btn btn-secondary"
             value="一覧へ戻る"
             onmousedown="this.style.transform='translateY(2px)'"
             onmouseup="this.style.transform='translateY(0)'">
    </form>

    <%--  詳細表示へ戻れる場合のみ  --%>
    <% if (t != null) { %>
      <form action="<%= request.getContextPath() %>/TaskDeleteServlet" method="get" style="display:inline;">
        <input type="hidden" name="task_id" value="<%= t.getTask_id() %>">
        <input type="submit" class="btn btn-dark"
               value="詳細表示へ"
               onmousedown="this.style.transform='translateY(2px)'"
               onmouseup="this.style.transform='translateY(0)'">
      </form>
    <% } %>
  </div>
</div>
</body>
</html>

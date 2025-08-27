<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List,model.entity.TaskBean"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>一覧</title>

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="<%= request.getContextPath() %>/css/bootstrap.min.css">

  <!-- Bootstrap JS -->
  <script src="<%= request.getContextPath() %>/js/bootstrap.bundle.min.js"></script>

  <!-- 強制的にtheadの背景を緑、文字を白に上書きする-->
  <style>
    thead tr.bg-success th {
      background-color: #198754 !important;
      color: white !important;
    }
  </style>
</head>
<body>
<div class="container mt-5">
  <h2 class="mb-4">一覧表示画面</h2>

  <hr><br>

  <%
    @SuppressWarnings("unchecked")
    List<TaskBean> taskList = (List<TaskBean>) session.getAttribute("taskList");
  %>

  <table class="table table-striped table-bordered">
    <thead>
      <tr class="bg-success text-white">
        <th>タスク名</th>
        <th>カテゴリ名</th>
        <th>期限</th>
        <th>ユーザ名</th>
        <th>ステータス名</th>
        <th>メモ</th>
        <th>コメント</th>
        <th>編集</th>
        <th>削除</th>
      </tr>
    </thead>
    <tbody>
    <% for (TaskBean task : taskList) { %>
      <tr>
        <td><%= task.getTask_name() %></td>
        <td><%= task.getCategory_name() %></td>
        <td><%= task.getLimit_date() %></td>
        <td><%= task.getUser_name() %></td>
        <td><%= task.getStatus_name() %></td>
        <td><%= task.getMemo() %></td>
        <td>
          <form>
            <input type="hidden" name="task_id" value="<%= task.getTask_id() %>">
            <input type="submit" formaction="CommentDisplayServlet" formmethod="post" class="btn btn-sm btn-dark" value="コメント"
              onmousedown="this.style.transform='translateY(2px)'"
              onmouseup="this.style.transform='translateY(0)'">
          </form>
        </td>
        <td>
          <form>
            <input type="hidden" name="task_id" value="<%= task.getTask_id() %>">
            <input type="submit" formaction="taskEditServlet" formmethod="get" class="btn btn-sm btn-dark" value="編集"
              onmousedown="this.style.transform='translateY(2px)'"
              onmouseup="this.style.transform='translateY(0)'">
          </form>
        </td>
        <td>
          <form>
            <input type="hidden" name="task_id" value="<%= task.getTask_id() %>">
            <input type="submit" formaction="TaskDeleteServlet" formmethod="get" class="btn btn-sm btn-danger" value="削除"
              onmousedown="this.style.transform='translateY(2px)'"
              onmouseup="this.style.transform='translateY(0)'">
          </form>
        </td>
      </tr>
    <% } %>
    </tbody>
  </table>

  <form action="menu.jsp">
    <input type="submit" class="btn btn-secondary mt-3" value="メニュー画面へ"
      onmousedown="this.style.transform='translateY(2px)'"
      onmouseup="this.style.transform='translateY(0)'">
  </form>
</div>
</body>
</html>

<%@page import="java.util.List , model.entity.CategoryBean , 
    model.entity.StatusBean , model.entity.UserBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>タスク登録画面</title>

<link href="css/bootstrap.min.css" rel="stylesheet">

</head>
<body class="bg-light">

<%
    List<CategoryBean> categorybean = (List<CategoryBean>)session.getAttribute("category");
    List<UserBean> userbean = (List<UserBean>)session.getAttribute("user");
    List<StatusBean> statusbean = (List<StatusBean>)session.getAttribute("status");
    UserBean myname = (UserBean)session.getAttribute("userbean");
%>

<div class="container mt-5">
    <h1 class="mb-4 text-dark">タスク登録画面</h1>
    <form action="task-register-servlet" method="post" class="border rounded p-4 bg-white shadow-lg">
        
        <div class="mb-3">
            <label for="task_name" class="form-label">タスク名 <span class="text-danger">※必須項目</span></label>
            <input type="text" class="form-control" id="task_name" name="task_name" maxlength="50" placeholder="50文字以内" required>
        </div>

        <div class="mb-3">
            <label for="category_id" class="form-label">カテゴリ名 <span class="text-danger">※必須項目</span></label>
            <select name="category_id" id="category_id" class="form-select" required>
                <option value="" selected disabled>カテゴリ名を選択してください</option>
                <% for(CategoryBean cb : categorybean){ %>
                    <option value="<%= cb.getCategory_id() %>"><%= cb.getCategory_name() %></option>
                <% } %>
            </select>
        </div>

        <div class="mb-3">
            <label for="datepicker" class="form-label">期限 <span class="text-danger">※必須項目</span></label>
            <input type="date" class="form-control" id="datepicker" name="limit" required>
        </div>

        <div class="mb-3">
            <label for="user_id" class="form-label">ユーザ名</label>
            <select name="user_id" id="user_id" class="form-select" required>
                <option value="<%= myname.getUser_id() %>" hidden><%= myname.getUser_name() %></option>
                <% for(UserBean ub : userbean){ %>
                    <option value="<%= ub.getUser_id() %>"><%= ub.getUser_name() %></option>
                <% } %>
            </select>
        </div>

        <div class="mb-3">
            <label for="status_code" class="form-label">ステータス</label>
            <select name="status_code" id="status_code" class="form-select" required>
                <% for(StatusBean sb : statusbean){ %>
                    <option value="<%= sb.getStatus_code() %>"><%= sb.getStatus_name() %></option>
                <% } %>
            </select>
        </div>

        <div class="mb-3">
            <label for="memo" class="form-label">メモ</label>
            <textarea name="memo" id="memo" class="form-control" rows="4" maxlength="100" placeholder="100文字以内"></textarea>
        </div>

        <div class="mb-3 d-flex justify-content-end gap-2">
            <button type="submit" class="btn btn-primary">登録</button>
            <button type="reset" class="btn btn-secondary">クリア</button>
        </div>
    </form>

    <form action="menu.jsp" class="mt-3">
        <button type="submit" class="btn btn-outline-secondary">メニュー画面へ</button>
    </form>
</div>

<!-- 日付設定 -->
<script>
    window.onload = function() {
        var getToday = new Date();
        var y = getToday.getFullYear();
        var m = getToday.getMonth() + 1;
        var d = getToday.getDate();
        var today = y + "-" + m.toString().padStart(2,'0') + "-" + d.toString().padStart(2,'0');
        document.getElementById("datepicker").value = today;
        document.getElementById("datepicker").min = today;
    }
</script>

</body>
</html>

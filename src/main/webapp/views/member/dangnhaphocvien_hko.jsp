<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Đăng Nhập</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script>
        window.onload = function() {
            const urlParams = new URLSearchParams(window.location.search);
            if (urlParams.get("success") === "true") {
                alert("Đăng nhập thành công! Chào mừng bạn.");
            }
        };
    </script>
</head>
<body class="bg-light d-flex justify-content-center align-items-center vh-100">
<div class="card shadow p-4 col-12 col-md-4">
    <h3 class="text-center mb-4 text-danger fw-bold">Đăng Nhập</h3>

    <% String errorMessage = (String) request.getAttribute("errorMessage"); %>
    <% if (errorMessage != null) { %>
    <div class="alert alert-danger text-center" role="alert"><%= errorMessage %></div>
    <% } %>

    <form action="dangnhaphocvien" method="post">
        <div class="mb-3">
            <label for="studentId" class="form-label fw-medium">Mã Học Viên</label>
            <input type="text" class="form-control" id="studentId" name="studentId"
                   placeholder="Nhập mã học viên" required autofocus
                   value="<%= request.getParameter("studentId") != null ? request.getParameter("studentId") : "" %>">
        </div>

        <div class="mb-3">
            <label for="password" class="form-label fw-medium">Mật Khẩu</label>
            <div class="input-group">
                <input type="password" class="form-control" id="password" name="password"
                       placeholder="Nhập mật khẩu" required>
                <button class="btn btn-outline-secondary" type="button" id="togglePassword">
                    👁️
                </button>
            </div>
        </div>

        <button type="submit" class="btn btn-danger w-100 fw-bold">Đăng Nhập</button>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
    document.getElementById("togglePassword").addEventListener("click", function () {
        let passwordInput = document.getElementById("password");
        if (passwordInput.type === "password") {
            passwordInput.type = "text";
        } else {
            passwordInput.type = "password";
        }
    });
</script>
</body>
</html>

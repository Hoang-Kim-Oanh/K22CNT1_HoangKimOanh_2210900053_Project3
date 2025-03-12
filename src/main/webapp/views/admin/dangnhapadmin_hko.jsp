<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Đăng Nhập Quản Trị Viên</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script>
        function togglePassword() {
            var passwordField = document.getElementById("password");
            if (passwordField.type === "password") {
                passwordField.type = "text";
            } else {
                passwordField.type = "password";
            }
        }
    </script>
</head>
<body>
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card shadow-lg rounded-3 border-0">
                <div class="card-header bg-danger text-white text-center">
                    <h4 class="fw-bold mb-0">Đăng Nhập Quản Trị Viên</h4>
                </div>
                <div class="card-body p-4">
                    <% if ("invalid".equals(request.getParameter("error"))) { %>
                    <div class="alert alert-danger" role="alert">
                        Thông tin không chính xác!
                    </div>
                    <% } %>
                    <form action="${pageContext.request.contextPath}/dangnhapadmin" method="post">
                        <div class="mb-3">
                            <label class="form-label fw-bold">Tên đăng nhập</label>
                            <input type="text" class="form-control" name="username" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label fw-bold">Số điện thoại</label>
                            <input type="text" class="form-control" name="phone" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label fw-bold">Mật Khẩu</label>
                            <div class="input-group">
                                <input type="password" class="form-control" id="password" name="password" required>
                                <button type="button" class="btn btn-outline-secondary" onclick="togglePassword()">👁</button>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-danger w-100 fw-bold">Đăng Nhập</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
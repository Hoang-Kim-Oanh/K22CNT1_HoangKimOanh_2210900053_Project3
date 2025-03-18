<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    HttpSession userSession = request.getSession(false);
    if (userSession == null || userSession.getAttribute("adminUser") == null || userSession.isNew()) {
        if (!response.isCommitted()) {
            response.sendRedirect(request.getContextPath() + "/dangnhapadmin");
        }
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản Lý Giảng Viên - IELTS Arena</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<!-- Header -->
<jsp:include page="header.jsp"></jsp:include>

<div class="d-flex">
    <!-- Sidebar -->
    <jsp:include page="sidebar.jsp"></jsp:include>

    <!-- Nội dung chính -->
    <div class="container-fluid p-4" style="margin-left: 250px;">
        <h2 class="text-center mb-4">Quản Lý Giảng Viên</h2>

        <!-- Hiển thị thông báo lỗi -->
        <% if (request.getAttribute("error") != null) { %>
        <div class="alert alert-danger">
            <%= request.getAttribute("error") %>
        </div>
        <% } %>

        <!-- Form Thêm & Cập Nhật Giảng Viên -->
        <div class="card mb-4">
            <div class="card-header bg-primary text-white">Thêm / Cập Nhật Giảng Viên</div>
            <div class="card-body">
                <form action="giangvien" method="post">
                    <input type="hidden" name="action" id="action" value="add">
                    <input type="hidden" name="maGiangVien" id="maGiangVien">

                    <div class="mb-3">
                        <label class="form-label">Tên Giảng Viên</label>
                        <input type="text" class="form-control" name="tenGiangVien" id="tenGiangVien" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Email</label>
                        <input type="email" class="form-control" name="email" id="email" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Số Điện Thoại</label>
                        <input type="text" class="form-control" name="soDienThoai" id="soDienThoai" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Chuyên Môn</label>
                        <input type="text" class="form-control" name="chuyenMon" id="chuyenMon" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Mã Khóa Học</label>
                        <input type="text" class="form-control" name="maKhoaHoc" id="maKhoaHoc" required>
                    </div>
                    <button type="submit" class="btn btn-success">Lưu</button>
                    <button type="reset" class="btn btn-secondary">Làm Mới</button>
                </form>
            </div>
        </div>

        <!-- Danh sách Giảng Viên -->
        <table class="table table-striped table-hover">
            <thead class="table-dark">
            <tr>
                <th>Mã Giảng Viên</th>
                <th>Tên Giảng Viên</th>
                <th>Email</th>
                <th>Số Điện Thoại</th>
                <th>Chuyên Môn</th>
                <th>Mã Khóa Học</th>
                <th>Hành Động</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="giangVien" items="${danhSachGiangVien}">
                <tr>
                    <td>${giangVien.maGiangVien}</td>
                    <td>${giangVien.tenGiangVien}</td>
                    <td>${giangVien.email}</td>
                    <td>${giangVien.soDienThoai}</td>
                    <td>${giangVien.chuyenMon}</td>
                    <td>${giangVien.maKhoaHoc}</td>
                    <td>
                        <button class="btn btn-warning btn-sm"
                                onclick="editGiangVien('${giangVien.maGiangVien}', '${giangVien.tenGiangVien}',
                                        '${giangVien.email}', '${giangVien.soDienThoai}',
                                        '${giangVien.chuyenMon}', '${giangVien.maKhoaHoc}')">Sửa</button>
                        <a href="giangvien?action=delete&maGiangVien=${giangVien.maGiangVien}"
                           class="btn btn-danger btn-sm"
                           onclick="return confirm('Bạn có chắc muốn xóa không?')">Xóa</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<jsp:include page="footer.jsp"></jsp:include>

<script>
    function editGiangVien(maGiangVien, tenGiangVien, email, soDienThoai, chuyenMon, maKhoaHoc) {
        document.getElementById('maGiangVien').value = maGiangVien;
        document.getElementById('tenGiangVien').value = tenGiangVien;
        document.getElementById('email').value = email;
        document.getElementById('soDienThoai').value = soDienThoai;
        document.getElementById('chuyenMon').value = chuyenMon;
        document.getElementById('maKhoaHoc').value = maKhoaHoc;
        document.getElementById('action').value = "update";
    }
</script>

</body>
</html>

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
    <title>Quản Lý Đăng Ký - IELTS Arena</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="d-flex">
    <jsp:include page="sidebar.jsp"></jsp:include>
    <div class="container-fluid p-4" style="margin-left: 250px;">
        <h2 class="text-center mb-4">Quản Lý Đăng Ký</h2>

        <%-- Error message --%>
        <c:if test="${not empty error}">
            <div class="alert alert-danger" role="alert">${error}</div>
        </c:if>

        <%-- Form for Add/Update --%>
        <div class="card mb-4">
            <div class="card-header bg-primary text-white">Thêm / Cập Nhật Đăng Ký</div>
            <div class="card-body">
                <form action="dangkytaikhoan" method="post">
                    <input type="hidden" name="action" id="action" value="add">
                    <input type="hidden" name="maKhachDangKy" id="maKhachDangKy">

                    <div class="mb-3">
                        <label class="form-label">Họ Tên</label>
                        <input type="text" class="form-control" name="hoTen" id="hoTen" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Số Điện Thoại</label>
                        <input type="text" class="form-control" name="soDienThoai" id="soDienThoai" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Trạng Thái</label>
                        <select class="form-control" name="trangThai" id="trangThai">
                            <option value="Đã đăng ký">Đã đăng ký</option>
                            <option value="Đã hủy">Đã hủy</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Khóa Học</label>
                        <input type="text" class="form-control" name="khoaHoc" id="khoaHoc">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Ngày Đăng Ký (YYYY-MM-DD HH:MM)</label>
                        <input type="datetime-local" class="form-control" name="ngayDangKy" id="ngayDangKy">
                    </div>
                    <button type="submit" class="btn btn-success">Lưu</button>
                    <button type="reset" class="btn btn-secondary">Làm Mới</button>
                </form>
            </div>
        </div>

        <%-- Table to display registrations --%>
        <table class="table table-striped table-hover">
            <thead class="table-dark">
            <tr>
                <th>Mã Khách Đăng Ký</th>
                <th>Họ Tên</th>
                <th>Số Điện Thoại</th>
                <th>Trạng Thái</th>
                <th>Khóa Học</th>
                <th>Ngày Đăng Ký</th>
                <th>Hành Động</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="dangKy" items="${danhSachDangKy}">
                <tr>
                    <td>${dangKy.maKhachDangKy}</td>
                    <td>${dangKy.hoTen}</td>
                    <td>${dangKy.soDienThoai}</td>
                    <td>${dangKy.trangThai}</td>
                    <td>${dangKy.khoaHoc}</td>
                    <td>${dangKy.ngayDangKy}</td>
                    <td>
                        <button class="btn btn-warning btn-sm" onclick="editDangKy('${dangKy.maKhachDangKy}',
                                '${dangKy.hoTen}', '${dangKy.soDienThoai}', '${dangKy.trangThai}',
                                '${dangKy.khoaHoc}', '${dangKy.ngayDangKy}')">Sửa</button>
                        <a href="dangkytaikhoan?action=delete&maKhachDangKy=${dangKy.maKhachDangKy}"
                           class="btn btn-danger btn-sm"
                           onclick="return confirm('Bạn có chắc muốn xóa không?')">Xóa</a>
                    </td>
                </tr>
            </c:forEach>
            <c:if test="${empty danhSachDangKy}">
                <tr><td colspan="7" class="text-center">Không có đăng ký nào.</td></tr>
            </c:if>
            </tbody>
        </table>
    </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>

<script>
    function editDangKy(maKhachDangKy, hoTen, soDienThoai, trangThai, khoaHoc, ngayDangKy) {
        document.getElementById('maKhachDangKy').value = maKhachDangKy;
        document.getElementById('hoTen').value = hoTen;
        document.getElementById('soDienThoai').value = soDienThoai;
        document.getElementById('trangThai').value = trangThai;
        document.getElementById('khoaHoc').value = khoaHoc;
        // Format the Timestamp for datetime-local input (YYYY-MM-DDThh:mm)
        if (ngayDangKy) {
            // Convert the timestamp string to a format compatible with datetime-local
            const date = new Date(ngayDangKy);
            const formattedDate = date.toISOString().slice(0, 16); // e.g., 2023-05-20T15:30
            document.getElementById('ngayDangKy').value = formattedDate;
        } else {
            document.getElementById('ngayDangKy').value = '';
        }
        document.getElementById('action').value = "update";
    }
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
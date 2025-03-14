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
    <title>Quản Lý Tư Vấn Đăng Ký - IELTS Arena</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="d-flex">
    <jsp:include page="sidebar.jsp"></jsp:include>
    <div class="container-fluid p-4" style="margin-left: 250px;">
        <h2 class="text-center mb-4">Quản Lý Tư Vấn Đăng Ký</h2>

        <%-- Error message --%>
        <c:if test="${not empty error}">
            <div class="alert alert-danger" role="alert">${error}</div>
        </c:if>

        <%-- Form for Add/Update --%>
        <div class="card mb-4">
            <div class="card-header bg-primary text-white">Thêm / Cập Nhật Tư Vấn Đăng Ký</div>
            <div class="card-body">
                <form action="tuvandangky" method="post">
                    <input type="hidden" name="action" id="action" value="add">
                    <input type="hidden" name="maKhachVangLai" id="maKhachVangLai">

                    <div class="mb-3">
                        <label class="form-label">Họ Tên Khách</label>
                        <input type="text" class="form-control" name="hoTenKhach" id="hoTenKhach" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Số Điện Thoại</label>
                        <input type="text" class="form-control" name="soDienThoai" id="soDienThoai" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Yêu Cầu Tư Vấn</label>
                        <textarea class="form-control" name="yeuCauTuVan" id="yeuCauTuVan" rows="3"></textarea>
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

        <%-- Table to display consultation registrations --%>
        <table class="table table-striped table-hover">
            <thead class="table-dark">
            <tr>
                <th>Mã Khách Vãng Lai</th>
                <th>Họ Tên Khách</th>
                <th>Số Điện Thoại</th>
                <th>Yêu Cầu Tư Vấn</th>
                <th>Ngày Đăng Ký</th>
                <th>Hành Động</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="tuVan" items="${danhSachTuVan}">
                <tr>
                    <td>${tuVan.maKhachVangLai}</td>
                    <td>${tuVan.hoTenKhach}</td>
                    <td>${tuVan.soDienThoai}</td>
                    <td>${tuVan.yeuCauTuVan}</td>
                    <td>${tuVan.ngayDangKy}</td>
                    <td>
                        <button class="btn btn-warning btn-sm" onclick="editTuVan('${tuVan.maKhachVangLai}',
                                '${tuVan.hoTenKhach}', '${tuVan.soDienThoai}', '${tuVan.yeuCauTuVan}',
                                '${tuVan.ngayDangKy}')">Sửa</button>
                        <a href="tuvandangky?action=delete&maKhachVangLai=${tuVan.maKhachVangLai}"
                           class="btn btn-danger btn-sm"
                           onclick="return confirm('Bạn có chắc muốn xóa không?')">Xóa</a>
                    </td>
                </tr>
            </c:forEach>
            <c:if test="${empty danhSachTuVan}">
                <tr><td colspan="6" class="text-center">Không có tư vấn đăng ký nào.</td></tr>
            </c:if>
            </tbody>
        </table>
    </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>

<script>
    function editTuVan(maKhachVangLai, hoTenKhach, soDienThoai, yeuCauTuVan, ngayDangKy) {
        document.getElementById('maKhachVangLai').value = maKhachVangLai;
        document.getElementById('hoTenKhach').value = hoTenKhach;
        document.getElementById('soDienThoai').value = soDienThoai;
        document.getElementById('yeuCauTuVan').value = yeuCauTuVan || ''; // Handle null value
        if (ngayDangKy) {
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
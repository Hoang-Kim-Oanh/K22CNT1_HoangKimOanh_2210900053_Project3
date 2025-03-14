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
    <title>Quản Lý Học Viên - IELTS Arena</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="d-flex">
    <jsp:include page="sidebar.jsp"></jsp:include>
    <div class="container-fluid p-4" style="margin-left: 250px;">
        <h2 class="text-center mb-4">Quản Lý Học Viên</h2>

        <%-- Error message --%>
        <c:if test="${not empty error}">
            <div class="alert alert-danger" role="alert">${error}</div>
        </c:if>

        <%-- Form --%>
        <div class="card mb-4">
            <div class="card-header bg-primary text-white">Thêm / Cập Nhật Học Viên</div>
            <div class="card-body">
                <form action="hocvien" method="post">
                    <input type="hidden" name="action" id="action" value="add">
                    <input type="hidden" name="maHocVien" id="maHocVien">

                    <div class="mb-3">
                        <label class="form-label">Tên Học Viên</label>
                        <input type="text" class="form-control" name="tenHocVien" id="tenHocVien" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Ngày Sinh (YYYY-MM-DD)</label>
                        <input type="date" class="form-control" name="ngaySinh" id="ngaySinh" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Giới Tính</label>
                        <select class="form-control" name="gioiTinh" id="gioiTinh" required>
                            <option value="Nam">Nam</option>
                            <option value="Nữ">Nữ</option>
                            <option value="Khác">Khác</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Địa Chỉ</label>
                        <input type="text" class="form-control" name="diaChi" id="diaChi" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Email</label>
                        <input type="email" class="form-control" name="email" id="email" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Lịch Học</label>
                        <input type="text" class="form-control" name="lichHoc" id="lichHoc" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Điểm Số</label>
                        <input type="number" step="0.01" class="form-control" name="diemSo" id="diemSo" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Mật Khẩu</label>
                        <input type="password" class="form-control" name="matKhau" id="matKhau" required>
                    </div>
                    <button type="submit" class="btn btn-success">Lưu</button>
                    <button type="reset" class="btn btn-secondary">Làm Mới</button>
                </form>
            </div>
        </div>

        <%-- Table --%>
        <table class="table table-striped table-hover">
            <thead class="table-dark">
            <tr>
                <th>Mã HV</th>
                <th>Tên</th>
                <th>Ngày Sinh</th>
                <th>Giới Tính</th>
                <th>Địa Chỉ</th>
                <th>Email</th>
                <th>Lịch Học</th>
                <th>Điểm</th>
                <th>Hành Động</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="hocVien" items="${danhSachHocVien}">
                <tr>
                    <td>${hocVien.maHocVien}</td>
                    <td>${hocVien.tenHocVien}</td>
                    <td>${hocVien.ngaySinh}</td>
                    <td>${hocVien.gioiTinh}</td>
                    <td>${hocVien.diaChi}</td>
                    <td>${hocVien.email}</td>
                    <td>${hocVien.lichHoc}</td>
                    <td>${hocVien.diemSo}</td>
                    <td>
                        <button class="btn btn-warning btn-sm" onclick="editHocVien('${hocVien.maHocVien}',
                                '${hocVien.tenHocVien}', '${hocVien.ngaySinh}', '${hocVien.gioiTinh}',
                                '${hocVien.diaChi}', '${hocVien.email}', '${hocVien.lichHoc}', '${hocVien.diemSo}',
                                '${hocVien.matKhau}')">Sửa</button>
                        <a href="hocvien?action=delete&maHocVien=${hocVien.maHocVien}"
                           class="btn btn-danger btn-sm"
                           onclick="return confirm('Bạn có chắc muốn xóa không?')">Xóa</a>
                    </td>
                </tr>
            </c:forEach>
            <c:if test="${empty danhSachHocVien}">
                <tr><td colspan="9" class="text-center">Không có học viên nào.</td></tr>
            </c:if>
            </tbody>
        </table>
    </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>

<script>
    function editHocVien(maHocVien, tenHocVien, ngaySinh, gioiTinh, diaChi, email, lichHoc, diemSo, matKhau) {
        document.getElementById('maHocVien').value = maHocVien;
        document.getElementById('tenHocVien').value = tenHocVien;
        document.getElementById('ngaySinh').value = ngaySinh;
        document.getElementById('gioiTinh').value = gioiTinh;
        document.getElementById('diaChi').value = diaChi;
        document.getElementById('email').value = email;
        document.getElementById('lichHoc').value = lichHoc;
        document.getElementById('diemSo').value = diemSo;
        document.getElementById('matKhau').value = matKhau;
        document.getElementById('action').value = "update";
    }
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
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
    <title>Quản Lý Khóa Học - IELTS Arena</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="d-flex">
    <jsp:include page="sidebar.jsp"></jsp:include>
    <div class="container-fluid p-4" style="margin-left: 250px;">
        <h2 class="text-center mb-4">Quản Lý Khóa Học</h2>

        <%-- Error message --%>
        <c:if test="${not empty error}">
            <div class="alert alert-danger" role="alert">${error}</div>
        </c:if>

        <%-- Form for Add/Update --%>
        <div class="card mb-4">
            <div class="card-header bg-primary text-white">Thêm / Cập Nhật Khóa Học</div>
            <div class="card-body">
                <form action="qlykhoahoc" method="post">
                    <input type="hidden" name="action" id="action" value="add">
                    <input type="hidden" name="maKhoaHoc" id="maKhoaHoc">

                    <div class="mb-3">
                        <label class="form-label">Tên Khóa Học</label>
                        <input type="text" class="form-control" name="tenKhoaHoc" id="tenKhoaHoc" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Mô Tả</label>
                        <textarea class="form-control" name="moTa" id="moTa" rows="3"></textarea>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Trình Độ</label>
                        <select class="form-control" name="trinhDo" id="trinhDo" required>
                            <option value="Cơ bản">Cơ bản</option>
                            <option value="Trung cấp">Trung cấp</option>
                            <option value="Nâng cao">Nâng cao</option>
                            <option value="IELTS">IELTS</option>
                            <option value="TOEIC">TOEIC</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Học Phí</label>
                        <input type="number" step="0.01" class="form-control" name="hocPhi" id="hocPhi" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Thời Gian Học</label>
                        <input type="text" class="form-control" name="thoiGianHoc" id="thoiGianHoc">
                    </div>
                    <button type="submit" class="btn btn-success">Lưu</button>
                    <button type="reset" class="btn btn-secondary">Làm Mới</button>
                </form>
            </div>
        </div>

        <%-- Table to display courses --%>
        <table class="table table-striped table-hover">
            <thead class="table-dark">
            <tr>
                <th>Mã Khóa Học</th>
                <th>Tên Khóa Học</th>
                <th>Mô Tả</th>
                <th>Trình Độ</th>
                <th>Học Phí</th>
                <th>Thời Gian Học</th>
                <th>Hành Động</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="khoaHoc" items="${danhSachKhoaHoc}">
                <tr>
                    <td>${khoaHoc.maKhoaHoc}</td>
                    <td>${khoaHoc.tenKhoaHoc}</td>
                    <td>${khoaHoc.moTa}</td>
                    <td>${khoaHoc.trinhDo}</td>
                    <td>${khoaHoc.hocPhi}</td>
                    <td>${khoaHoc.thoiGianHoc}</td>
                    <td>
                        <button class="btn btn-warning btn-sm" onclick="editKhoaHoc('${khoaHoc.maKhoaHoc}',
                                '${khoaHoc.tenKhoaHoc}', '${khoaHoc.moTa}', '${khoaHoc.trinhDo}',
                                '${khoaHoc.hocPhi}', '${khoaHoc.thoiGianHoc}')">Sửa</button>
                        <a href="qlykhoahoc?action=delete&maKhoaHoc=${khoaHoc.maKhoaHoc}"
                           class="btn btn-danger btn-sm"
                           onclick="return confirm('Bạn có chắc muốn xóa không?')">Xóa</a>
                    </td>
                </tr>
            </c:forEach>
            <c:if test="${empty danhSachKhoaHoc}">
                <tr><td colspan="7" class="text-center">Không có khóa học nào.</td></tr>
            </c:if>
            </tbody>
        </table>
    </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>

<script>
    function editKhoaHoc(maKhoaHoc, tenKhoaHoc, moTa, trinhDo, hocPhi, thoiGianHoc) {
        document.getElementById('maKhoaHoc').value = maKhoaHoc;
        document.getElementById('tenKhoaHoc').value = tenKhoaHoc;
        document.getElementById('moTa').value = moTa || ''; // Handle null value
        document.getElementById('trinhDo').value = trinhDo;
        document.getElementById('hocPhi').value = hocPhi;
        document.getElementById('thoiGianHoc').value = thoiGianHoc || ''; // Handle null value
        document.getElementById('action').value = "update";
    }
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
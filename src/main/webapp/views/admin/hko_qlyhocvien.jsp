<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${param.section == 'hocvien'}">
    <div class="container mt-4">
        <div class="card shadow">
            <div class="card-header bg-primary text-white">
                <h4 class="mb-0">Quản Lý Học Viên</h4>
            </div>
            <div class="card-body">
                <!-- Thanh công cụ -->
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <a href="${pageContext.request.contextPath}/admin/addhocvien" class="btn btn-success">
                        <i class="bi bi-plus-circle"></i> Thêm Học Viên
                    </a>
                    <div class="input-group w-25">
                        <span class="input-group-text"><i class="bi bi-search"></i></span>
                        <input type="text" class="form-control" id="searchInput" placeholder="Tìm kiếm...">
                    </div>
                </div>

                <!-- Bảng danh sách học viên -->
                <div class="table-responsive">
                    <table class="table table-hover text-center align-middle">
                        <thead class="table-dark">
                        <tr>
                            <th>Mã Học Viên</th>
                            <th>Họ Tên</th>
                            <th>Ngày Sinh</th>
                            <th>Giới Tính</th>
                            <th>Địa Chỉ</th>
                            <th>Email</th>
                            <th>Hành Động</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="hocvien" items="${danhSachHocVien}">
                            <tr>
                                <td>${hocvien.maHocVien}</td>
                                <td>${hocvien.hoTen}</td>
                                <td>${hocvien.ngaySinh}</td>
                                <td>${hocvien.gioiTinh}</td>
                                <td>${hocvien.diaChi}</td>
                                <td>${hocvien.email}</td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/admin/editHocVien?id=${hocvien.maHocVien}" class="btn btn-primary btn-sm">
                                        <i class="bi bi-pencil"></i> Sửa
                                    </a>
                                    <a href="${pageContext.request.contextPath}/admin/deleteHocVien?id=${hocvien.maHocVien}" class="btn btn-danger btn-sm" onclick="return confirm('Bạn có chắc muốn xóa học viên này?');">
                                        <i class="bi bi-trash"></i> Xóa
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                        <c:if test="${empty danhSachHocVien}">
                            <tr>
                                <td colspan="7" class="text-center text-danger">Không có học viên nào trong hệ thống.</td>
                            </tr>
                        </c:if>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</c:if>

<!-- Script tìm kiếm -->
<script>
    document.getElementById("searchInput").addEventListener("keyup", function () {
        let filter = this.value.toUpperCase();
        let rows = document.querySelectorAll("tbody tr");
        rows.forEach(row => {
            let text = row.textContent || row.innerText;
            row.style.display = text.toUpperCase().includes(filter) ? "" : "none";
        });
    });
</script>

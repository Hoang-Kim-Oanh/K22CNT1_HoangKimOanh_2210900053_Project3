<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${param.section == 'dangnhaphocvien'}">
    <div class="container mt-4">
        <div class="card shadow">
            <div class="card-header bg-primary text-white">
                <h4 class="mb-0">Quản Lý Tài Khoản Học Viên</h4>
            </div>
            <div class="card-body">
                <!-- Thanh công cụ -->
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <a href="${pageContext.request.contextPath}/admin/addStudentAccount" class="btn btn-success">
                        <i class="bi bi-plus-circle"></i> Thêm Tài Khoản
                    </a>
                    <div class="input-group w-25">
                        <span class="input-group-text"><i class="bi bi-search"></i></span>
                        <input type="text" class="form-control" id="searchInput" placeholder="Tìm kiếm...">
                    </div>
                </div>

                <!-- Bảng danh sách tài khoản học viên -->
                <div class="table-responsive">
                    <table class="table table-hover text-center align-middle">
                        <thead class="table-dark">
                        <tr>
                            <th>Mã Học Viên</th>
                            <th>Tên Học Viên</th>
                            <th>Mật Khẩu</th>
                            <th>Ngày Đăng Ký</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="hocVien" items="${danhSachHocVien}">
                            <tr>
                                <td>${hocVien.maHocVien}</td>
                                <td>${hocVien.tenHocVien}</td>
                                <td>
                                    <span class="text-muted">••••••••</span>
                                </td>
                                <td>${hocVien.ngayDangKy}</td>
                            </tr>
                        </c:forEach>
                        <c:if test="${empty danhSachHocVien}">
                            <tr>
                                <td colspan="4" class="text-center text-danger">Không có tài khoản học viên nào trong hệ thống.</td>
                            </tr>
                        </c:if>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</c:if>

<!-- Bootstrap Search Script -->
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

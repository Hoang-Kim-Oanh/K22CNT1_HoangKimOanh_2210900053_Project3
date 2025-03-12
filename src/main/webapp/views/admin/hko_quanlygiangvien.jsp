<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${param.section == 'teachers'}">
    <div class="container mt-4">
        <div class="card shadow">
            <div class="card-header bg-primary text-white">
                <h4 class="mb-0">Quản Lý Giảng Viên</h4>
            </div>
            <div class="card-body">
                <!-- Thanh công cụ -->
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <a href="${pageContext.request.contextPath}/admin/addTeacher" class="btn btn-success">
                        <i class="bi bi-plus-circle"></i> Thêm Giảng Viên
                    </a>
                    <div class="input-group w-25">
                        <span class="input-group-text"><i class="bi bi-search"></i></span>
                        <input type="text" class="form-control" id="searchInput" placeholder="Tìm kiếm...">
                    </div>
                </div>

                <!-- Bảng danh sách giảng viên -->
                <div class="table-responsive">
                    <table class="table table-hover text-center align-middle">
                        <thead class="table-dark">
                        <tr>
                            <th>Mã Giảng Viên</th>
                            <th>Tên Giảng Viên</th>
                            <th>Email</th>
                            <th>Số Điện Thoại</th>
                            <th>Chuyên Môn</th>
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
                                <td>
                                    <a href="${pageContext.request.contextPath}/admin/editTeacher?id=${giangVien.id}" class="btn btn-primary btn-sm">
                                        <i class="bi bi-pencil"></i> Sửa
                                    </a>
                                    <a href="${pageContext.request.contextPath}/admin/deleteTeacher?id=${giangVien.id}" class="btn btn-danger btn-sm" onclick="return confirm('Bạn có chắc muốn xóa giảng viên này?');">
                                        <i class="bi bi-trash"></i> Xóa
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                        <c:if test="${empty danhSachGiangVien}">
                            <tr>
                                <td colspan="6" class="text-center text-danger">Không có giảng viên nào trong hệ thống.</td>
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

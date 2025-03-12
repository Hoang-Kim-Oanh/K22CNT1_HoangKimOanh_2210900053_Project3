<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${param.section == 'khoahoc'}">
    <div class="container mt-4">
        <div class="card shadow">
            <div class="card-header bg-primary text-white d-flex justify-content-between align-items-center">
                <h4 class="mb-0">Quản Lý Khóa Học</h4>
                <a href="${pageContext.request.contextPath}/admin/addCourse" class="btn btn-light">
                    <i class="bi bi-plus-circle"></i> Thêm Khóa Học
                </a>
            </div>
            <div class="card-body">
                <!-- Thanh tìm kiếm -->
                <div class="input-group mb-3 w-50">
                    <span class="input-group-text"><i class="bi bi-search"></i></span>
                    <input type="text" class="form-control" id="searchInput" placeholder="Tìm kiếm khóa học...">
                </div>

                <!-- Bảng danh sách khóa học -->
                <div class="table-responsive">
                    <table class="table table-hover align-middle text-center">
                        <thead class="table-dark">
                        <tr>
                            <th>Mã</th>
                            <th>Tên Khóa Học</th>
                            <th>Mô Tả</th>
                            <th>Trình Độ</th>
                            <th>Học Phí</th>
                            <th>Thời Gian</th>
                            <th>Hành Động</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="khoaHoc" items="${danhSachKhoaHoc}">
                            <tr>
                                <td>${khoaHoc.maKhoaHoc}</td>
                                <td class="text-start">${khoaHoc.tenKhoaHoc}</td>
                                <td class="text-start">${khoaHoc.moTa}</td>
                                <td>${khoaHoc.trinhDo}</td>
                                <td>${khoaHoc.hocPhi} VND</td>
                                <td>${khoaHoc.thoiGianHoc}</td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/admin/editCourse?id=${khoaHoc.maKhoaHoc}" class="btn btn-primary btn-sm">
                                        <i class="bi bi-pencil"></i> Sửa
                                    </a>
                                    <a href="${pageContext.request.contextPath}/admin/deleteCourse?id=${khoaHoc.maKhoaHoc}" class="btn btn-danger btn-sm" onclick="return confirm('Bạn có chắc muốn xóa khóa học này?');">
                                        <i class="bi bi-trash"></i> Xóa
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                        <c:if test="${empty danhSachKhoaHoc}">
                            <tr>
                                <td colspan="7" class="text-center text-danger">Không có khóa học nào trong hệ thống.</td>
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

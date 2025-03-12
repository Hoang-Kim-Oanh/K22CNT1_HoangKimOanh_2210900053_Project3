<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${param.section == 'lichhoc'}">
    <div class="container mt-4">
        <div class="card shadow">
            <div class="card-header bg-primary text-white">
                <h4 class="mb-0">Quản Lý Lịch Học</h4>
            </div>
            <div class="card-body">
                <!-- Thanh công cụ -->
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <a href="${pageContext.request.contextPath}/admin/addSchedule" class="btn btn-success">
                        <i class="bi bi-plus-circle"></i> Thêm Lịch Học
                    </a>
                    <div class="input-group w-25">
                        <span class="input-group-text"><i class="bi bi-search"></i></span>
                        <input type="text" class="form-control" id="searchInput" placeholder="Tìm kiếm...">
                    </div>
                </div>

                <!-- Bảng lịch học -->
                <div class="table-responsive">
                    <table class="table table-hover text-center align-middle">
                        <thead class="table-dark">
                        <tr>
                            <th>Mã Học Viên</th>
                            <th>Môn Học</th>
                            <th>Ngày</th>
                            <th>Giờ</th>
                            <th>Phòng</th>
                            <th>Trạng Thái</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="lichHoc" items="${danhSachLichHoc}">
                            <tr>
                                <td>${lichHoc.maHocVien}</td>
                                <td>${lichHoc.monHoc}</td>
                                <td>${lichHoc.ngay}</td>
                                <td>${lichHoc.gio}</td>
                                <td>${lichHoc.phong}</td>
                                <td>
                                        <span class="badge
                                            <c:choose>
                                                <c:when test="${lichHoc.ngay == ngayHienTai}">bg-success</c:when>
                                                <c:when test="${lichHoc.ngay > ngayHienTai}">bg-primary</c:when>
                                                <c:otherwise>bg-danger</c:otherwise>
                                            </c:choose>">
                                            <c:choose>
                                                <c:when test="${lichHoc.ngay == ngayHienTai}">Hôm nay</c:when>
                                                <c:when test="${lichHoc.ngay > ngayHienTai}">Sắp diễn ra</c:when>
                                                <c:otherwise>Đã qua</c:otherwise>
                                            </c:choose>
                                        </span>
                                </td>
                            </tr>
                        </c:forEach>
                        <c:if test="${empty danhSachLichHoc}">
                            <tr>
                                <td colspan="6" class="text-center text-danger">Không có lịch học nào trong hệ thống.</td>
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

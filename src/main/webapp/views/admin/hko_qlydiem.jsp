<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${param.section == 'diemso'}">
    <div class="container mt-4">
        <div class="row">
            <div class="col-12">
                <h1 class="display-5 text-primary mb-4 text-center fw-bold">
                    📊 Quản Lý Điểm Số
                </h1>

                <!-- Nút thêm điểm số -->
                <div class="text-end mb-3">
                    <a href="${pageContext.request.contextPath}/admin/addScore" class="btn btn-success btn-lg">
                        <i class="bi bi-plus-circle"></i> Thêm Điểm Số
                    </a>
                </div>

                <!-- Bảng danh sách điểm số -->
                <div class="table-responsive">
                    <table class="table table-striped table-hover align-middle text-center">
                        <thead class="table-dark">
                        <tr>
                            <th>Mã Học Viên</th>
                            <th>Họ Tên</th>
                            <th>Nghe</th>
                            <th>Nói</th>
                            <th>Viết</th>
                            <th>Điểm Trung Bình</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="diemSo" items="${danhSachDiemSo}">
                            <c:set var="diemTB" value="${(diemSo.diemNghe + diemSo.diemNoi + diemSo.diemViet) / 3}" />
                            <tr>
                                <td><span class="badge bg-secondary">${diemSo.maHocVien}</span></td>
                                <td class="fw-bold text-primary">${diemSo.tenHocVien}</td>
                                <td>${diemSo.diemNghe}</td>
                                <td>${diemSo.diemNoi}</td>
                                <td>${diemSo.diemViet}</td>
                                <td>
                                    <span class="badge
                                        <c:choose>
                                            <c:when test="${diemTB >= 8}">bg-success</c:when>
                                            <c:when test="${diemTB >= 5}">bg-warning</c:when>
                                            <c:otherwise>bg-danger</c:otherwise>
                                        </c:choose>">
                                            ${String.format("%.2f", diemTB)}
                                    </span>
                                </td>
                            </tr>
                        </c:forEach>

                        <!-- Nếu danh sách rỗng -->
                        <c:if test="${empty danhSachDiemSo}">
                            <tr>
                                <td colspan="6" class="text-center text-danger fw-bold py-3">
                                    🚨 Không có điểm số nào trong hệ thống.
                                </td>
                            </tr>
                        </c:if>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</c:if>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${param.section == 'dangkytaikhoan'}">
    <div class="container mt-4">
        <div class="row">
            <div class="col-12">
                <h1 class="display-5 text-primary mb-4 text-center fw-bold">
                    Quản Lý Đăng Ký Tài Khoản
                </h1>

                <!-- Nút thêm đăng ký tài khoản -->
                <div class="text-end mb-3">
                    <a href="${pageContext.request.contextPath}/admin/addRegistration" class="btn btn-success btn-lg">
                        <i class="bi bi-person-plus"></i> Thêm Đăng Ký
                    </a>
                </div>

                <!-- Bảng danh sách đăng ký tài khoản -->
                <div class="table-responsive">
                    <table class="table table-striped table-hover align-middle">
                        <thead class="table-dark text-center">
                        <tr>
                            <th>Mã Đăng Ký</th>
                            <th>Họ Tên</th>
                            <th>Số Điện Thoại</th>
                            <th>Trạng Thái</th>
                            <th>Khóa Học</th>
                            <th>Ngày Đăng Ký</th>
                        </tr>
                        </thead>
                        <tbody class="text-center">
                        <c:forEach var="dangKy" items="${danhSachDangKy}">
                            <tr>
                                <td><span class="badge bg-secondary">${dangKy.maKhachDangKy}</span></td>
                                <td class="fw-bold text-primary">${dangKy.hoTen}</td>
                                <td>${dangKy.soDienThoai}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${dangKy.trangThai == 'Đang chờ'}">
                                            <span class="badge bg-warning text-dark">
                                                🔴 Đang chờ
                                            </span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="badge bg-success">
                                                🟢 Đã duyệt
                                            </span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td class="text-uppercase">${dangKy.khoaHoc}</td>
                                <td>${dangKy.ngayDangKy}</td>
                            </tr>
                        </c:forEach>

                        <!-- Nếu danh sách rỗng -->
                        <c:if test="${empty danhSachDangKy}">
                            <tr>
                                <td colspan="6" class="text-center text-danger fw-bold py-3">
                                    🚨 Không có đăng ký tài khoản nào trong hệ thống.
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

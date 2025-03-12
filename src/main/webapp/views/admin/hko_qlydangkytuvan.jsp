<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${param.section == 'dangkytuvan'}">
    <div class="container mt-4">
        <div class="row">
            <div class="col-12">
                <h1 class="display-5 text-primary mb-4 text-center fw-bold">
                    Quản Lý Đăng Ký Tư Vấn
                </h1>

                <!-- Nút thêm đăng ký tư vấn -->
                <div class="text-end mb-3">
                    <a href="${pageContext.request.contextPath}/admin/addConsultation" class="btn btn-success btn-lg">
                        <i class="bi bi-person-plus-fill"></i> Thêm Đăng Ký
                    </a>
                </div>

                <!-- Bảng danh sách đăng ký tư vấn -->
                <div class="table-responsive">
                    <table class="table table-striped table-hover align-middle">
                        <thead class="table-dark text-center">
                        <tr>
                            <th>Mã Khách Vãng Lai</th>
                            <th>Họ Tên Khách</th>
                            <th>Số Điện Thoại</th>
                            <th>Yêu Cầu Tư Vấn</th>
                            <th>Ngày Đăng Ký</th>
                        </tr>
                        </thead>
                        <tbody class="text-center">
                        <c:forEach var="tuVan" items="${danhSachTuVan}">
                            <tr>
                                <td><span class="badge bg-secondary">${tuVan.maKhachVangLai}</span></td>
                                <td class="fw-bold text-primary">${tuVan.hoTenKhach}</td>
                                <td>${tuVan.soDienThoai}</td>
                                <td class="text-wrap">${tuVan.yeuCauTuVan}</td>
                                <td>${tuVan.ngayDangKy}</td>
                            </tr>
                        </c:forEach>

                        <!-- Nếu danh sách rỗng -->
                        <c:if test="${empty danhSachTuVan}">
                            <tr>
                                <td colspan="5" class="text-center text-danger fw-bold py-3">
                                    🚨 Không có đăng ký tư vấn nào trong hệ thống.
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

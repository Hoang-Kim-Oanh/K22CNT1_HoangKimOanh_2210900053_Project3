<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- Header (Navbar) -->
<nav class="navbar navbar-expand-lg navbar-light bg-white sticky-top border border-danger">
    <div class="container-fluid">
        <!-- Logo bên trái -->
        <a class="navbar-brand" href="#">
            <img src="${pageContext.request.contextPath}/images/ieltstrenheader.jpg" alt="IELTS Logo" height="50" class="d-inline-block align-text-top">
        </a>
        <!-- Nút hamburger cho mobile -->
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <!-- Menu điều hướng ở giữa -->
        <div class="collapse navbar-collapse justify-content-center" id="navbarNav">
            <ul class="navbar-nav mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active fw-bold" aria-current="page" href="${pageContext.request.contextPath}/home">Về chúng tôi</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link fw-bold" href="${pageContext.request.contextPath}/doingugiaovien">Giảng viên</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link fw-bold" href="${pageContext.request.contextPath}/khoahoc">Khóa học</a> <!-- Đổi thành /khoahoc -->
                </li>
            </ul>
        </div>
        <!-- Thanh tìm kiếm, nút Tư vấn và Đăng ký bên phải -->
        <nav class="navbar navbar-expand-lg navbar-light bg-white py-3">
            <div class="container">
                <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                    <div class="d-flex align-items-center">
                        <button id="consultBtn" class="btn btn-danger rounded-pill me-2" data-bs-toggle="modal" data-bs-target="#consultModal">Tư vấn</button>
                        <button class="btn btn-danger rounded-pill" data-bs-toggle="modal" data-bs-target="#registrationModal">Đăng ký</button>
                        <form class="d-flex ms-2" role="search">
                            <div class="input-group">
                                <input class="form-control form-control-sm fw-bold" type="search" placeholder="Tìm kiếm..." aria-label="Search">
                                <button class="btn btn-outline-danger btn-sm" type="submit">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                                        <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85zm-5.242 0a5.5 5.5 0 1 1 0-11 5.5 5.5 0 1 1 0 11z"/>
                                    </svg>
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </nav>
        <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
            <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0"/>
            <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8m8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1"/>
        </svg>
    </div>
</nav>
<!-- Nhúng nội dung modal từ tuvandangki.jsp -->
<jsp:include page="tuvandangki.jsp" />
<!-- Nhúng nội dung modal từ Dangkyweb_hko.jsp -->
<jsp:include page="Dangkyweb_hko.jsp" />
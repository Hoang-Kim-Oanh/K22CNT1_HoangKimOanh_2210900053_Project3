<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<%
    HttpSession userSession = request.getSession(false);

    if (userSession == null || userSession.getAttribute("adminUser") == null || userSession.isNew()) {
        if (!response.isCommitted()) {
            response.sendRedirect(request.getContextPath() + "/dangnhapadmin");
        }
        return;
    }
%>

<html>
<head>
    <title>Trang Quản Trị Viên</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Mono:wght@500&display=swap" rel="stylesheet">
</head>
<body>

<!-- Sidebar -->
<div style="background-color: #000000; width: 250px; height: 100vh; position: fixed; top: 0; left: 0; padding-top: 20px;">
    <ul class="nav flex-column">
        <div class="text-center">
            <h4 style="color: #ffffff; font-size: 1.5rem; font-family: 'Roboto Mono', monospace;">ORIOLD</h4>
        </div>
        <li class="nav-item" style="margin-top: 3rem;">
            <a class="nav-link active text-white" href="${pageContext.request.contextPath}/homeadmin?section=teachers">
                <i class="bi bi-person"></i> Giảng viên
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link active text-white" href="${pageContext.request.contextPath}/homeadmin?section=hocvien">
                <i class="bi bi-person"></i> Học Viên
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link text-white" href="${pageContext.request.contextPath}/homeadmin?section=khoahoc">
                <i class="bi bi-book"></i> Khóa học
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link text-white" href="${pageContext.request.contextPath}/homeadmin?section=dangnhaphocvien">
                <i class="bi bi-box-arrow-in-right"></i> Đăng nhập học viên
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link text-white" href="${pageContext.request.contextPath}/homeadmin?section=dangkytaikhoan">
                <i class="bi bi-person-plus"></i> Đăng ký tài khoản
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link text-white" href="${pageContext.request.contextPath}/homeadmin?section=dangkytuvan">
                <i class="bi bi-headset"></i> Đăng ký tư vấn
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link text-white" href="${pageContext.request.contextPath}/homeadmin?section=lichhoc">
                <i class="bi bi-calendar"></i> Lịch học
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link text-white" href="${pageContext.request.contextPath}/homeadmin?section=diemso">
                <i class="bi bi-clipboard-data"></i> Điểm số
            </a>
        </li>
    </ul>
</div>

<!-- Nội dung chính -->
<div style="margin-left: 250px;">
    <!-- Navbar -->
    <nav class="navbar sticky-top" style="background-color: #800000; min-height: 70px;">
        <div class="container-fluid d-flex align-items-center justify-content-between">
            <a class="navbar-brand p-0" href="#">
                <img src="${pageContext.request.contextPath}/images/ieltstrenheader.jpg" alt="IELTS Logo" class="img-fluid" style="height: 60px;">
            </a>
            <h3 class="text-white text-center flex-grow-1 mb-0">Quản Trị Viên</h3>
            <div class="dropdown">
                <a class="text-decoration-none d-flex align-items-center text-white" data-bs-toggle="dropdown">
                    <h5 class="mb-0">Đăng Xuất <i class="bi bi-box-arrow-in-right"></i></h5>
                </a>
                <ul class="dropdown-menu dropdown-menu-end">
                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/logout">Đăng Xuất</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Nội dung chính -->
    <div class="container mt-4">
        <div class="row">
            <div class="col-12">
                <%-- Hiển thị trang tương ứng dựa trên tham số section --%>
                <c:if test="${param.section == 'teachers'}">
                    <jsp:include page="hko_quanlygiangvien.jsp" />
                </c:if>

                <c:if test="${param.section == 'hocvien'}">
                    <jsp:include page="hko_qlyhocvien.jsp" />
                </c:if>

                <c:if test="${param.section == 'khoahoc'}">
                    <jsp:include page="hko_quanlykhoahoc.jsp" />
                </c:if>

                <c:if test="${param.section == 'dangnhaphocvien'}">
                    <jsp:include page="hko_quanlydangnhaphocvien.jsp" />
                </c:if>

                <c:if test="${param.section == 'dangkytaikhoan'}">
                    <jsp:include page="hko_qlydangkytaikhoan.jsp" />
                </c:if>

                <c:if test="${param.section == 'dangkytuvan'}">
                    <jsp:include page="hko_qlydangkytuvan.jsp" />
                </c:if>

                <c:if test="${param.section == 'lichhoc'}">
                    <jsp:include page="hko_qlylichhoc.jsp" />
                </c:if>

                <c:if test="${param.section == 'diemso'}">
                    <jsp:include page="hko_qlydiem.jsp" />
                </c:if>
            </div>
        </div>
    </div>
</div>

</body>
</html>

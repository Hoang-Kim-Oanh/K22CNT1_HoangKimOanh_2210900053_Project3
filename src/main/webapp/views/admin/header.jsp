<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<header>
    <nav class="navbar navbar-expand-lg navbar-dark" style="background-color: #800000;">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">
                <img src="${pageContext.request.contextPath}/images/ieltstrenheader.jpg" alt="IELTS Logo" style="height: 60px;">
            </a>
            <h3 class="text-white mx-auto">Quản Trị Viên</h3>
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
</header>

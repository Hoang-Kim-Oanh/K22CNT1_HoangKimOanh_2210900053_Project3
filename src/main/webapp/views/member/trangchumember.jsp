<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Trang Chủ Thành Viên</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark" style="background-color: #800000; min-height: 70px;">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">
            <img src="${pageContext.request.contextPath}/images/ieltstrenheader.jpg" alt="IELTS Logo" class="img-fluid" style="height: 50px;">
        </a>
        <h3 class="text-white text-center flex-grow-1 mb-0">Cổng thông tin học viên</h3>
        <div class="dropdown">
            <a class="text-white text-decoration-none d-flex align-items-center" data-bs-toggle="dropdown">
                <h5 class="mb-0">Đăng Xuất <i class="bi bi-box-arrow-in-right"></i></h5>
            </a>
            <ul class="dropdown-menu dropdown-menu-end">
                <li><a class="dropdown-item" href="logout.jsp">Đăng xuất</a></li>
            </ul>
        </div>
    </div>
</nav>

<!-- Container chính -->
<div class="container-fluid">
    <div class="row">
        <!-- Sidebar -->
        <div class="col-md-3 bg-dark text-white vh-100 p-4">
            <h5 class="fw-bold border-bottom pb-2">${tenHocVien}</h5>
            <p class="small">Mã Học Viên: ${maHocVien}</p>
            <p class="small">Ngày sinh: ${ngaySinh}</p>
            <p class="small">Giới tính: ${gioiTinh}</p>
            <p class="small">Địa Chỉ: ${diaChi}</p>
            <p class="small">Gmail: ${email}</p>
            <hr>
            <ul class="list-unstyled">
                <li class="mb-2"><a href="#" class="text-white text-decoration-none menu-link" data-page="diemso.jsp">Điểm Số</a></li>
                <li class="mb-2"><a href="#" class="text-white text-decoration-none menu-link" data-page="lichhoc_hko.jsp">Lịch Học</a></li>
            </ul>
        </div>

        <!-- Nội dung chính -->
        <div class="col-md-9 p-4">
            <div id="content-area" class="text-center">
                <h3 class="text-danger">Chào mừng <%= request.getAttribute("tenHocVien") %> đến với cổng thông tin học viên!</h3>
            </div>
        </div>
    </div>
</div>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- Script xử lý AJAX -->
<script>
    document.addEventListener("DOMContentLoaded", function () {
        document.querySelectorAll(".menu-link").forEach(link => {
            link.addEventListener("click", function (event) {
                event.preventDefault();
                let page = this.getAttribute("data-page");
                fetch("views/member/" + page)
                    .then(response => response.text())
                    .then(data => {
                        document.getElementById("content-area").innerHTML = data;
                    })
                    .catch(error => console.error("Lỗi tải trang:", error));
            });
        });
    });
</script>

</body>
</html>

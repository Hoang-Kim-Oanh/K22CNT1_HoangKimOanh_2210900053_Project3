<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div style="background-color: #000000; width: 250px; height: 100vh; position: fixed; top: 0; left: 0; padding-top: 20px;">
  <ul class="nav flex-column">
    <div class="text-center">
      <h4 style="color: #ffffff; font-size: 1.5rem; font-family: 'Roboto Mono', monospace;">ORIOLD</h4>
    </div>
    <li class="nav-item" style="margin-top: 3rem;">
      <a class="nav-link active text-white" href="${pageContext.request.contextPath}/giangvien">
        <i class="bi bi-person"></i> Giảng viên
      </a>
    </li>
    <li class="nav-item">
      <a class="nav-link active text-white" href="${pageContext.request.contextPath}/hocvien">
        <i class="bi bi-person"></i> Học Viên
      </a>
    </li>
    <li class="nav-item">
      <a class="nav-link text-white" href="${pageContext.request.contextPath}/qlykhoahoc">
        <i class="bi bi-book"></i> Khóa học
      </a>
    </li>
    <li class="nav-item">
      <a class="nav-link text-white" href="${pageContext.request.contextPath}/dangkytaikhoan">
        <i class="bi bi-person-plus"></i> Đăng ký tài khoản
      </a>
    </li>
    <li class="nav-item">
      <a class="nav-link text-white" href="${pageContext.request.contextPath}/tuvandangky">
        <i class="bi bi-headset"></i> Đăng ký tư vấn
      </a>
    </li>
  </ul>
</div>

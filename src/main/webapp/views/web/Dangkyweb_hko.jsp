<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="modal fade" id="registrationModal" tabindex="-1" aria-labelledby="registrationModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content bg-primary text-white" style="background-color:#800000 !important;">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="registrationModalLabel">ĐĂNG KÝ KHÓA HỌC</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p class="text-center mb-4">Ưu đãi lên tới 50% khi đăng ký hôm nay</p>
                <div class="text-center mb-3">
                    <span class="badge bg-danger">Khóa 0 - 7.0 IELTS</span>
                </div>
                <form action="${pageContext.request.contextPath}/submitRegistration" method="post">
                <div class="mb-3">
                        <label for="hoten" class="form-label">Họ tên</label>
                        <input type="text" class="form-control" id="hoten" name="hoten" required>
                    </div>
                    <div class="mb-3">
                        <label for="sodienthoai" class="form-label">Số điện thoại</label>
                        <input type="tel" class="form-control" id="sodienthoai" name="sodienthoai" required>
                    </div>
                    <div class="mb-3">
                        <label for="bandangla" class="form-label">Bạn đang là</label>
                        <select class="form-select" id="bandangla" name="bandangla" required>
                            <option value="hocsinh">Học sinh</option>
                            <option value="sinhvien">Sinh viên</option>
                            <option value="nguoilamviec">Người làm việc</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="muctieuIELTS" class="form-label">Mục tiêu IELTS của bạn</label>
                        <select class="form-select" id="muctieuIELTS" name="muctieuIELTS" required>
                            <option value="6.5">6.5</option>
                            <option value="7.0">7.0</option>
                            <option value="7.5">7.5</option>
                            <option value="8.0">8.0</option>
                            <option value="8.5">8.5</option>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-danger w-100">ĐĂNG KÝ NGAY</button>
                </form>
            </div>
        </div>
    </div>
</div>

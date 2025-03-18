package model;

public class GiangVien_hko {
    private int maGiangVien;
    private String tenGiangVien;
    private String email;
    private String soDienThoai;
    private String chuyenMon;
    private int maKhoaHoc;

    public GiangVien_hko() {
    }

    public GiangVien_hko(int maGiangVien, String tenGiangVien, String email, String soDienThoai, String chuyenMon) {
        this.maGiangVien = maGiangVien;
        this.tenGiangVien = tenGiangVien;
        this.email = email;
        this.soDienThoai = soDienThoai;
        this.chuyenMon = chuyenMon;
        this.maKhoaHoc = maKhoaHoc;
    }

    public int getMaKhoaHoc() {
        return maKhoaHoc;
    }

    public void setMaKhoaHoc(int maKhoaHoc) {
        this.maKhoaHoc = maKhoaHoc;
    }

    public int getMaGiangVien() {
        return maGiangVien;
    }

    public void setMaGiangVien(int maGiangVien) {
        this.maGiangVien = maGiangVien;
    }

    public String getTenGiangVien() {
        return tenGiangVien;
    }

    public void setTenGiangVien(String tenGiangVien) {
        this.tenGiangVien = tenGiangVien;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSoDienThoai() {
        return soDienThoai;
    }

    public void setSoDienThoai(String soDienThoai) {
        this.soDienThoai = soDienThoai;
    }

    public String getChuyenMon() {
        return chuyenMon;
    }

    public void setChuyenMon(String chuyenMon) {
        this.chuyenMon = chuyenMon;
    }
}
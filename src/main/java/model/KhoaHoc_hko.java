package model;

public class KhoaHoc_hko {
    private int maKhoaHoc;
    private String tenKhoaHoc;
    private String moTa;
    private String trinhDo;
    private double hocPhi;
    private String thoiGianHoc;

    // Constructor mặc định
    public KhoaHoc_hko() {
    }

    // Constructor đầy đủ
    public KhoaHoc_hko(int maKhoaHoc, String tenKhoaHoc, String moTa, String trinhDo, double hocPhi, String thoiGianHoc) {
        this.maKhoaHoc = maKhoaHoc;
        this.tenKhoaHoc = tenKhoaHoc;
        this.moTa = moTa;
        this.trinhDo = trinhDo;
        this.hocPhi = hocPhi;
        this.thoiGianHoc = thoiGianHoc;
    }

    // Getter và Setter
    public int getMaKhoaHoc() {
        return maKhoaHoc;
    }

    public void setMaKhoaHoc(int maKhoaHoc) {
        this.maKhoaHoc = maKhoaHoc;
    }

    public String getTenKhoaHoc() {
        return tenKhoaHoc;
    }

    public void setTenKhoaHoc(String tenKhoaHoc) {
        this.tenKhoaHoc = tenKhoaHoc;
    }

    public String getMoTa() {
        return moTa;
    }

    public void setMoTa(String moTa) {
        this.moTa = moTa;
    }

    public String getTrinhDo() {
        return trinhDo;
    }

    public void setTrinhDo(String trinhDo) {
        this.trinhDo = trinhDo;
    }

    public double getHocPhi() {
        return hocPhi;
    }

    public void setHocPhi(double hocPhi) {
        this.hocPhi = hocPhi;
    }

    public String getThoiGianHoc() {
        return thoiGianHoc;
    }

    public void setThoiGianHoc(String thoiGianHoc) {
        this.thoiGianHoc = thoiGianHoc;
    }
}
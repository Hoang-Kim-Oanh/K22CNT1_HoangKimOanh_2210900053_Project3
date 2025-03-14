package model;

import java.math.BigDecimal;
import java.util.Arrays;
import java.util.logging.Logger;

public class KhoaHoc_hko {
    private static final Logger LOGGER = Logger.getLogger(KhoaHoc_hko.class.getName());
    private int maKhoaHoc;
    private String tenKhoaHoc;
    private String moTa;
    private String trinhDo;
    private BigDecimal hocPhi;
    private String thoiGianHoc;

    // Valid TrinhDo values based on the ENUM in the database
    private static final String[] VALID_TRINH_DO = {"Cơ bản", "Trung cấp", "Nâng cao", "IELTS", "TOEIC"};

    // Constructors
    public KhoaHoc_hko() {}

    public KhoaHoc_hko(int maKhoaHoc, String tenKhoaHoc, String moTa, String trinhDo, BigDecimal hocPhi, String thoiGianHoc) {
        this.maKhoaHoc = maKhoaHoc;
        setTenKhoaHoc(tenKhoaHoc);
        setMoTa(moTa);
        setTrinhDo(trinhDo);
        setHocPhi(hocPhi);
        setThoiGianHoc(thoiGianHoc);
    }

    // Getters and Setters
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
        this.tenKhoaHoc = (tenKhoaHoc != null) ? tenKhoaHoc.trim() : null;
    }

    public String getMoTa() {
        return moTa;
    }

    public void setMoTa(String moTa) {
        this.moTa = (moTa != null) ? moTa.trim() : null;
    }

    public String getTrinhDo() {
        return trinhDo;
    }

    public void setTrinhDo(String trinhDo) {
        if (trinhDo == null || trinhDo.trim().isEmpty()) {
            this.trinhDo = null; // Allow NULL and log it
            LOGGER.warning("TrinhDo is null or empty for MaKhoaHoc: " + maKhoaHoc);
        } else {
            trinhDo = trinhDo.trim();
            if (!Arrays.asList(VALID_TRINH_DO).contains(trinhDo)) {
                LOGGER.severe("Invalid TrinhDo value: " + trinhDo + " for MaKhoaHoc: " + maKhoaHoc);
                throw new IllegalArgumentException("Trình độ phải là một trong: " + Arrays.toString(VALID_TRINH_DO));
            }
            this.trinhDo = trinhDo;
        }
    }

    public BigDecimal getHocPhi() {
        return hocPhi;
    }

    public void setHocPhi(BigDecimal hocPhi) {
        this.hocPhi = hocPhi;
    }

    public String getThoiGianHoc() {
        return thoiGianHoc;
    }

    public void setThoiGianHoc(String thoiGianHoc) {
        this.thoiGianHoc = (thoiGianHoc != null) ? thoiGianHoc.trim() : null;
    }

    @Override
    public String toString() {
        return "KhoaHoc_hko{" +
                "maKhoaHoc=" + maKhoaHoc +
                ", tenKhoaHoc='" + tenKhoaHoc + '\'' +
                ", moTa='" + moTa + '\'' +
                ", trinhDo='" + trinhDo + '\'' +
                ", hocPhi=" + hocPhi +
                ", thoiGianHoc='" + thoiGianHoc + '\'' +
                '}';
    }
}
package com.ruoyi.system.domain;

/**
 * @Author bd
 * @date $ $
 */
public class AssayEnity {
    private String assayType;
    private float hCod;
    private float lCod;
    private float nh;
    private float tp;
    private float tn;

    public String getAssayType() {
        return assayType;
    }

    public void setAssayType(String assayType) {
        this.assayType = assayType;
    }

    public float gethCod() {
        return hCod;
    }

    public void sethCod(float hCod) {
        this.hCod = hCod;
    }

    public float getlCod() {
        return lCod;
    }

    public void setlCod(float lCod) {
        this.lCod = lCod;
    }

    public float getNh() {
        return nh;
    }

    public void setNh(float nh) {
        this.nh = nh;
    }

    public float getTp() {
        return tp;
    }

    public void setTp(float tp) {
        this.tp = tp;
    }

    public float getTn() {
        return tn;
    }

    public void setTn(float tn) {
        this.tn = tn;
    }
}

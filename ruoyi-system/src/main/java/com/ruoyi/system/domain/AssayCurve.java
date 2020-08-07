package com.ruoyi.system.domain;

import com.ruoyi.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 化验故障表 z_assay_fault
 * 
 * @author ruoyi
 * @date 2019-12-14
 */
public class AssayCurve extends BaseEntity
{
	private static final long serialVersionUID = 1L;
	
	/** 曲线id */
	private Long curveId;
	/** 曲线编号 */
	private String curveNo;
	/** 设备编号 */
	private String deviceNo;
	/** 曲线k0 */
	private float curveK0;
	/** 曲线k1 */
	private float curveK1;
	/** 曲线r */
	private float curveR;
	/** 曲线浓度1 */
	private float curveCon1;
	/** 曲线ABS1 */
	private float curveAbs1;
	/** 曲线浓度2 */
	private float curveCon2;
	/** 曲线ABS2 */
	private float curveAbs2;

	/** 曲线浓度3 */
	private float curveCon3;
	/** 曲线ABS3 */
	private float curveAbs3;

	/** 曲线浓度4 */
	private float curveCon4;
	/** 曲线ABS4 */
	private float curveAbs4;

	/** 曲线浓度5 */
	private float curveCon5;
	/** 曲线ABS5 */
	private float curveAbs5;

	/** 曲线浓度6 */
	private float curveCon6;
	/** 曲线ABS6 */
	private float curveAbs6;

	/** 曲线浓度7 */
	private float curveCon7;
	/** 曲线ABS7 */
	private float curveAbs7;

	/** 曲线浓度8 */
	private float curveCon8;
	/** 曲线ABS8 */
	private float curveAbs8;

	/** 曲线浓度9 */
	private float curveCon9;
	/** 曲线ABS9 */
	private float curveAbs9;

	/** 曲线浓度10 */
	private float curveCon10;
	/** 曲线ABS10 */
	private float curveAbs10;

	/** 曲线高量程 */
	private float curveOpticalH;
	/** 曲线低量程 */
	private float curveOpticalL;

	private BizDevice device;

	public Long getCurveId() {
		return curveId;
	}

	public void setCurveId(Long curveId) {
		this.curveId = curveId;
	}

	public String getCurveNo() {
		return curveNo;
	}

	public void setCurveNo(String curveNo) {
		this.curveNo = curveNo;
	}

	public String getDeviceNo() {
		return deviceNo;
	}

	public void setDeviceNo(String deviceNo) {
		this.deviceNo = deviceNo;
	}

	public float getCurveK0() {
		return curveK0;
	}

	public void setCurveK0(float curveK0) {
		this.curveK0 = curveK0;
	}

	public float getCurveK1() {
		return curveK1;
	}

	public void setCurveK1(float curveK1) {
		this.curveK1 = curveK1;
	}

	public float getCurveR() {
		return curveR;
	}

	public void setCurveR(float curveR) {
		this.curveR = curveR;
	}

	public float getCurveCon1() {
		return curveCon1;
	}

	public void setCurveCon1(float curveCon1) {
		this.curveCon1 = curveCon1;
	}

	public float getCurveAbs1() {
		return curveAbs1;
	}

	public void setCurveAbs1(float curveAbs1) {
		this.curveAbs1 = curveAbs1;
	}

	public float getCurveCon2() {
		return curveCon2;
	}

	public void setCurveCon2(float curveCon2) {
		this.curveCon2 = curveCon2;
	}

	public float getCurveAbs2() {
		return curveAbs2;
	}

	public void setCurveAbs2(float curveAbs2) {
		this.curveAbs2 = curveAbs2;
	}

	public float getCurveCon3() {
		return curveCon3;
	}

	public void setCurveCon3(float curveCon3) {
		this.curveCon3 = curveCon3;
	}

	public float getCurveAbs3() {
		return curveAbs3;
	}

	public void setCurveAbs3(float curveAbs3) {
		this.curveAbs3 = curveAbs3;
	}

	public float getCurveCon4() {
		return curveCon4;
	}

	public void setCurveCon4(float curveCon4) {
		this.curveCon4 = curveCon4;
	}

	public float getCurveAbs4() {
		return curveAbs4;
	}

	public void setCurveAbs4(float curveAbs4) {
		this.curveAbs4 = curveAbs4;
	}

	public float getCurveCon5() {
		return curveCon5;
	}

	public void setCurveCon5(float curveCon5) {
		this.curveCon5 = curveCon5;
	}

	public float getCurveAbs5() {
		return curveAbs5;
	}

	public void setCurveAbs5(float curveAbs5) {
		this.curveAbs5 = curveAbs5;
	}

	public float getCurveCon6() {
		return curveCon6;
	}

	public void setCurveCon6(float curveCon6) {
		this.curveCon6 = curveCon6;
	}

	public float getCurveAbs6() {
		return curveAbs6;
	}

	public void setCurveAbs6(float curveAbs6) {
		this.curveAbs6 = curveAbs6;
	}

	public float getCurveCon7() {
		return curveCon7;
	}

	public void setCurveCon7(float curveCon7) {
		this.curveCon7 = curveCon7;
	}

	public float getCurveAbs7() {
		return curveAbs7;
	}

	public void setCurveAbs7(float curveAbs7) {
		this.curveAbs7 = curveAbs7;
	}

	public float getCurveCon8() {
		return curveCon8;
	}

	public void setCurveCon8(float curveCon8) {
		this.curveCon8 = curveCon8;
	}

	public float getCurveAbs8() {
		return curveAbs8;
	}

	public void setCurveAbs8(float curveAbs8) {
		this.curveAbs8 = curveAbs8;
	}

	public float getCurveCon9() {
		return curveCon9;
	}

	public void setCurveCon9(float curveCon9) {
		this.curveCon9 = curveCon9;
	}

	public float getCurveAbs9() {
		return curveAbs9;
	}

	public void setCurveAbs9(float curveAbs9) {
		this.curveAbs9 = curveAbs9;
	}

	public float getCurveCon10() {
		return curveCon10;
	}

	public void setCurveCon10(float curveCon10) {
		this.curveCon10 = curveCon10;
	}

	public float getCurveAbs10() {
		return curveAbs10;
	}

	public void setCurveAbs10(float curveAbs10) {
		this.curveAbs10 = curveAbs10;
	}

	public float getCurveOpticalH() {
		return curveOpticalH;
	}

	public void setCurveOpticalH(float curveOpticalH) {
		this.curveOpticalH = curveOpticalH;
	}

	public float getCurveOpticalL() {
		return curveOpticalL;
	}

	public void setCurveOpticalL(float curveOpticalL) {
		this.curveOpticalL = curveOpticalL;
	}

	public BizDevice getDevice() {
		return device;
	}

	public void setDevice(BizDevice device) {
		this.device = device;
	}

	public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("curveId", getCurveId())
            .append("curveNo", getCurveNo())
            .append("deviceNo", getDeviceNo())
            .append("curveK0", getCurveK0())
			.append("curveK1", getCurveK1())
			.append("curveR", getCurveR())
			.append("curveCon1", getCurveCon1())
			.append("curveAbs1", getCurveAbs1())
			.append("curveCon2", getCurveCon2())
			.append("curveAbs2", getCurveAbs2())
			.append("curveCon3", getCurveCon3())
			.append("curveAbs3", getCurveAbs3())
			.append("curveCon4", getCurveCon4())
			.append("curveAbs4", getCurveAbs4())
			.append("curveCon5", getCurveCon5())
			.append("curveAbs5", getCurveAbs5())
			.append("curveCon6", getCurveCon6())
			.append("curveAbs6", getCurveAbs6())
			.append("curveCon7", getCurveCon7())
			.append("curveAbs7", getCurveAbs7())
			.append("curveCon8", getCurveCon8())
			.append("curveAbs8", getCurveAbs8())
			.append("curveCon9", getCurveCon9())
			.append("curveAbs9", getCurveAbs9())
			.append("curveCon10", getCurveCon10())
			.append("curveAbs10", getCurveAbs10())
			.append("curveOpticalH", getCurveOpticalH())
			.append("curveOpticalL", getCurveOpticalL())
            .append("createTime", getCreateTime())
            .append("createBy", getCreateBy())
            .append("updateTime", getUpdateTime())
            .append("updateBy", getUpdateBy())
            .toString();
    }
}

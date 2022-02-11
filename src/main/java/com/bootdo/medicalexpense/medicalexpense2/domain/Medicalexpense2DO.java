package com.bootdo.medicalexpense.medicalexpense2.domain;

import java.io.Serializable;
import java.util.Date;


/**
 * 医保人员录入信息
 * 
 * @author chglee
 * @email 932145579@qq.com
 * @date 2021-09-11 02:09:43
 */
public class Medicalexpense2DO implements Serializable {
	private static final long serialVersionUID = 1L;
	//交易流水号
	private String id;
	//员工id
	private Integer employeeid;
	private String employeename;
	private String employeevidno;
	//人员用工状态
	private Integer employstatusid;
	//人员类别
	private Integer employtypeid;
	//家属id
	private String relationid;
	//医疗类别
	private String medicaltype;
	//交易日期or费用发生日期
	private Date trededate;
	//支付日期
	private Date paydate;
	//费用总金额
	private Double amount1;
	//医保内费用
	private Double amount2;
	//医保外费用（含拒付）
	private Double amount3;
	//统筹支付金额
	private Double amount4;
	//统筹自付金额
	private Double amount5;
	//大额支付金额
	private Double amount6;
	//大额自付金额
	private Double amount7;
	//拒付金额
	private Double amount8;
	//支付对象
	private Double amount9;
	//自付二金额
	private Double amount10;
	//起付标准
	private Double amount11;
	//超封顶的医保内费用
	private Double amount12;
	//门诊大额补充保险支付金额
	private Double amount13;
	//住院统筹补充保险支付金额
	private Double amount14;
	//住院大额补充保险支付金额
	private Double amount15;
	//门诊大额军残补助金额
	private Double amount16;
	//住院统筹军残补助金额
	private Double amount17;
	//住院大额军残补助金额
	private Double amount18;
	//补充保险支付金额
	private Double amount19;
	//军残补助支付金额
	private Double amount20;
	//单位补充医疗保险(原公疗)金额
	private Double amount21;
	//自付一金额
	private Double amount22;
	//医保外金额
	private Double amount23;
	//入院日期
	private Date admitdate;
	//出院日期
	private Date dischargedate;
	//单据数量
	private Integer vno;
	//导入日期
	private Date ddate;
	//导入人
	private String dmaker;
	//审核日期
	private Date vdate;
	//审核人
	private String vmaker;
	//备注
	private String cmemo;
	//其他费用
	private Double amount99;
	//自费费用
	private Double amount100;
	//报销金额
	private Double amount101;
	//二次报销金额
	private Double amount102;

	public String getEmployeename() {
		return employeename;
	}

	public void setEmployeename(String employeename) {
		this.employeename = employeename;
	}

	public String getEmployeevidno() {
		return employeevidno;
	}

	public void setEmployeevidno(String employeevidno) {
		this.employeevidno = employeevidno;
	}

	/**
	 * 设置：交易流水号
	 */
	public void setId(String id) {
		this.id = id;
	}
	/**
	 * 获取：交易流水号
	 */
	public String getId() {
		return id;
	}
	/**
	 * 设置：员工id
	 */
	public void setEmployeeid(Integer employeeid) {
		this.employeeid = employeeid;
	}
	/**
	 * 获取：员工id
	 */
	public Integer getEmployeeid() {
		return employeeid;
	}
	/**
	 * 设置：人员用工状态
	 */
	public void setEmploystatusid(Integer employstatusid) {
		this.employstatusid = employstatusid;
	}
	/**
	 * 获取：人员用工状态
	 */
	public Integer getEmploystatusid() {
		return employstatusid;
	}
	/**
	 * 设置：人员类别
	 */
	public void setEmploytypeid(Integer employtypeid) {
		this.employtypeid = employtypeid;
	}
	/**
	 * 获取：人员类别
	 */
	public Integer getEmploytypeid() {
		return employtypeid;
	}
	/**
	 * 设置：家属id
	 */
	public void setRelationid(String relationid) {
		this.relationid = relationid;
	}
	/**
	 * 获取：家属id
	 */
	public String getRelationid() {
		return relationid;
	}
	/**
	 * 设置：医疗类别
	 */
	public void setMedicaltype(String medicaltype) {
		this.medicaltype = medicaltype;
	}
	/**
	 * 获取：医疗类别
	 */
	public String getMedicaltype() {
		return medicaltype;
	}
	/**
	 * 设置：交易日期or费用发生日期
	 */
	public void setTrededate(Date trededate) {
		this.trededate = trededate;
	}
	/**
	 * 获取：交易日期or费用发生日期
	 */
	public Date getTrededate() {
		return trededate;
	}
	/**
	 * 设置：支付日期
	 */
	public void setPaydate(Date paydate) {
		this.paydate = paydate;
	}
	/**
	 * 获取：支付日期
	 */
	public Date getPaydate() {
		return paydate;
	}
	/**
	 * 设置：费用总金额
	 */
	public void setAmount1(Double amount1) {
		this.amount1 = amount1;
	}
	/**
	 * 获取：费用总金额
	 */
	public Double getAmount1() {
		return amount1;
	}
	/**
	 * 设置：医保内费用
	 */
	public void setAmount2(Double amount2) {
		this.amount2 = amount2;
	}
	/**
	 * 获取：医保内费用
	 */
	public Double getAmount2() {
		return amount2;
	}
	/**
	 * 设置：医保外费用（含拒付）
	 */
	public void setAmount3(Double amount3) {
		this.amount3 = amount3;
	}
	/**
	 * 获取：医保外费用（含拒付）
	 */
	public Double getAmount3() {
		return amount3;
	}
	/**
	 * 设置：统筹支付金额
	 */
	public void setAmount4(Double amount4) {
		this.amount4 = amount4;
	}
	/**
	 * 获取：统筹支付金额
	 */
	public Double getAmount4() {
		return amount4;
	}
	/**
	 * 设置：统筹自付金额
	 */
	public void setAmount5(Double amount5) {
		this.amount5 = amount5;
	}
	/**
	 * 获取：统筹自付金额
	 */
	public Double getAmount5() {
		return amount5;
	}
	/**
	 * 设置：大额支付金额
	 */
	public void setAmount6(Double amount6) {
		this.amount6 = amount6;
	}
	/**
	 * 获取：大额支付金额
	 */
	public Double getAmount6() {
		return amount6;
	}
	/**
	 * 设置：大额自付金额
	 */
	public void setAmount7(Double amount7) {
		this.amount7 = amount7;
	}
	/**
	 * 获取：大额自付金额
	 */
	public Double getAmount7() {
		return amount7;
	}
	/**
	 * 设置：拒付金额
	 */
	public void setAmount8(Double amount8) {
		this.amount8 = amount8;
	}
	/**
	 * 获取：拒付金额
	 */
	public Double getAmount8() {
		return amount8;
	}
	/**
	 * 设置：支付对象
	 */
	public void setAmount9(Double amount9) {
		this.amount9 = amount9;
	}
	/**
	 * 获取：支付对象
	 */
	public Double getAmount9() {
		return amount9;
	}
	/**
	 * 设置：自付二金额
	 */
	public void setAmount10(Double amount10) {
		this.amount10 = amount10;
	}
	/**
	 * 获取：自付二金额
	 */
	public Double getAmount10() {
		return amount10;
	}
	/**
	 * 设置：起付标准
	 */
	public void setAmount11(Double amount11) {
		this.amount11 = amount11;
	}
	/**
	 * 获取：起付标准
	 */
	public Double getAmount11() {
		return amount11;
	}
	/**
	 * 设置：超封顶的医保内费用
	 */
	public void setAmount12(Double amount12) {
		this.amount12 = amount12;
	}
	/**
	 * 获取：超封顶的医保内费用
	 */
	public Double getAmount12() {
		return amount12;
	}
	/**
	 * 设置：门诊大额补充保险支付金额
	 */
	public void setAmount13(Double amount13) {
		this.amount13 = amount13;
	}
	/**
	 * 获取：门诊大额补充保险支付金额
	 */
	public Double getAmount13() {
		return amount13;
	}
	/**
	 * 设置：住院统筹补充保险支付金额
	 */
	public void setAmount14(Double amount14) {
		this.amount14 = amount14;
	}
	/**
	 * 获取：住院统筹补充保险支付金额
	 */
	public Double getAmount14() {
		return amount14;
	}
	/**
	 * 设置：住院大额补充保险支付金额
	 */
	public void setAmount15(Double amount15) {
		this.amount15 = amount15;
	}
	/**
	 * 获取：住院大额补充保险支付金额
	 */
	public Double getAmount15() {
		return amount15;
	}
	/**
	 * 设置：门诊大额军残补助金额
	 */
	public void setAmount16(Double amount16) {
		this.amount16 = amount16;
	}
	/**
	 * 获取：门诊大额军残补助金额
	 */
	public Double getAmount16() {
		return amount16;
	}
	/**
	 * 设置：住院统筹军残补助金额
	 */
	public void setAmount17(Double amount17) {
		this.amount17 = amount17;
	}
	/**
	 * 获取：住院统筹军残补助金额
	 */
	public Double getAmount17() {
		return amount17;
	}
	/**
	 * 设置：住院大额军残补助金额
	 */
	public void setAmount18(Double amount18) {
		this.amount18 = amount18;
	}
	/**
	 * 获取：住院大额军残补助金额
	 */
	public Double getAmount18() {
		return amount18;
	}
	/**
	 * 设置：补充保险支付金额
	 */
	public void setAmount19(Double amount19) {
		this.amount19 = amount19;
	}
	/**
	 * 获取：补充保险支付金额
	 */
	public Double getAmount19() {
		return amount19;
	}
	/**
	 * 设置：军残补助支付金额
	 */
	public void setAmount20(Double amount20) {
		this.amount20 = amount20;
	}
	/**
	 * 获取：军残补助支付金额
	 */
	public Double getAmount20() {
		return amount20;
	}
	/**
	 * 设置：单位补充医疗保险(原公疗)金额
	 */
	public void setAmount21(Double amount21) {
		this.amount21 = amount21;
	}
	/**
	 * 获取：单位补充医疗保险(原公疗)金额
	 */
	public Double getAmount21() {
		return amount21;
	}
	/**
	 * 设置：自付一金额
	 */
	public void setAmount22(Double amount22) {
		this.amount22 = amount22;
	}
	/**
	 * 获取：自付一金额
	 */
	public Double getAmount22() {
		return amount22;
	}
	/**
	 * 设置：医保外金额
	 */
	public void setAmount23(Double amount23) {
		this.amount23 = amount23;
	}
	/**
	 * 获取：医保外金额
	 */
	public Double getAmount23() {
		return amount23;
	}
	/**
	 * 设置：入院日期
	 */
	public void setAdmitdate(Date admitdate) {
		this.admitdate = admitdate;
	}
	/**
	 * 获取：入院日期
	 */
	public Date getAdmitdate() {
		return admitdate;
	}
	/**
	 * 设置：出院日期
	 */
	public void setDischargedate(Date dischargedate) {
		this.dischargedate = dischargedate;
	}
	/**
	 * 获取：出院日期
	 */
	public Date getDischargedate() {
		return dischargedate;
	}
	/**
	 * 设置：单据数量
	 */
	public void setVno(Integer vno) {
		this.vno = vno;
	}
	/**
	 * 获取：单据数量
	 */
	public Integer getVno() {
		return vno;
	}
	/**
	 * 设置：导入日期
	 */
	public void setDdate(Date ddate) {
		this.ddate = ddate;
	}
	/**
	 * 获取：导入日期
	 */
	public Date getDdate() {
		return ddate;
	}
	/**
	 * 设置：导入人
	 */
	public void setDmaker(String dmaker) {
		this.dmaker = dmaker;
	}
	/**
	 * 获取：导入人
	 */
	public String getDmaker() {
		return dmaker;
	}
	/**
	 * 设置：审核日期
	 */
	public void setVdate(Date vdate) {
		this.vdate = vdate;
	}
	/**
	 * 获取：审核日期
	 */
	public Date getVdate() {
		return vdate;
	}
	/**
	 * 设置：审核人
	 */
	public void setVmaker(String vmaker) {
		this.vmaker = vmaker;
	}
	/**
	 * 获取：审核人
	 */
	public String getVmaker() {
		return vmaker;
	}
	/**
	 * 设置：备注
	 */
	public void setCmemo(String cmemo) {
		this.cmemo = cmemo;
	}
	/**
	 * 获取：备注
	 */
	public String getCmemo() {
		return cmemo;
	}
	/**
	 * 设置：其他费用
	 */
	public void setAmount99(Double amount99) {
		this.amount99 = amount99;
	}
	/**
	 * 获取：其他费用
	 */
	public Double getAmount99() {
		return amount99;
	}
	/**
	 * 设置：自费费用
	 */
	public void setAmount100(Double amount100) {
		this.amount100 = amount100;
	}
	/**
	 * 获取：自费费用
	 */
	public Double getAmount100() {
		return amount100;
	}
	/**
	 * 设置：报销金额
	 */
	public void setAmount101(Double amount101) {
		this.amount101 = amount101;
	}
	/**
	 * 获取：报销金额
	 */
	public Double getAmount101() {
		return amount101;
	}
	/**
	 * 设置：二次报销金额
	 */
	public void setAmount102(Double amount102) {
		this.amount102 = amount102;
	}
	/**
	 * 获取：二次报销金额
	 */
	public Double getAmount102() {
		return amount102;
	}
	/**
	 * 是否医保返还
	 */
	public int isback;

	public int getIsback() {
		return isback;
	}

	public void setIsback(int isback) {
		this.isback = isback;
	}
}

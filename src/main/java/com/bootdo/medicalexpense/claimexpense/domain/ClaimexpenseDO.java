package com.bootdo.medicalexpense.claimexpense.domain;

import java.io.Serializable;
import java.util.Date;



/**
 * 计算报销金额
 * 
 * @author chglee
 * @email 932145579@qq.com
 * @date 2021-10-09 18:15:59
 */
public class ClaimexpenseDO implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//交易流水号
	private String id;
	//员工id
	private Integer employeeid;
	//员工姓名
	private String employeename;
	//人员用工状态
	private Integer employstatusid;
	private String employstatus;
	//人员类别
	private Integer employtypeid;
	private String employtype;
	//公民身份号码
	private String employeevidno;
	//支付日期
	private Date paydate;
	//医保外费用（含拒付)
	private Double amount3;
	//医保外费用（含拒付)
	private Double claimamount3;
	//自付二金额
	private Double amount10;
	//自付二金额
	private Double claimamount10;
	//自付一金额
	private Double amount22;
	//自付一金额
	private Double claimamount22;
	//年
	private int year;
	//月
	private int month;

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public int getMonth() {
		return month;
	}

	public void setMonth(int month) {
		this.month = month;
	}

	public String getEmploystatus() {
		return employstatus;
	}

	public void setEmploystatus(String employstatus) {
		this.employstatus = employstatus;
	}

	public String getEmploytype() {
		return employtype;
	}

	public void setEmploytype(String employtype) {
		this.employtype = employtype;
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
	 * 设置：员工id
	 */
	public void setEmployeename(String employeename) {
		this.employeename = employeename;
	}
	/**
	 * 获取：员工id
	 */
	public String getEmployeename() {
		return employeename;
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
	 * 设置：公民身份号码
	 */
	public void setEmployeevidno(String employeevidno) {
		this.employeevidno = employeevidno;
	}
	/**
	 * 获取：公民身份号码
	 */
	public String getEmployeevidno() {
		return employeevidno;
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
	 * 设置：医保外费用（含拒付)
	 */
	public void setAmount3(Double amount3) {
		this.amount3 = amount3;
	}
	/**
	 * 获取：医保外费用（含拒付)
	 */
	public Double getAmount3() {
		return amount3;
	}
	/**
	 * 设置：医保外费用（含拒付)
	 */
	public void setClaimamount3(Double claimamount3) {
		this.claimamount3 = claimamount3;
	}
	/**
	 * 获取：医保外费用（含拒付)
	 */
	public Double getClaimamount3() {
		return claimamount3;
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
	 * 设置：自付二金额
	 */
	public void setClaimamount10(Double claimamount10) {
		this.claimamount10 = claimamount10;
	}
	/**
	 * 获取：自付二金额
	 */
	public Double getClaimamount10() {
		return claimamount10;
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
	 * 设置：自付一金额
	 */
	public void setClaimamount22(Double claimamount22) {
		this.claimamount22 = claimamount22;
	}
	/**
	 * 获取：自付一金额
	 */
	public Double getClaimamount22() {
		return claimamount22;
	}
}

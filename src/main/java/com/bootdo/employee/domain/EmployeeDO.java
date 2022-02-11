package com.bootdo.employee.domain;

import org.joda.time.DateTime;

import java.io.Serializable;
import java.util.Date;



/**
 * 员工档案
 * 
 * @author chglee
 * @email 932145579@qq.com
 * @date 2021-09-10 15:16:36
 */
public class EmployeeDO implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Long id;
	//用户名
	private String name;
	//人员编号
	private String code;
	//部门编码
	private Long deptId;
	//用工状态编码
	private Long employstatusId;
	//人员类别编码
	private Long employtypeId;
	//邮箱
	private String email;
	//手机号
	private String mobile;
	//身份证号
	private String vnoid;
	//性别
	private Long sex;
	//出生日期
	private Date birth;
	//状态 0:停止，1:正常
	private Integer status;
	//创建用户id
	private Long userIdCreate;
	//创建时间
	private Date gmtCreate;
	//修改时间
	private Date gmtModified;
	//家属报销比例
	private Long rate;
	/**
	 * 获取：家属报销比例
	 */
	public Long getRate() {
		return rate;
	}
	/**
	 * 设置：家属报销比例
	 */
	public void setRate(Long rate) {
		this.rate = rate;
	}

	/**
	 * 设置：
	 */
	public void setId(Long id) {
		this.id = id;
	}
	/**
	 * 获取：
	 */
	public Long getId() {
		return id;
	}
	/**
	 * 设置：用户名
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * 获取：用户名
	 */
	public String getName() {
		return name;
	}
	/**
	 * 设置：人员编号
	 */
	public void setCode(String code) {
		this.code = code;
	}
	/**
	 * 获取：人员编号
	 */
	public String getCode() {
		return code;
	}
	/**
	 * 设置：部门编码
	 */
	public void setDeptId(Long deptId) {
		this.deptId = deptId;
	}
	/**
	 * 获取：部门编码
	 */
	public Long getDeptId() {
		return deptId;
	}
	/**
	 * 设置：用工状态编码
	 */
	public void setEmploystatusId(Long employstatusId) {
		this.employstatusId = employstatusId;
	}
	/**
	 * 获取：用工状态编码
	 */
	public Long getEmploystatusId() {
		return employstatusId;
	}
	/**
	 * 设置：人员类别编码
	 */
	public void setEmploytypeId(Long employtypeId) {
		this.employtypeId = employtypeId;
	}
	/**
	 * 获取：人员类别编码
	 */
	public Long getEmploytypeId() {
		return employtypeId;
	}
	/**
	 * 设置：邮箱
	 */
	public void setEmail(String email) {
		this.email = email;
	}
	/**
	 * 获取：邮箱
	 */
	public String getEmail() {
		return email;
	}
	/**
	 * 设置：手机号
	 */
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	/**
	 * 获取：手机号
	 */
	public String getMobile() {
		return mobile;
	}
	/**
	 * 设置：身份证号
	 */
	public void setVnoid(String vnoid) {
		this.vnoid = vnoid;
	}
	/**
	 * 获取：身份证号
	 */
	public String getVnoid() {
		return vnoid;
	}
	/**
	 * 设置：性别
	 */
	public void setSex(Long sex) {
		this.sex = sex;
	}
	/**
	 * 获取：性别
	 */
	public Long getSex() {
		return sex;
	}
	/**
	 * 设置：出生日期
	 */
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	/**
	 * 获取：出生日期
	 */
	public Date getBirth() {
		return birth;
	}
	/**
	 * 设置：状态 0:停止，1:正常
	 */
	public void setStatus(Integer status) {
		this.status = status;
	}
	/**
	 * 获取：状态 0:停止，1:正常
	 */
	public Integer getStatus() {
		return status;
	}
	/**
	 * 设置：创建用户id
	 */
	public void setUserIdCreate(Long userIdCreate) {
		this.userIdCreate = userIdCreate;
	}
	/**
	 * 获取：创建用户id
	 */
	public Long getUserIdCreate() {
		return userIdCreate;
	}
	/**
	 * 设置：创建时间
	 */
	public void setGmtCreate(Date gmtCreate) {
		this.gmtCreate = gmtCreate;
	}
	/**
	 * 获取：创建时间
	 */
	public Date getGmtCreate() {
		return gmtCreate;
	}
	/**
	 * 设置：修改时间
	 */
	public void setGmtModified(Date gmtModified) {
		this.gmtModified = gmtModified;
	}
	/**
	 * 获取：修改时间
	 */
	public Date getGmtModified() {
		return gmtModified;
	}
	/**
	 * 父母ID	 */
	public int parentid;
	public int getParentid() {
		return parentid;
	}
	public void setParentid(int parentid) {
		this.parentid = parentid;
	}
	/**
	 * 是否家属
	 */
	public int isrelation;
	public int getIsrelation() {
		return isrelation;
	}
	public void setIsrelation(int isrelation) {
		this.isrelation = isrelation;
	}
	/**
	 * 是否医保
	 */
	public int ismedinsur;
	public int getIsmedinsur() {
		return ismedinsur;
	}
	public void setIsmedinsur(int ismedinsur) {
		this.ismedinsur = ismedinsur;
	}

	@Override
	public String toString() {
		return "EmployeeDO{" +
				"id=" + id +
				", name='" + name + '\'' +
				", code='" + code + '\'' +
				", deptId=" + deptId +
				", employstatusId=" + employstatusId +
				", employtypeId=" + employtypeId +
				", email='" + email + '\'' +
				", mobile='" + mobile + '\'' +
				", vnoid='" + vnoid + '\'' +
				", sex=" + sex +
				", birth=" + birth +
				", status=" + status +
				", userIdCreate=" + userIdCreate +
				", gmtCreate=" + gmtCreate +
				", gmtModified=" + gmtModified +
				", parentid=" + parentid +
				", isrelation=" + isrelation +
				", ismedinsur=" + ismedinsur +
				'}';
	}
}

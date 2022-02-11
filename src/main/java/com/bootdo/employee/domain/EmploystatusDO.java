package com.bootdo.employee.domain;

import java.io.Serializable;
import java.util.Date;



/**
 * 用工状态
 * 
 * @author chglee
 * @email 932145579@qq.com
 * @date 2021-09-09 11:37:06
 */
public class EmploystatusDO implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//用工状态ID
	private Integer id;
	//用工状态名称
	private String statusname;
	//是否医保
	private Integer ismedinsur;

	/**
	 * 设置：用工状态ID
	 */
	public void setId(Integer id) {
		this.id = id;
	}
	/**
	 * 获取：用工状态ID
	 */
	public Integer getId() {
		return id;
	}
	/**
	 * 设置：用工状态名称
	 */
	public void setStatusname(String statusname) {
		this.statusname = statusname;
	}
	/**
	 * 获取：用工状态名称
	 */
	public String getStatusname() {
		return statusname;
	}
	/**
	 * 设置：是否医保
	 */
	public void setIsmedinsur(Integer ismedinsur) {
		this.ismedinsur = ismedinsur;
	}
	/**
	 * 获取：是否医保
	 */
	public Integer getIsmedinsur() {
		return ismedinsur;
	}
}

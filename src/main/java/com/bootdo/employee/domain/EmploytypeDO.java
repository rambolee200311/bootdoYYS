package com.bootdo.employee.domain;

import java.io.Serializable;
import java.util.Date;



/**
 * 人员类别
 * 
 * @author chglee
 * @email 932145579@qq.com
 * @date 2021-09-09 21:25:36
 */
public class EmploytypeDO implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//人员类别ID
	private Integer id;
	//人员类别名称
	private String statusname;

	/**
	 * 设置：人员类别ID
	 */
	public void setId(Integer id) {
		this.id = id;
	}
	/**
	 * 获取：人员类别ID
	 */
	public Integer getId() {
		return id;
	}
	/**
	 * 设置：人员类别名称
	 */
	public void setStatusname(String statusname) {
		this.statusname = statusname;
	}
	/**
	 * 获取：人员类别名称
	 */
	public String getStatusname() {
		return statusname;
	}
}

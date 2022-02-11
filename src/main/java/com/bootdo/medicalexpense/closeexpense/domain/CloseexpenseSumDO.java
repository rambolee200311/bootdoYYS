package com.bootdo.medicalexpense.closeexpense.domain;

public class CloseexpenseSumDO {
    //年
    private int year;
    //月
    private int month;
    //员工id
    private Integer employeeid;
    private Integer dept_id;
    //员工姓名
    private String employeename;
    private String dept_name;
    //人员用工状态
    private Integer employstatusid;
    private String employstatus;
    //人员类别
    private Integer employtypeid;
    private String employtype;
    //付款金额
    private Double closeamount;

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

    public Integer getEmployeeid() {
        return employeeid;
    }

    public void setEmployeeid(Integer employeeid) {
        this.employeeid = employeeid;
    }



    public String getEmployeename() {
        return employeename;
    }

    public void setEmployeename(String employeename) {
        this.employeename = employeename;
    }


    public Integer getEmploystatusid() {
        return employstatusid;
    }

    public void setEmploystatusid(Integer employstatusid) {
        this.employstatusid = employstatusid;
    }

    public String getEmploystatus() {
        return employstatus;
    }

    public void setEmploystatus(String employstatus) {
        this.employstatus = employstatus;
    }

    public Integer getEmploytypeid() {
        return employtypeid;
    }

    public void setEmploytypeid(Integer employtypeid) {
        this.employtypeid = employtypeid;
    }

    public String getEmploytype() {
        return employtype;
    }

    public void setEmploytype(String employtype) {
        this.employtype = employtype;
    }

    public Double getCloseamount() {
        return closeamount;
    }

    public void setCloseamount(Double closeamount) {
        this.closeamount = closeamount;
    }

    public Integer getDept_id() {
        return dept_id;
    }

    public void setDept_id(Integer dept_id) {
        this.dept_id = dept_id;
    }

    public String getDept_name() {
        return dept_name;
    }

    public void setDept_name(String dept_name) {
        this.dept_name = dept_name;
    }
}

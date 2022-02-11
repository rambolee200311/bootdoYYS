package com.bootdo.medicalexpense.closeexpense.domain;
import java.io.Serializable;
import java.util.Date;
public class CloseexpenseDO implements Serializable {
    private static final long serialVersionUID = 1L;
    //交易流水号
    private String id;
    //员工id
    private Integer employeeid;
    private Integer closeemployeeid;
    //员工姓名
    private String employeename;
    private String closeemployeename;
    //人员用工状态
    private Integer employstatusid;
    private String employstatus;
    //人员类别
    private Integer employtypeid;
    private String employtype;
    //医保外费用（含拒付)
    private Double claimamount3;
    //自付二金额
    private Double claimamount10;
    //自付一金额
    private Double claimamount22;
    //付款金额
    private Double closeamount;
    //年
    private int year;
    //月
    private int month;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Integer getEmployeeid() {
        return employeeid;
    }

    public void setEmployeeid(Integer employeeid) {
        this.employeeid = employeeid;
    }

    public Integer getCloseemployeeid() {
        return closeemployeeid;
    }

    public void setCloseemployeeid(Integer closeemployeeid) {
        this.closeemployeeid = closeemployeeid;
    }

    public String getEmployeename() {
        return employeename;
    }

    public void setEmployeename(String employeename) {
        this.employeename = employeename;
    }

    public String getCloseemployeename() {
        return closeemployeename;
    }

    public void setCloseemployeename(String closeemployeename) {
        this.closeemployeename = closeemployeename;
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

    public Double getClaimamount3() {
        return claimamount3;
    }

    public void setClaimamount3(Double claimamount3) {
        this.claimamount3 = claimamount3;
    }

    public Double getClaimamount10() {
        return claimamount10;
    }

    public void setClaimamount10(Double claimamount10) {
        this.claimamount10 = claimamount10;
    }

    public Double getClaimamount22() {
        return claimamount22;
    }

    public void setClaimamount22(Double claimamount22) {
        this.claimamount22 = claimamount22;
    }

    public Double getCloseamount() {
        return closeamount;
    }

    public void setCloseamount(Double closeamount) {
        this.closeamount = closeamount;
    }

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
}

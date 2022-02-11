package com.bootdo.relation.domain;
import java.io.Serializable;
import java.util.Date;
public class RelationDO  implements Serializable {
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
    //parent
    private Integer parentid;
    private Integer secparentid;
    //rate
    private Integer rate;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Long getDeptId() {
        return deptId;
    }

    public void setDeptId(Long deptId) {
        this.deptId = deptId;
    }

    public Long getEmploystatusId() {
        return employstatusId;
    }

    public void setEmploystatusId(Long employstatusId) {
        this.employstatusId = employstatusId;
    }

    public Long getEmploytypeId() {
        return employtypeId;
    }

    public void setEmploytypeId(Long employtypeId) {
        this.employtypeId = employtypeId;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getVnoid() {
        return vnoid;
    }

    public void setVnoid(String vnoid) {
        this.vnoid = vnoid;
    }

    public Long getSex() {
        return sex;
    }

    public void setSex(Long sex) {
        this.sex = sex;
    }

    public Date getBirth() {
        return birth;
    }

    public void setBirth(Date birth) {
        this.birth = birth;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Long getUserIdCreate() {
        return userIdCreate;
    }

    public void setUserIdCreate(Long userIdCreate) {
        this.userIdCreate = userIdCreate;
    }

    public Date getGmtCreate() {
        return gmtCreate;
    }

    public void setGmtCreate(Date gmtCreate) {
        this.gmtCreate = gmtCreate;
    }

    public Date getGmtModified() {
        return gmtModified;
    }

    public void setGmtModified(Date gmtModified) {
        this.gmtModified = gmtModified;
    }

    public Integer getParentid() {
        return parentid;
    }

    public void setParentid(Integer parentid) {
        this.parentid = parentid;
    }

    public Integer getSecparentid() {
        return secparentid;
    }

    public void setSecparentid(Integer secparentid) {
        this.secparentid = secparentid;
    }

    public Integer getRate() {
        return rate;
    }

    public void setRate(Integer rate) {
        this.rate = rate;
    }
}

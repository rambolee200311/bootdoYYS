package com.bootdo.medicalexpense.medicalexpense1.domain;

public class MedicalexpenseInfoDO extends Medicalexpense1DO{
    public String employeename;
    public String employstatusname;
    public String employtypename;
    public String employeevidno;

    public String getEmployeevidno() {
        return employeevidno;
    }

    public void setEmployeevidno(String employeevidno) {
        this.employeevidno = employeevidno;
    }

    public String getEmployeename() {
        return employeename;
    }

    public void setEmployeename(String employeename) {
        this.employeename = employeename;
    }

    public String getEmploystatusname() {
        return employstatusname;
    }

    public void setEmploystatusname(String employstatusname) {
        this.employstatusname = employstatusname;
    }

    public String getEmploytypename() {
        return employtypename;
    }

    public void setEmploytypename(String employtypename) {
        this.employtypename = employtypename;
    }
}

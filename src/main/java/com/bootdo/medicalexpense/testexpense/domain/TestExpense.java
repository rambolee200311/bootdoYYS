package com.bootdo.medicalexpense.testexpense.domain;
import java.io.Serializable;
import java.util.Date;

public class TestExpense  implements Serializable {
    private static final long serialVersionUID = 1L;
    //交易流水号
    public String id;
    //姓名
    public String employeename;
    //员工id
    public Integer employeeid;
    //人员用工状态
    public Integer employstatusid;
    //人员类别
    public Integer employtypeid;
    //公民身份号码
    public String employeevidno;
    //医疗类别
    public String medicaltype;
    //医疗参保人员类别
    public String employstatus;
    //交易日期
    public Date trededate;
    //支付日期
    public Date paydate;
    //费用总金额
    public double amount1;
    //医保内费用
    public double amount2;
    //医保外费用（含拒付）
    public double amount3;
    //统筹支付金额
    public double amount4;
    //统筹自付金额
    public double amount5;
    //大额支付金额
    public double amount6;
    //大额自付金额
    public double amount7;
    //拒付金额
    public double amount8;
    //支付对象
    public double amount9;
    //自付二金额
    public double amount10;
    //起付标准
    public double amount11;
    //超封顶的医保内费用
    public double amount12;
    //门诊大额补充保险支付金额
    public double amount13;
    //住院统筹补充保险支付金额
    public double amount14;
    //住院大额补充保险支付金额
    public double amount15;
    //门诊大额军残补助金额
    public double amount16;
    //住院统筹军残补助金额
    public double amount17;
    //住院大额军残补助金额
    public double amount18;
    //补充保险支付金额
    public double amount19;
    //军残补助支付金额
    public double amount20;
    //单位补充医疗保险(原公疗)金额
    public double amount21;
    //自付一金额
    public double amount22;
    //入院日期
    public Date admitdate;
    //出院日期
    public Date dischargedate;
    public double rate;
    public String type;
    public Date ddate;

    public Date getDdate() {
        return ddate;
    }

    public void setDdate(Date ddate) {
        this.ddate = ddate;
    }

    public double getRate() {
        return rate;
    }

    public void setRate(double rate) {
        this.rate = rate;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }

    public String getEmployeename() {
        return employeename;
    }

    public void setEmployeename(String employeename) {
        this.employeename = employeename;
    }

    public Integer getEmployeeid() {
        return employeeid;
    }

    public void setEmployeeid(Integer employeeid) {
        this.employeeid = employeeid;
    }

    public Integer getEmploystatusid() {
        return employstatusid;
    }

    public void setEmploystatusid(Integer employstatusid) {
        this.employstatusid = employstatusid;
    }

    public Integer getEmploytypeid() {
        return employtypeid;
    }

    public void setEmploytypeid(Integer employtypeid) {
        this.employtypeid = employtypeid;
    }

    public String getEmployeevidno() {
        return employeevidno;
    }

    public void setEmployeevidno(String employeevidno) {
        this.employeevidno = employeevidno;
    }

    public String getMedicaltype() {
        return medicaltype;
    }

    public void setMedicaltype(String medicaltype) {
        this.medicaltype = medicaltype;
    }

    public String getEmploystatus() {
        return employstatus;
    }

    public void setEmploystatus(String employstatus) {
        this.employstatus = employstatus;
    }

    public Date getTrededate() {
        return trededate;
    }

    public void setTrededate(Date trededate) {
        this.trededate = trededate;
    }

    public Date getPaydate() {
        return paydate;
    }

    public void setPaydate(Date paydate) {
        this.paydate = paydate;
    }

    public double getAmount1() {
        return amount1;
    }

    public void setAmount1(double amount1) {
        this.amount1 = amount1;
    }

    public double getAmount2() {
        return amount2;
    }

    public void setAmount2(double amount2) {
        this.amount2 = amount2;
    }

    public double getAmount3() {
        return amount3;
    }

    public void setAmount3(double amount3) {
        this.amount3 = amount3;
    }

    public double getAmount4() {
        return amount4;
    }

    public void setAmount4(double amount4) {
        this.amount4 = amount4;
    }

    public double getAmount5() {
        return amount5;
    }

    public void setAmount5(double amount5) {
        this.amount5 = amount5;
    }

    public double getAmount6() {
        return amount6;
    }

    public void setAmount6(double amount6) {
        this.amount6 = amount6;
    }

    public double getAmount7() {
        return amount7;
    }

    public void setAmount7(double amount7) {
        this.amount7 = amount7;
    }

    public double getAmount8() {
        return amount8;
    }

    public void setAmount8(double amount8) {
        this.amount8 = amount8;
    }

    public double getAmount9() {
        return amount9;
    }

    public void setAmount9(double amount9) {
        this.amount9 = amount9;
    }

    public double getAmount10() {
        return amount10;
    }

    public void setAmount10(double amount10) {
        this.amount10 = amount10;
    }

    public double getAmount11() {
        return amount11;
    }

    public void setAmount11(double amount11) {
        this.amount11 = amount11;
    }

    public double getAmount12() {
        return amount12;
    }

    public void setAmount12(double amount12) {
        this.amount12 = amount12;
    }

    public double getAmount13() {
        return amount13;
    }

    public void setAmount13(double amount13) {
        this.amount13 = amount13;
    }

    public double getAmount14() {
        return amount14;
    }

    public void setAmount14(double amount14) {
        this.amount14 = amount14;
    }

    public double getAmount15() {
        return amount15;
    }

    public void setAmount15(double amount15) {
        this.amount15 = amount15;
    }

    public double getAmount16() {
        return amount16;
    }

    public void setAmount16(double amount16) {
        this.amount16 = amount16;
    }

    public double getAmount17() {
        return amount17;
    }

    public void setAmount17(double amount17) {
        this.amount17 = amount17;
    }

    public double getAmount18() {
        return amount18;
    }

    public void setAmount18(double amount18) {
        this.amount18 = amount18;
    }

    public double getAmount19() {
        return amount19;
    }

    public void setAmount19(double amount19) {
        this.amount19 = amount19;
    }

    public double getAmount20() {
        return amount20;
    }

    public void setAmount20(double amount20) {
        this.amount20 = amount20;
    }

    public double getAmount21() {
        return amount21;
    }

    public void setAmount21(double amount21) {
        this.amount21 = amount21;
    }

    public double getAmount22() {
        return amount22;
    }

    public void setAmount22(double amount22) {
        this.amount22 = amount22;
    }

    public Date getAdmitdate() {
        return admitdate;
    }

    public void setAdmitdate(Date admitdate) {
        this.admitdate = admitdate;
    }

    public Date getDischargedate() {
        return dischargedate;
    }

    public void setDischargedate(Date dischargedate) {
        this.dischargedate = dischargedate;
    }
}

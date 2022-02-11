package com.bootdo.medicalexpense.claimexpense.domain;
import java.io.Serializable;
public class RegulationDO {
    private static final long serialVersionUID = 1L;
    //id
    private int id;
    //年龄下限
    private  int lage;
    //年龄上限
    private int uage;
    //全年全额报销部分
    private  double amt1;
    //全年全额报销部分报销比例
    private double rate1;
    //超出部分上限
    private double amt2;
    //超出部分上限
    private double rate2;
    //超出部分上限
    private double amt3;
    //超出部分上限
    private double rate3;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getLage() {
        return lage;
    }

    public void setLage(int lage) {
        this.lage = lage;
    }

    public int getUage() {
        return uage;
    }

    public void setUage(int uage) {
        this.uage = uage;
    }

    public double getAmt1() {
        return amt1;
    }

    public void setAmt1(double amt1) {
        this.amt1 = amt1;
    }

    public double getRate1() {
        return rate1;
    }

    public void setRate1(double rate1) {
        this.rate1 = rate1;
    }

    public double getAmt2() {
        return amt2;
    }

    public void setAmt2(double amt2) {
        this.amt2 = amt2;
    }

    public double getRate2() {
        return rate2;
    }

    public void setRate2(double rate2) {
        this.rate2 = rate2;
    }

    public double getAmt3() {
        return amt3;
    }

    public void setAmt3(double amt3) {
        this.amt3 = amt3;
    }

    public double getRate3() {
        return rate3;
    }

    public void setRate3(double rate3) {
        this.rate3 = rate3;
    }
}

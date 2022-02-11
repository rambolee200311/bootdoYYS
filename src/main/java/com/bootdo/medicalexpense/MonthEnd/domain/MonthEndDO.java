package com.bootdo.medicalexpense.MonthEnd.domain;

import java.io.Serializable;
import java.util.Date;
public class MonthEndDO  implements Serializable {
    private static final long serialVersionUID = 1L;
    private int year;
    private int month;
    private Date ldate;
    private Date udate;
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

    public Date getLdate() {
        return ldate;
    }

    public void setLdate(Date ldate) {
        this.ldate = ldate;
    }

    public Date getUdate() {
        return udate;
    }

    public void setUdate(Date udate) {
        this.udate = udate;
    }
}

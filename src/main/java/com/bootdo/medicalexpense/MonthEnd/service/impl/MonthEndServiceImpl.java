package com.bootdo.medicalexpense.MonthEnd.service.impl;

import com.bootdo.medicalexpense.MonthEnd.service.MonthEndService;
import com.bootdo.medicalexpense.MonthEnd.domain.MonthEndDO;
import com.bootdo.medicalexpense.MonthEnd.dao.MonthEndDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MonthEndServiceImpl implements MonthEndService{
    @Autowired
    private MonthEndDao monthEndDao;
    @Override
    public MonthEndDO getLast(){
        MonthEndDO monthEndDO=new MonthEndDO();
        int year=monthEndDao.getLastYear();
        int month=monthEndDao.getLastMonth(year);
        monthEndDO.setMonth(month);
        monthEndDO.setYear(year);
        return monthEndDO;
    }
    @Override
    public int openMonthEnd(MonthEndDO monthEndDO) {
        return monthEndDao.openMonthEnd(monthEndDO);
    }
    @Override
    public int closeMonthEnd(MonthEndDO monthEndDO) {
        return monthEndDao.closeMonthEnd(monthEndDO);
    }
    @Override
    public MonthEndDO getNext(){
        MonthEndDO monthEndDO=new MonthEndDO();
        int year=monthEndDao.getNextYear();
        int month=monthEndDao.getNextMonth(year);
        monthEndDO.setMonth(month);
        monthEndDO.setYear(year);
        return monthEndDO;
    }
}

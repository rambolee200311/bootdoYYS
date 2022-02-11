package com.bootdo.medicalexpense.MonthEnd.dao;

import com.bootdo.medicalexpense.MonthEnd.domain.MonthEndDO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MonthEndDao {
    int closeMonthEnd(MonthEndDO monthEndDO);
    int openMonthEnd(MonthEndDO monthEndDO);
    int getLastYear();
    int getLastMonth(int year);
    int getNextYear();
    int getNextMonth(int year);
}

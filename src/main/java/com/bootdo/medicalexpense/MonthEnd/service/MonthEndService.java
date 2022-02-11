package com.bootdo.medicalexpense.MonthEnd.service;
import com.bootdo.medicalexpense.MonthEnd.domain.MonthEndDO;
public interface MonthEndService {
    MonthEndDO getLast();
    MonthEndDO getNext();
    int closeMonthEnd(MonthEndDO monthEndDO);
    int openMonthEnd(MonthEndDO monthEndDO);
}

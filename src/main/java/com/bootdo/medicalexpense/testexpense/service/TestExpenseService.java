package com.bootdo.medicalexpense.testexpense.service;

import com.bootdo.medicalexpense.testexpense.domain.TestExpense;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface TestExpenseService {
    //add testexpense
    public List<TestExpense> list(MultipartFile file);
    public int save(List<TestExpense>  testExpense);
}

package com.bootdo.medicalexpense.testexpense.service.impl;

import java.io.*;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.*;

import com.bootdo.employee.domain.EmployeeDO;
import com.bootdo.medicalexpense.testexpense.domain.TestExpense;
import com.bootdo.medicalexpense.testexpense.service.TestExpenseService;
import com.bootdo.medicalexpense.testexpense.dao.TestExpenseDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import java.util.ArrayList;
@Service
public class TestExpenseServiceImpl implements TestExpenseService {
    @Autowired
    private TestExpenseDao testExpenseDao;
    @Override
    public List<TestExpense> list(MultipartFile file){

        int intRow=0;
        String[] as;
        List<TestExpense> testExpenseList=new ArrayList<>();
        List<TestExpense> testExpenseListNull=new ArrayList<>();
        /**
         *
         * 判断文件版本
         */
        String fileName = file.getOriginalFilename();
        String suffix = fileName.substring(fileName.lastIndexOf(".")+1);
        if(!suffix.equals("txt")){
            return null;
        }
        try {
            File tmpFile = File.createTempFile(fileName, suffix);
            file.transferTo(tmpFile);
            InputStreamReader read = new InputStreamReader(new FileInputStream(tmpFile), "GBK");//考虑到编码格式
            BufferedReader bufferedReader = new BufferedReader(read);
            String lineTxt = null;
            while((lineTxt = bufferedReader.readLine()) != null){
                if (intRow>=1)
                {
                    as=lineTxt.split("\\|",-1);
                    TestExpense testExpense=new TestExpense();
                    //交易流水号
                    testExpense.id=as[0].toString();
                    //姓名
                    testExpense.employeename=as[1].toString();
                    //公民身份号码
                    testExpense.employeevidno=as[2].toString();
                    //人员状态和人员类别
                    EmployeeDO employeeDO=getEmployee(as[1].toString(),as[2].toString());
                    if (employeeDO!=null){
                        testExpense.employstatusid=employeeDO.getEmploystatusId().intValue();
                        testExpense.employtypeid=employeeDO.getEmploytypeId().intValue();
                        testExpense.employeeid=employeeDO.getId().intValue();
                    }
                    //医疗类别
                    testExpense.medicaltype=as[3].toString();
                    //医疗参保人员类别
                    testExpense.employstatus=as[4].toString();
                    //交易日期
                    testExpense.trededate=getDate(as[5].toString());
                    //支付日期
                    testExpense.paydate=getDate(as[6].toString());
                    //费用总金额
                    testExpense.amount1=Double.valueOf(as[7].toString());
                    //医保内费用
                    testExpense.amount2=Double.valueOf(as[8].toString());
                    //医保外费用（含拒付）
                    testExpense.amount3=Double.valueOf(as[9].toString());
                    //统筹支付金额
                    testExpense.amount4=Double.valueOf(as[10].toString());
                    //统筹自付金额
                    testExpense.amount5=Double.valueOf(as[11].toString());
                    //大额支付金额
                    testExpense.amount6=Double.valueOf(as[12].toString());
                    //大额自付金额
                    testExpense.amount7=Double.valueOf(as[13].toString());
                    //拒付金额
                    testExpense.amount8=Double.valueOf(as[14].toString());
                    //支付对象
                    testExpense.amount9=Double.valueOf(as[15].toString());
                    //自付二金额
                    testExpense.amount10=Double.valueOf(as[16].toString());
                    //起付标准
                    testExpense.amount11=Double.valueOf(as[17].toString());
                    //超封顶的医保内费用
                    testExpense.amount12=Double.valueOf(as[18].toString());
                    //门诊大额补充保险支付金额
                    testExpense.amount13=Double.valueOf(as[19].toString());
                    //住院统筹补充保险支付金额
                    testExpense.amount14=Double.valueOf(as[20].toString());
                    //住院大额补充保险支付金额
                    testExpense.amount15=Double.valueOf(as[21].toString());
                    //门诊大额军残补助金额
                    testExpense.amount16=Double.valueOf(as[22].toString());
                    //住院统筹军残补助金额
                    testExpense.amount17=Double.valueOf(as[23].toString());
                    //住院大额军残补助金额
                    testExpense.amount18=Double.valueOf(as[24].toString());
                    //补充保险支付金额
                    testExpense.amount19=Double.valueOf(as[25].toString());
                    //军残补助支付金额
                    testExpense.amount20=Double.valueOf(as[26].toString());
                    //单位补充医疗保险(原公疗)金额
                    testExpense.amount21=Double.valueOf(as[27].toString());
                    //自付一金额
                    testExpense.amount22=Double.valueOf(as[28].toString());
                    //入院日期
                    testExpense.admitdate=getDate(as[29].toString());
                    //出院日期
                    testExpense.dischargedate=getDate(as[30].toString());
                    testExpenseList.add(testExpense);
                    if (employeeDO==null){
                        testExpenseListNull.add(testExpense);
                    }
                }
                intRow++;
            }
        }
        catch(Exception e){
            //do nothing
            e.printStackTrace();
        }
        if (testExpenseListNull.isEmpty()) {
            return testExpenseList;
        }
        else{
            return testExpenseListNull;
        }
    }

    @Override
    public int save(List<TestExpense>  testExpense){
        //testExpenseDao=new TestExpenseDao();
        int i=testExpenseDao.save(testExpense);
        return i;
    }

    public Date getDate(String strDate)    {
        Date dateResult=null;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        try{
            if (strDate!=null) {
                if (strDate.length()>0) {
                    dateResult = sdf.parse(strDate);
                }
            }
        }
        catch (Exception e){
            dateResult=null;
        }
        return dateResult;
    }

    public EmployeeDO getEmployee(String name,String vnoid)
    {
        Map<String,Object> map=new HashMap<String, Object>();
        map.put("name", name);
        map.put("vnoid", vnoid);
        return testExpenseDao.getEmployee(map);
    }
}

package com.bootdo.medicalexpense.claimexpense.service.impl;

import com.bootdo.medicalexpense.medicalexpense1.domain.Medicalexpense1DO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.*;

import com.bootdo.medicalexpense.claimexpense.dao.ClaimexpenseDao;
import com.bootdo.medicalexpense.claimexpense.domain.ClaimexpenseDO;
import com.bootdo.medicalexpense.claimexpense.service.ClaimexpenseService;
import com.bootdo.medicalexpense.claimexpense.domain.MonthEnd;
import com.bootdo.employee.domain.EmployeeDO;
import com.bootdo.medicalexpense.claimexpense.domain.RegulationDO;



@Service
public class ClaimexpenseServiceImpl implements ClaimexpenseService {
	@Autowired
	private ClaimexpenseDao claimexpenseDao;
	@Override
	public ClaimexpenseDO get(String id){
		return claimexpenseDao.get(id);
	}
	//获取最后结账年月
	@Override
	public MonthEnd getMonthEnd(){
		MonthEnd monthEnd=new MonthEnd();
		int year=claimexpenseDao.getMonthEndyear();
		monthEnd.setYear(year);
		monthEnd.setMonth(claimexpenseDao.getMonthEndmonth(year));
		return monthEnd;
	}
	@Override
	public List<ClaimexpenseDO> list(Map<String, Object> map){
		//return claimexpenseDao.list(map);
		int age=0;

		List<ClaimexpenseDO> list1=new ArrayList<ClaimexpenseDO>();
		//get ldate udate
		Map<String,Object> map2=new HashMap<String,Object>();
		map2.put("year",Integer.parseInt(map.get("year").toString()));
		map2.put("month",Integer.parseInt(map.get("month").toString()));

		//删除旧数据
		claimexpenseDao.delOldClaimExpense(map2);

		//得到开始日期和结束日期
		String udate=claimexpenseDao.getUdate(map2);
		String ldate=claimexpenseDao.getLdate(map2);


		Map<String,Object> map1=new HashMap<String,Object>();
		map1.put("ldate",ldate);
		map1.put("udate",udate);
		List<Medicalexpense1DO> list2=claimexpenseDao.listExpense(map1);
		for(Medicalexpense1DO medicalexpense1DO:list2){
			ClaimexpenseDO claimexpenseDO=new ClaimexpenseDO();
			claimexpenseDO.setEmployeeid(medicalexpense1DO.getEmployeeid());
			claimexpenseDO.setEmploystatusid(medicalexpense1DO.getEmploystatusid());
			claimexpenseDO.setEmploytypeid(medicalexpense1DO.getEmploytypeid());
			//人员信息
			EmployeeDO employeeDO=claimexpenseDao.getEmployee(
					medicalexpense1DO.getEmployeeid()
			);
			double relationRate=0;
			if(medicalexpense1DO.getEmploystatusid()==4){
				relationRate=(double)employeeDO.getRate();
			}
			//自付2
			claimexpenseDO.setAmount10(medicalexpense1DO.getAmount10());
			claimexpenseDO.setClaimamount10(getClaimamount10(
					medicalexpense1DO.getEmploystatusid(),
					medicalexpense1DO.getEmploytypeid(),
					medicalexpense1DO.getAmount10(),
					relationRate
			));
			//自付1
			claimexpenseDO.setAmount22(medicalexpense1DO.getAmount22());
			claimexpenseDO.setClaimamount22(getClaimamount22(
					medicalexpense1DO.getEmploystatusid(),
					medicalexpense1DO.getEmploytypeid(),
					medicalexpense1DO.getAmount22(),
					relationRate
			));

			claimexpenseDO.setId(medicalexpense1DO.getId());
			claimexpenseDO.setPaydate(medicalexpense1DO.getPaydate());

			claimexpenseDO.setEmployeename(employeeDO.getName());
			claimexpenseDO.setEmployeevidno(employeeDO.getVnoid());
			claimexpenseDO.setEmploytype(claimexpenseDao.getEmployeeType(
					medicalexpense1DO.getEmploytypeid()
			));
			claimexpenseDO.setEmploystatus(claimexpenseDao.getEmployeeStatus(
					medicalexpense1DO.getEmploystatusid()
			));
			Calendar ca = Calendar.getInstance();
			ca.setTime(employeeDO.getBirth());
			int birthYear=ca.get(Calendar.YEAR);
			age=Integer.parseInt(map.get("year").toString())-
					birthYear;
			//自费
			Double amount3;
			if(medicalexpense1DO.getType().equals("importTxt")){
				//自费金额=amount1
				//-amount4
				//-amount10
				//-amount13
				//-amount14
				//-amount15
				//-amount16
				//-amount17
				//-amount18
				//-amount19
				//-amount20
				//-amount21
				//-amount22
				BigDecimal b = new BigDecimal(medicalexpense1DO.getAmount1()
						-medicalexpense1DO.getAmount4()
						-medicalexpense1DO.getAmount6()
						-medicalexpense1DO.getAmount10()
						-medicalexpense1DO.getAmount13()
						-medicalexpense1DO.getAmount14()
						-medicalexpense1DO.getAmount15()
						-medicalexpense1DO.getAmount16()
						-medicalexpense1DO.getAmount17()
						-medicalexpense1DO.getAmount18()
						-medicalexpense1DO.getAmount19()
						-medicalexpense1DO.getAmount20()
						-medicalexpense1DO.getAmount21()
						-medicalexpense1DO.getAmount22());
				amount3=b.setScale(2,BigDecimal.ROUND_HALF_UP).doubleValue();
			}
			else{
				amount3=medicalexpense1DO.getAmount3();
			}

			claimexpenseDO.setAmount3(amount3);
			//自费报销 参数 人员编号，年龄，人员状态，人员类别，年，月，自费
			BigDecimal b = new BigDecimal(getClaimamount3(
					Integer.parseInt(employeeDO.getId().toString()),
					age,
					medicalexpense1DO.getEmploystatusid(),
					medicalexpense1DO.getEmploytypeid(),
					Integer.parseInt(map.get("year").toString()),
					Integer.parseInt(map.get("month").toString()),
					amount3));

			claimexpenseDO.setClaimamount3(b.setScale(2,BigDecimal.ROUND_HALF_UP).doubleValue());

			//list1.add(claimexpenseDO);
			claimexpenseDO.setYear(Integer.parseInt(map.get("year").toString()));
			claimexpenseDO.setMonth(Integer.parseInt(map.get("month").toString()));

			claimexpenseDao.save(claimexpenseDO);
		}
		return claimexpenseDao.list(map1);
	}
	
	@Override
	public int count(Map<String, Object> map){
		return claimexpenseDao.count(map);
	}
	
	@Override
	public int save(ClaimexpenseDO claimexpense){
		return claimexpenseDao.save(claimexpense);
	}
	
	@Override
	public int update(ClaimexpenseDO claimexpense){
		return claimexpenseDao.update(claimexpense);
	}
	
	@Override
	public int remove(String id){
		return claimexpenseDao.remove(id);
	}
	
	@Override
	public int batchRemove(String[] ids){
		return claimexpenseDao.batchRemove(ids);
	}
	//自付一报销 参数 人员状态，人员类别,自付1
	public double getClaimamount22(int employstatus_id,int employtype_id,double zf1,double relationRate){
		double dResult=0;
		double dRate=0;
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("employstatus_id",employstatus_id);
		map.put("employtype_id",employtype_id);
		//普通
		if((employstatus_id==1)||(employstatus_id==2)){
			dRate=claimexpenseDao.getzf1(map);
			if(dRate<0){
				dRate=0;
			}
			dResult=((double)Math.round((double)(zf1*dRate)))/100;
		}
		//离休
		if (employstatus_id==3){
			dRate=claimexpenseDao.getzf1(map);
			if(dRate<0){
				dRate=0;
			}
			dResult=((double)Math.round((double)(zf1*dRate)))/100;
		}
		//家属
		if (employstatus_id==4){
			dResult=((double)Math.round((double)(zf1*relationRate)))/100;
		}

		return dResult;
	}
	//自付二报销 参数 人员状态，人员类别,自付2
	public double getClaimamount10(int employstatus_id,int employtype_id,double zf2,double relationRate){
		double dResult=0;
		double dRate=0;
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("employstatus_id",employstatus_id);
		map.put("employtype_id",employtype_id);

		//普通
		if((employstatus_id==1)||(employstatus_id==2)){
			dRate=claimexpenseDao.getzf2(map);
			if(dRate<0){
				dRate=0;
			}
			dResult=((double)Math.round((double)(zf2*dRate)))/100;
		}
		//离休
		if (employstatus_id==3){
			dRate=claimexpenseDao.getzf2(map);
			if(dRate<0){
				dRate=0;
			}
			dResult=((double)Math.round((double)(zf2*dRate)))/100;
		}
		//家属
		if (employstatus_id==4){
			dResult=((double)Math.round((double)(zf2*relationRate)))/100;
		}

		return dResult;
	}
	//自费报销 参数 人员编号，年龄，人员状态，人员类别，年，月，自费
	public double getClaimamount3(int employeeid,int age, int employstatus_id,int employtype_id,int year,int month,double zf3){
		double dResult=0;
		double dRate=0;
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("employstatus_id",employstatus_id);
		map.put("employtype_id",employtype_id);
		Map<String,Object> map1=new HashMap<String,Object>();
		map1.put("year",year);
		map1.put("month",month);
		map1.put("employeeid",employeeid);

		//普通
		if((employstatus_id==1)||(employstatus_id==2)){
			dRate=claimexpenseDao.getzf3(map);
			if (dRate>0){
				dResult=((double)Math.round((double)(zf3*dRate)))/100;}
			if (dRate==-1){
				dResult=getRegulation(map1,zf3,1,age);
			}
			if (dRate==-2){
				dResult=getRegulation(map1,zf3,2,age);
			}
		}
		//离休
		if (employstatus_id==3){
			dRate=claimexpenseDao.getzf3(map);
			if (dRate>0){
				dResult=((double)Math.round((double)(zf3*dRate)))/100;}
			if (dRate==-1){
				dResult=getRegulation(map1,zf3,1,age);
			}
			if (dRate==-2){
				dResult=getRegulation(map1,zf3,2,age);
			}
		}
		//家属
		if (employstatus_id==4){
			dRate=0;
			dResult=zf3*dRate;
		}
		return dResult;
	}
	//标准1和2
	public double getRegulation(Map map,double zf3,int type,int age){
		double dResult=0;
		//历史自费金额累计
		double dSumzf3=claimexpenseDao.getSumzf3(map);
		//历史计算自费金额累计
		double dClaimSumzf3=claimexpenseDao.getSumClaimzf3(map);
		RegulationDO regulationDO=null;
		if(type==1){
			regulationDO=claimexpenseDao.getRegulation1(age);
		}
		else if(type==2){
			regulationDO=claimexpenseDao.getRegulation2(age);
		}
		double amt1=regulationDO.getAmt1();
		double amt2=regulationDO.getAmt2();
		double amt3=regulationDO.getAmt3();
		double rate1=regulationDO.getRate1();
		double rate2=regulationDO.getRate2();
		double rate3=regulationDO.getRate3();
		//累计报销金额=历史自费3+本次自费3
		double dSumZf3Amount=dSumzf3+zf3;
		//累计报销金额<=1000
		//本月计算结果=累计报销金额*100%-历史计算自费金额累计
		amt2=(amt2-amt1)*100/rate2+amt1;
		amt3=amt3+amt1;
		if (dSumZf3Amount<=amt1){
			dResult=((double)Math.round(
					(double)(dSumZf3Amount*rate1)))/100
					-dClaimSumzf3;
		}
		//累计报销金额>1000 and 累计报销金额<=2000
		//本月计算结果=(累计报销金额-1000)*50%+1000*100%-历史计算自费金额累计
		else if ((dSumZf3Amount>amt1)&&(dSumZf3Amount<=amt2)){
			dResult=((double)Math.round(
					(double)((dSumZf3Amount-amt1)*rate2)))/100
					+((double)Math.round(
					(double)(amt1*rate1)))/100
					-dClaimSumzf3;
		}
		//累计报销金额>2000 and 累计报销金额<=6000
		//本月计算结果=(2000-1000)*50%+1000*100%-历史计算自费金额累计
		else if ((dSumZf3Amount>amt2)&&(dSumZf3Amount<=amt3)){
			dResult=((double)Math.round(
					(double)((amt2-amt1)*rate2)))/100
					+((double)Math.round(
					(double)(amt1*rate1)))/100
					-dClaimSumzf3;
		}
		//累计报销金额>6000
		//本月计算结果=(累计报销金额-6000)*80%+(2000-1000)*50%+1000*100%-历史计算自费金额累计
		else if (dSumZf3Amount>amt3){
			dResult=((double)Math.round(
					(double)((dSumZf3Amount-amt3)*rate3)))/100
					+((double)Math.round(
					(double)((amt2-amt1)*rate2)))/100
					+((double)Math.round(
					(double)(amt1*rate1)))/100
					-dClaimSumzf3;
		}
		/*
		//历史自费金额累计+本次自费金额>=amt2且历史自费金额累计+本次自费金额<amt3 报销金额=0
		if ((dSumzf3+zf3>=amt2)&&(dSumzf3+zf3<amt3)){
			dResult=0;
		}
		//历史自费金额累计>=amt2且历史自费金额累计+本次自费金额>=amt3 报销金额=
		else if ((dSumzf3>=amt2)&&(dSumzf3+zf3>=amt3)){
			dResult=0;
		}
		//历史自费金额累计<amt2且>=amt1 且 历史自费金额累计+本次自费金额>amt2且 历史自费金额累计+本次自费金额<=amt3
		// 报销金额=（amt2-历史自费金额累计）*50%
		else if((dSumzf3<amt2)&&(dSumzf3>=amt1)&&(zf3+dSumzf3>amt2)){
			dResult=((double)Math.round(
							(double)((amt2-dSumzf3)*rate2)))/100;
		}
		//历史自费金额累计<amt2且>=amt1 且 历史自费金额累计+本次自费金额<amt2
		//报销金额=本次自费金额*50%
		else if((dSumzf3<amt2)&&(dSumzf3>=amt1)&&(zf3+dSumzf3<=amt2)){
			dResult=((double)Math.round(
							(double)(zf3*rate2)))/100;
		}
		//历史自费金额累计<amt1 且 历史自费金额累计+本次自费金额<=amt1
		//报销金额=本次自费金额*100%
		else if((dSumzf3<amt1)&&(zf3+dSumzf3<=amt1)){
			dResult=((double)Math.round(
							(double)(zf3*rate1)))/100;
		}
		//历史自费金额累计<amt1 且 历史自费金额累计+本次自费金额>amt1 且 <=amt2
		//报销金额=amt1-历史自费金额累计%100 + 本次自费金额+历史自费金额累计-amt1*50%
		else if((dSumzf3<amt1)&&(zf3+dSumzf3>amt1)&&(zf3+dSumzf3<=amt2)){
			dResult=((double)Math.round(
							(double)((amt1-dSumzf3)*rate1)))/100
			+((double)Math.round(
							(double)((zf3-amt1+dSumzf3)*rate2)))/100;
		}
		//历史自费金额累计<amt1 且 历史自费金额累计+本次自费金额>amt2
		//报销金额=amt1-历史自费金额累计%100 + amt2-amt1*50%
		else if((dSumzf3<amt1)&&(zf3+dSumzf3>amt2)){
			dResult=((double)Math.round(
							(double)((amt1-dSumzf3)*rate1)))/100
					+((double)Math.round(
							(double)((amt2-amt1)*rate1)))/100;
		}

		*/

		return dResult;
	}
}

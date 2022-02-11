use bootdo;
select a.*,b.prodgroupname from tb_product a,tb_prodgroup b where a.prodgroupid=b.id;
select a.* from tb_product a where a.prodgroupid=3;
select a.*,b.prodgroupname from tb_product a,tb_prodgroup b where a.prodgroupid=b.id and a.id=6;

select * from tb_leads;

select * from testexpense;
--delete from testexpense;
--delete from medicalexpense;
select * from medicalexpense;
delete from claimexpense;
select a.id,a.employstatus_id,b.statusname,a.employtype_id, c.statusname typename,zf1,zf2,zf3
from regulation a 
left join employstatus b on a.employstatus_id=b.id
left join employtype c on a.employtype_id=c.id;
select * from regulation1;
select * from regulation2;

select `id`,`employeeid`,`employstatusid`,`employtypeid`,`relationid`,`medicaltype`,`trededate`,`paydate`,`amount1`,`amount2`,`amount3`,`amount4`,`amount5`,`amount6`,`amount7`,`amount8`,`amount9`,`amount10`,`amount11`,`amount12`,`amount13`,`amount14`,`amount15`,`amount16`,`amount17`,`amount18`,`amount19`,`amount20`,`amount21`,`amount22`,`amount23`,`admitdate`,`dischargedate`,`vno`,`ddate`,`dmaker`,`vdate`,`vmaker`,`cmemo`,`amount99`,`amount100`,`amount101`,`amount102`,`isback` from medicalexpense;
select `employstatus`,`employtype`,`id`,`employeeid`,`employeename`,`employstatusid`,`employtypeid`,`employeevidno`,`paydate`,`amount3`,`claimamount3`,`amount10`,`claimamount10`,`amount22`,`claimamount22` from claimexpense WHERE paydate >= ? and paydate <= ? order by `id` ;

select a.*,b.name employeename,c.statusname employstatusname,d.statusname employtypename
from medicalexpense a,employee b,employstatus c,employtype d
where a.employeeid=b.id and a.employstatusid=c.id and a.employtypeid=d.id;

select a.*,b.name employeename,c.statusname employstatusname,d.statusname employtypename
		from medicalexpense a
		left join employee b on a.employeeid=b.id
		left join employstatus c on a.employstatusid=c.id
		left join employtype d on a.employtypeid=d.id;
        
select `id`,`name`,`code`,`dept_id`,`employstatus_id`,`employtype_id`,`email`,`mobile`,`vnoid`,`sex`,`birth`,`status`,`user_id_create`,`gmt_create`,`gmt_modified`,`parentid`,`isrelation`,`ismedinsur` from employee;

select * from employee where name='张宸宁';
delete from employee where name='张宸宁';

select a.子女姓名1,a.子女身份证号1,a.报销比例1,b.id from relationimport a,employee b where a.人员姓名=b.name and a.身份证号=b.vnoid and a.是否双职工='否' and a.子女姓名1!='';
select a.子女姓名2,a.子女身份证号2,a.报销比例2,b.id from relationimport a,employee b where a.人员姓名=b.name and a.身份证号=b.vnoid and a.是否双职工='否' and a.子女姓名2!='';
select a.子女姓名1,a.子女身份证号1,a.报销比例1,b.id from relationimport a,employee b where a.人员姓名=b.name and a.身份证号=b.vnoid and a.是否双职工='是' and a.子女姓名1!='';
select a.子女姓名2,a.子女身份证号2,a.报销比例2,b.id from relationimport a,employee b where a.人员姓名=b.name and a.身份证号=b.vnoid and a.是否双职工='是' and a.子女姓名2!='';


select `id`,`name`,`code`,`dept_id`,`employstatus_id`,`employtype_id`,`email`,`mobile`,`vnoid`,`sex`,`birth`,`status`,`user_id_create`,`gmt_create`,`gmt_modified`,`parentid`,`isrelation`,`ismedinsur` from employee where id = (select id from employee where id = 561 and `parentid`=0) or id=(select `parentid` from employee where id = 561 and `parentid`!=0) ；

insert into medicalexpense ( `id`, `employeeid`, `employeename`, `employstatusid`, `employtypeid`, `employvidno`, `relationid`, `medicaltype`, `trededate`, `paydate`, `amount1`, `amount2`, `amount3`, `amount4`, `amount5`, `amount6`, `amount7`, `amount8`, `amount9`, `amount10`, `amount11`, `amount12`, `amount13`, `amount14`, `amount15`, `amount16`, `amount17`, `amount18`, `amount19`, `amount20`, `amount21`, `amount22`, `amount23`, `admitdate`, `dischargedate`, `vno`, `ddate`, `dmaker`, `vdate`, `vmaker`, `cmemo`, `amount99`, `amount100`, `amount101`, `amount102`, `isback` ) values ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? ) ；

select min(year) year from monthend where bclose=0;
select min(month) month from monthend where bclose=0 and year=2021;

update monthend set bclose=1 where year=2021 and month=1;


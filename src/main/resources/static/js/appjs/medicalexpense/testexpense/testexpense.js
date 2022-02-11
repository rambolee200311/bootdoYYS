var prefix = "/medicalexpense/testexpense"
$().ready(function() {
	validateRule();
});

/*$.validator.setDefaults({
	submitHandler : function() {
		list();
	}
})*/

function importtxt() {
	var data=new FormData($('#signupForm')[0]);
	console.log(data);
	$.ajax({
		//cache : true,
		type : "POST",
		url : prefix +"/list",
		//data : $('#signupForm').serialize(),// 你的formid
		data:data,
		processData:false,
		contentType:false,
		datatype:"json",
		//encType:"multipart/form-data",
		//async : false,
		success : function(data) {
			//
				alert("校验完成！");
				console.log(data);
				/*$("#exampleTable").html("<tr><td>交易流水号</td><td>姓名</td><td>金额</td></tr>");
				for(var i=0;i<data.length;i++){
					$("#exampleTable").append("<tr><td>"+data[i].id+"</td><td>"+data[i].name+"</td><td>"+data.amount1.toString()+"</td></tr>")
				}*/
			$table = $('#exampleTable')
				.bootstrapTable(
					{
						data:data,
						/*method : 'get', // 服务器数据的请求方式 get or post
						url : prefix + "/list", // 服务器数据的加载地址*/
						//	showRefresh : true,
						//	showToggle : true,
						//	showColumns : true,
						iconSize : 'outline',
						toolbar : '#exampleToolbar',
						striped : true, // 设置为true会有隔行变色效果
						dataType : "json", // 服务器返回的数据类型
						pagination : true, // 设置为true会在底部显示分页条
						// queryParamsType : "limit",
						// //设置为limit则会发送符合RESTFull格式的参数
						singleSelect : false, // 设置为true将禁止多选
						// contentType : "application/x-www-form-urlencoded",
						// //发送到服务器的数据编码类型
						pageSize : 1000, // 如果设置了分页，每页数据条数
						pageNumber : 1, // 如果设置了分布，首页页码
						//search : true, // 是否显示搜索框
						showColumns : false, // 是否显示内容下拉框（选择显示的列）
						sidePagination : "client", // 设置在哪里进行分页，可选值为"client" 或者 "server"
						queryParams : function(params) {
							return {
								//说明：传入后台的参数包括offset开始索引，limit步长，sort排序列，order：desc或者,以及所有列的键值对
								limit: params.limit,
								offset:params.offset
								// name:$('#searchName').val(),
								// username:$('#searchName').val()
							};
						},
						// //请求服务器数据时，你可以通过重写参数的方式添加一些额外的参数，例如 toolbar 中的参数 如果
						// queryParamsType = 'limit' ,返回参数必须包含
						// limit, offset, search, sort, order 否则, 需要包含:
						// pageSize, pageNumber, searchText, sortName,
						// sortOrder.
						// 返回false将会终止请求
						columns : [
							{
								checkbox : true
							},
							{field:'id',title:'交易流水号'},
							{field:'employeeid',title:'人员ID'},
							{field:'employeename',title:'姓名'},
							{field:'employstatusid',title:'人员状态'},
							{field:'employtypeid',title:'人员类别'},
							{field:'employeevidno',title:'公民身份号码'},
							{field:'medicaltype',title:'医疗类别'},
							{field:'employstatus',title:'医疗参保人员类别'},
							{field:'trededate',title:'交易日期'},
							{field:'paydate',title:'支付日期'},
							{field:'amount1',title:'费用总金额'},
							{field:'amount2',title:'医保内费用'},
							{field:'amount3',title:'医保外费用（含拒付）'},
							{field:'amount4',title:'统筹支付金额'},
							{field:'amount5',title:'统筹自付金额'},
							{field:'amount6',title:'大额支付金额'},
							{field:'amount7',title:'大额自付金额'},
							{field:'amount8',title:'拒付金额'},
							{field:'amount9',title:'支付对象'},
							{field:'amount10',title:'自付二金额'},
							{field:'amount11',title:'起付标准'},
							{field:'amount12',title:'超封顶的医保内费用'},
							{field:'amount13',title:'门诊大额补充保险支付金额'},
							{field:'amount14',title:'住院统筹补充保险支付金额'},
							{field:'amount15',title:'住院大额补充保险支付金额'},
							{field:'amount16',title:'门诊大额军残补助金额'},
							{field:'amount17',title:'住院统筹军残补助金额'},
							{field:'amount18',title:'住院大额军残补助金额'},
							{field:'amount19',title:'补充保险支付金额'},
							{field:'amount20',title:'军残补助支付金额'},
							{field:'amount21',title:'单位补充医疗保险(原公疗)金额'},
							{field:'amount22',title:'自付一金额'},
							{field:'admitdate',title:'入院日期'},
							{field:'dischargedate',title:'出院日期'}]
					});

			//
		}
	});

}

function save() {
	var rows = $('#exampleTable').bootstrapTable('getSelections'); // 返回所有选择的行，当没有选择的记录时，返回一个空数组
	if (rows.length == 0) {
		layer.msg("请选择要保存的数据");
		return;
	}
	$.each(rows, function(i, row) {
		if (row['employeeid']==null){
			layer.msg("未匹配人员档案，请检查！");
			return;
		}
	});
	/*layer.confirm("确认要保存选中的'" + rows.length + "'条数据吗?", {
		btn : [ '确定', '取消' ]
		// 按钮
	},function () {*/
		// 遍历所有选择的行数据，取每条数据对应的ID
		var list = [];//构造集合对象
		$.each(rows, function(i, row) {
			list.push({
				'id':row['id'],
				'employeename':row['employeename'],
				'employeeid':row['employeeid'],
				'employstatusid':row['employstatusid'],
				'employtypeid':row['employtypeid'],
				'employeevidno':row['employeevidno'],
				'medicaltype':row['medicaltype'],
				'employstatus':row['employstatus'],
				'trededate':row['trededate'],
				'paydate':row['paydate'],
				'amount1':row['amount1'],
				'amount2':row['amount2'],
				'amount3':row['amount3'],
				'amount4':row['amount4'],
				'amount5':row['amount5'],
				'amount6':row['amount6'],
				'amount7':row['amount7'],
				'amount8':row['amount8'],
				'amount9':row['amount9'],
				'amount10':row['amount10'],
				'amount11':row['amount11'],
				'amount12':row['amount12'],
				'amount13':row['amount13'],
				'amount14':row['amount14'],
				'amount15':row['amount15'],
				'amount16':row['amount16'],
				'amount17':row['amount17'],
				'amount18':row['amount18'],
				'amount19':row['amount19'],
				'amount20':row['amount20'],
				'amount21':row['amount21'],
				'amount22':row['amount22'],
				'admitdate':row['admitdate'],
				'dischargedate':row['dischargedate'],
				'rate':100,
				'type':'importTxt',
				'ddate':getServerDate()
			});
		});
		//var postData={testExpense:JSON.stringify(list)};
		var	postData=JSON.stringify(list);
		//postData=JSON.stringify( {"datas":postData});
		$.ajax({
				type : 'POST',
				async: true,
			  	datatype:'json',
				contentType: 'application/json;charset=UTF-8',
				//data : {"testExpense":postData},
				data:postData,
				url : prefix + '/save',
				success : function(r) {
					if (r.code == 0) {
						layer.msg(r.msg);
						/*reLoad();
						layer.closeAll('dialog');
						*/
					} else {
						layer.msg(r.msg);
					}
				}
			});
		//layer.closeAll('dialog');
	/*}, function() {

	});*/
}
function validateRule() {
	var icon = "<i class='fa fa-times-circle'></i> ";
	$("#signupForm").validate({
		rules : {
			file : {
				required : true
			}
		},
		messages : {
			file : {
				required : icon + "请选择文件"
			}
		}
	})
}

function getServerDate(){
	var xhr = null;
	if(window.XMLHttpRequest){
		xhr = new window.XMLHttpRequest();
	}else{ // ie
		xhr = new ActiveObject("Microsoft")
	}

	xhr.open("GET","/",false)//false不可变
	xhr.send(null);
	var date = xhr.getResponseHeader("Date");
	date=new Date(date);
	var seperator1 = "-";
	var year = date.getFullYear();
	var month = date.getMonth() + 1;
	var strDate = date.getDate();
	if (month >= 1 && month <= 9) {
		month = "0" + month;
	}
	if (strDate >= 0 && strDate <= 9) {
		strDate = "0" + strDate;
	}
	var currentdate = year + seperator1 + month + seperator1 + strDate+" 00:00:00";
	return currentdate;
}
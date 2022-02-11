$(function() {
	$.ajax({
		url : "/userinfo/getuser",
		dataType : "json",
		type : "get",
		success : function(data) {
			$("input#dmaker").val(data.username);
			/*$("input.ddate").val(new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime()));*/
		},
	});
	var date=new Date();
	$("input#ddate").datepicker('setDate',date);
	/*$("input#ddate").datepicker({
		viewDate : date
	});*/
	//chosen
	$(".chosen-select").chosen({disable_search:false, search_contains:true});
});
$().ready(function() {
	validateRule();
});

$.validator.setDefaults({
	submitHandler : function() {
		save();
	}
})
function save() {
	$.ajax({
		cache : true,
		type : "POST",
		url : "/medicalexpense/medicalexpense2/save",
		data : $('#signupForm').serialize(),// 你的formid
		async : false,
		error : function(request) {
			parent.layer.alert("Connection error");
		},
		success : function(data) {
			if (data.code == 0) {
				/*parent.layer.msg("操作成功");
				parent.reLoad();
				var index = parent.layer.getFrameIndex(window.name); // 获取窗口索引
				parent.layer.close(index);*/
				parent.layer.msg("操作成功");
				layer.closeAll('dialog');
				$('#signupForm')[0].reset();
			} else {
				parent.layer.alert(data.msg)
				layer.closeAll('dialog');
			}

		}
	});

}

function validateRule() {
	var icon = "<i class='fa fa-times-circle'></i> ";
	$("#signupForm").validate({
		rules : {
			employeeid : {
				required : true
			},
			id : {
				required : true
			}
		},
		messages : {
			employeeid : {
				required : icon + "请输入姓名"
			},
			id : {
				required : icon + "请输入交易流水号"
			}
		}
	})
}

$("select#employeeid").change(function (){
	var index1=$(this).val();
	getEmployee(index1);
	getParent(index1);

});
function  getEmployee(id)
{
	$.ajax({
		url:"/relation/relation/getById/"+id,
		type:"get",
		datatype:"json",
		/*data:JSON.stringify(data),*/
		success:function(data){
			//parent.layer.alert(data.toString());
			$("input#code").val(data.code);
			$("input#employeename").val(data.name);
			$("input#employstatusid").val(data.employstatusId);
			$("input#employtypeid").val(data.employtypeId);
			$("input#employeevidno").val(data.vnoid);
			getRelationStatusName(data.employstatusId);
			getRelationTypeName(data.employtypeId);
		}
	})
};
function  getParent(id)
{
	$.ajax({
		url:"/employee/employee/getByParentId/"+id,
		type:"get",
		datatype:"json",
		/*data:JSON.stringify(data),*/
		success:function(data){
			//parent.layer.alert(data.toString());
			$("input#parentid").val(data.id);
			$("input#parentname").val(data.name);
			$("input#parentcode").val(data.code);
			//$("input#code").val(data.code);
			$("input#parenttypeid").val(data.employtypeId);
			$("input#parentstatusid").val(data.employstatusId);
			$("input#parentvnoid").val(data.vnoid);
			getEmployTypeName(data.employtypeId);
			getEmployStatusName(data.employstatusId);
		}
	})
};
function getEmployTypeName(id){
	$.ajax({
		url: "/employee/employtype/getById/" + id,
		type: "get",
		datatype: "json",
		success: function (data) {
			$("input#parenttype").val(data.statusname);
		}
	})
};
function getEmployStatusName(id){
	$.ajax({
		url: "/employee/employstatus/getById/" + id,
		type: "get",
		datatype: "json",
		success: function (data) {
			$("input#parentstatus").val(data.statusname);
		}
	})
};
function getRelationStatusName(id){
	$.ajax({
		url: "/employee/employstatus/getById/" + id,
		type: "get",
		datatype: "json",
		success: function (data) {
			$("input#employeestatus").val(data.statusname);
		}
	})
};
function  getRelationTypeName(id){
	$.ajax({
		url: "/employee/employtype/getById/" + id,
		type: "get",
		datatype: "json",
		success: function (data) {
			$("input#employeetype").val(data.statusname);
		}
	})
}
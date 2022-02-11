$(function() {
	$.ajax({
		url : "/userinfo/getuser",
		dataType : "json",
		type : "get",
		success : function(data) {
			$("input#userIdCreate").val(data.userId);
			/*$("input#gmtCreate").val(new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime()));*/
		},
	});
	/*var date=new Date();
	$("input#ddate").datepicker('setDate',date);
	$("input#ddate").datepicker({
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
		url : "/relation/relation/save",
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

			//form.render();
		}
	});

}

function validateRule() {
	var icon = "<i class='fa fa-times-circle'></i> ";
	$("#signupForm").validate({
		rules : {
			employeename : {
				required : true
			}
		},
		messages : {
			employeeiname : {
				required : icon + "请输入姓名"
			}
		}
	})
}
//根据身份证信息写入出生年月
$("input#vnoid").blur(function(){
	var vnoid=$("input#vnoid").val();
	//$("input#mobile").val(vnoid);
	if($.trim(vnoid) != "") {
            var date = "";
            if(vnoid.length == 15) {
                    date =  '19'+vnoid.substr(6,2)+'-'+vnoid.substr(8,2)+'-'+vnoid.substr(10,2);
                } else if (vnoid.length == 18) {
                    date =  vnoid.substr(6,4)+'-'+vnoid.substr(10,2)+'-'+vnoid.substr(12,2);
                }
        $("input#birth").val(date);
		if (parseInt(vnoid.substr(16, 1)) % 2 == 1) {
			$("input[name='sex'][value='1']").attr('checked',true);
			} else {
			$("input[name='sex'][value='2']").attr('checked',true);
			}
	}
});
$("select#employeeid").change(function (){
	var index1=$(this).val();
	//parent.layer.alert(index);
	var data={"id":index1};
	$.ajax({
		url:"/employee/employee/getById/"+index1,
		type:"get",
		datatype:"json",
		/*data:JSON.stringify(data),*/
		success:function(data){
			//parent.layer.alert(data.toString());
			$("input#code").val(data.code);
			$("input#employtypeid").val(data.employtypeId);
			$("input#employstatusid").val(data.employstatusId);
			$("input#vnoid").val(data.vnoid);
			getEmployTypeName(data.employtypeId);
			getEmployStatusName(data.employstatusId);
		}
	})
});
function getEmployTypeName(id){
	$.ajax({
		url: "/employee/employtype/getById/" + id,
		type: "get",
		datatype: "json",
		success: function (data) {
			$("input#employtype").val(data.statusname);
		}
	})
};
function getEmployStatusName(id){
	$.ajax({
		url: "/employee/employstatus/getById/" + id,
		type: "get",
		datatype: "json",
		success: function (data) {
			$("input#employstatus").val(data.statusname);
		}
	})
};



var prefix = "/medicalexpense/closeexpense";
$(function() {
    getMonthEnd();
    //load();
});
function  getMonthEnd(){
    $.ajax({
        url : "/medicalexpense/claimexpense/getMonthEnd",
        dataType : "json",
        type : "get",
        success : function(data) {
            $("input#year").val(data.year);
            $("input#month").val(data.month);
            load(data.year,data.month);
        },
    });
};
function load(year,month) {
    $('#exampleTable')
        .bootstrapTable(
            {
                method : 'get', // 服务器数据的请求方式 get or post
                url : prefix + "/list", // 服务器数据的加载地址
                //showRefresh : true,//是否显示刷新按钮
                //showToggle : true,//是否显示详细视图和列表视图的切换按钮
                //showColumns : true,//选择要显示的列
                //printFormatter:
                iconSize : 'outline',
                toolbar : '#exampleToolbar',
                showExport: true,           //是否显示导出按钮
                buttonsAlign: "right",//按钮位置
                exportDataType: "basic",
                exportTypes: ['excel'],
                exportOptions:{
                    //ignoreColumn:[0],      //导出数据忽略第一列
                    fileName:'发放月报表',     //导出数据的文件名
                    worksheetName:'sheet1',//表格工作区名称
                    tableName:'发放月报表',
                    excelstyles:['background-color','color','font-size','font-weight']
                },
                Icons:'glyphicon-export',
                striped : true, // 设置为true会有隔行变色效果
                dataType : "json", // 服务器返回的数据类型
                pagination : true, // 设置为true会在底部显示分页条
                // queryParamsType : "limit",
                // //设置为limit则会发送符合RESTFull格式的参数
                singleSelect : false, // 设置为true将禁止多选
                // contentType : "application/x-www-form-urlencoded",
                // //发送到服务器的数据编码类型
                pageSize :3000, // 如果设置了分页，每页数据条数
                pageNumber : 1, // 如果设置了分布，首页页码
                //search : true, // 是否显示搜索框
                showColumns : false, // 是否显示内容下拉框（选择显示的列）
                sidePagination : "server", // 设置在哪里进行分页，可选值为"client" 或者 "server"
                queryParams : function(params) {
                    return {
                        //说明：传入后台的参数包括offset开始索引，limit步长，sort排序列，order：desc或者,以及所有列的键值对
                        limit: params.limit,
                        offset:params.offset,
                        /*year:$('#year').val(),
                        month:$('#month').val()*/
                        year:year,
                        month:month
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
                        field : 'dept_id',
                        title : '部门ID',
                        visible:false,
                    },
                    {
                        field : 'dept_name',
                        title : '部门',
                        visible:false,
                    },
                    {
                        field : 'employeeid',
                        title : '员工id' ,
                        visible:false,
                    },
                    {
                        field : 'employeename',
                        title : '员工姓名'
                    },
                    {
                        field : 'employstatusid',
                        title : '人员用工状态' ,
                        visible:false,
                    },
                    {
                        field : 'employstatus',
                        title : '人员用工状态'
                    },
                    {
                        field : 'employtypeid',
                        title : '人员类别' ,
                        visible:false,
                    },
                    {
                        field : 'employtype',
                        title : '人员类别'
                    },
                    {
                        field : 'closeamount',
                        title : '发放金额'
                    }]
            });
}
function reLoad() {
    //getMonthEnd();
    $('#exampleTable').bootstrapTable('refresh');

}
function add() {
    layer.open({
        type : 2,
        title : '增加',
        maxmin : true,
        shadeClose : false, // 点击遮罩关闭层
        area : [ '800px', '520px' ],
        content : prefix + '/add' // iframe的url
    });
}
function edit(id) {
    layer.open({
        type : 2,
        title : '编辑',
        maxmin : true,
        shadeClose : false, // 点击遮罩关闭层
        area : [ '800px', '520px' ],
        content : prefix + '/edit/' + id // iframe的url
    });
}
function remove(id) {
    layer.confirm('确定要删除选中的记录？', {
        btn : [ '确定', '取消' ]
    }, function() {
        $.ajax({
            url : prefix+"/remove",
            type : "post",
            data : {
                'id' : id
            },
            success : function(r) {
                if (r.code==0) {
                    layer.msg(r.msg);
                    reLoad();
                }else{
                    layer.msg(r.msg);
                }
            }
        });
    })
}

function resetPwd(id) {
}
function batchRemove() {
    var rows = $('#exampleTable').bootstrapTable('getSelections'); // 返回所有选择的行，当没有选择的记录时，返回一个空数组
    if (rows.length == 0) {
        layer.msg("请选择要删除的数据");
        return;
    }
    layer.confirm("确认要删除选中的'" + rows.length + "'条数据吗?", {
        btn : [ '确定', '取消' ]
        // 按钮
    }, function() {
        var ids = new Array();
        // 遍历所有选择的行数据，取每条数据对应的ID
        $.each(rows, function(i, row) {
            ids[i] = row['id'];
        });
        $.ajax({
            type : 'POST',
            data : {
                "ids" : ids
            },
            url : prefix + '/batchRemove',
            success : function(r) {
                if (r.code == 0) {
                    layer.msg(r.msg);
                    reLoad();
                } else {
                    layer.msg(r.msg);
                }
            }
        });
    }, function() {

    });
}

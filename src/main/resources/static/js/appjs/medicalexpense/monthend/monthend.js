var prefix = "/medicalexpense/monthend";
function load(){
    $.ajax({
        url : "/medicalexpense/monthend",
        dataType : "json",
        type : "get",
    });
}
function openMonthEnd(){
    var year=$("input#lastyear").val();
    var month=$("input#lastmonth").val();
    $.ajax({
        cache : true,
        type : "POST",
        url : "/medicalexpense/monthend"+"/open",
        data : {
            year:year,
            month:month
        },
        async : false,
        error : function(request) {
            parent.layer.alert("Connection error");
        },
        success : function(data) {
            if (data.code == 0) {
                parent.layer.msg("操作成功");
                layer.closeAll('dialog');
            } else {
                parent.layer.alert(data.msg)
                layer.closeAll('dialog');
            }

        }
    });
    location.reload();
}
function closeMonthEnd(){
    var year=$("input#nextyear").val();
    //parent.layer.alert(year)
    var month=$("input#nextmonth").val();
    $.ajax({
        cache : true,
        type : "POST",
        url : "/medicalexpense/monthend"+"/close",
        data : {
            year:year,
            month:month
        },
        async : false,
        error : function(request) {
            parent.layer.alert("Connection error");
        },
        success : function(data) {
            if (data.code == 0) {
                parent.layer.msg("操作成功");
                layer.closeAll('dialog');
            } else {
                parent.layer.alert(data.msg)
                layer.closeAll('dialog');
            }

        }
    });
    location.reload();
}

window.onload=function () {
    show();
};
function show(){
    var obj = new Object();
    console.debug("调用show函数");
    $.ajax({
        type:'post',
        url:"/Application/findapp",
        dataType:'json',
        contentType:"application/json;charset=utf-8",
        cache:true,
        data:JSON.stringify(obj),
        success:function(result){
            if(result.code!="0"){
                $("#id").text(result.obj.id);
                $("#type").text(result.obj.type);
                $("#text").text(result.obj.text);
                $("#picture").text(result.obj.picture);
                $("#status").text(result.obj.status);
                $("#submittime").text(formatDatebox(result.obj.submittime));
                $("#approvaltime").text(formatDatebox(result.obj.approvaltime));
                $("#approvalid").text(result.obj.approvalid);
                $("#submitid").text(result.obj.submitid);
            }
            else{
                alert(result.message);
            }
        }
    });
}

//通过id获取修改的申请表信息
function editapp(){
    var obj = new Object();
    $.ajax({
        type:'post',
        url:"/Application/findapp",
        dataType:'json',
        contentType:"application/json;charset=utf-8",
        cache:true,
        data:JSON.stringify(obj),
        success:function(result) {
            if (result.code != "0") {
                $("#edit_appid").val(result.obj.id);
                $("#edit_apptype").val(result.obj.type);
                $("#edit_apptext").val(result.obj.text);
                $("#edit_apppicture").val(result.obj.picture);
                $("#edit_appstatus").val(result.obj.status);
                $("#edit_appsubmittime").val(formatDatebox(result.obj.submittime));
                $("#edit_appapprovaltime").val(formatDatebox(result.obj.approvaltime));
                $("#edit_appapprovalid").val(result.obj.approvalid);
                $("#edit_appsubmitid").val(result.obj.submitid);
            }
            else {
                alert(result.message);
            }
        }
    });
}

//执行修改企业信息操作
function update() {
    var obj = new Object();
    obj=getFormData($("#edit_application_form"));
    $.ajax({
        type: 'post',
        url: "/Application/edit",
        dataType: 'json',
        contentType: "application/json;charset=utf-8",
        cache: true,
        data: JSON.stringify(obj),
        success: function (result) {
            //doData("/Application/edit",getFormData($("#edit_application_form")),function(result){
            alert(result.message);
            window.location.reload();
        }
    });
}
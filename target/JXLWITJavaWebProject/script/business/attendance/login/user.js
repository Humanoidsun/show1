//注册
function save() {
    var obj = new Object();
    obj.loginid = $("#loginid").val();
    obj.password = $("#password").val();
    var checkpassword = $("#checkpassword").val();
    if(obj.password!=checkpassword){
       alert("两次密码不一致，请重试！");
    }
    else
    {
        $.ajax({
            type: 'post',
            url: "/User/insert",
            dataType: 'json',
            contentType: "application/json; charset=utf-8",
            cache: true,
            data: JSON.stringify(obj),
            success: function (result) {
                alert(result.message);
                back();
            },
            error: function () {
                alert("提交失败，请重试");
            }
        });
    }
}
//登录
function login() {
    var obj = new Object();
    obj.loginid = $("#loginid").val();
    obj.password = $("#password").val();
    $.ajax({
        type:'post',
        url:"/User/login",
        dataType:'json',
        contentType: "application/json; charset=utf-8",
        cache: true,
        data: JSON.stringify(obj),
        success:function (result) {
            if(result.code=='0002'){
                window.location.href="/admin/attendance/index.jsp";
                // setTimeout(function () {
                //     alert(result.message+" 2秒后跳转到主页。");
                // },2000);
            }
            else{
                alert(result.message);
            }
        },
        error: function () {
            alert("提交失败，请重试");
        }
    });

}
function register() {
    window.location.href="/User/index";
}
function back() {
    window.location.href="/";
}
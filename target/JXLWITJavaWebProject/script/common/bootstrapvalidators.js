/**
 * Created by wph-pc on 2018/3/15.
 */
/*配合BoostrapValidator验证*/
function MyBootstrapValidator() {

}
MyBootstrapValidator.prototype.notEmpty=function (msg) {
    var temp=new Object();
    temp.message=msg;
    return temp;
}
MyBootstrapValidator.prototype.stringLength=function (min,max) {
    var temp=new Object();
    temp.message="字符长度必须在【"+min+"】和【"+max+"】之间！";
    temp.min=min;
    temp.max=max;
    return temp;
}
MyBootstrapValidator.prototype.regexp=function (msg,reg) {
    var temp=new Object();
    temp.message=msg;
    temp.regexp=reg;
    return temp;
}
MyBootstrapValidator.prototype.emailAddress=function () {
    var temp=new Object();
    temp.message='请输入正确的邮件地址如：123@qq.com';
    return temp;
}
MyBootstrapValidator.prototype.integer=function () {
    var temp=new Object();
    temp.message='请输入整数！';
    return temp;
}
MyBootstrapValidator.prototype.stringValidator=function (isNeed,min,max) {
    var temp=new Object();
    if(isNeed)
        temp.notEmpty=this.notEmpty("不能为空");
    if (min!=undefined && max!=undefined)
      temp.stringLength=this.stringLength(min,max);
    return temp;
}
MyBootstrapValidator.prototype.phoneValidator=function (isNeed) {
    var temp=new Object();
    if(isNeed)
        temp.notEmpty=this.notEmpty("手机号码不能为空");
    temp.stringLength=this.stringLength(11,11);
    temp.regexp=this.regexp("请输入正确的手机号码",/^1[3|5|8]{1}[0-9]{9}$/);
    return temp;
}

MyBootstrapValidator.prototype.integerRangeValidator=function (isNeed,fieldText,min,max) {
    var temp=new Object();
    if (isNeed)
        temp.notEmpty=this.notEmpty(fieldText+"不能为空!");
    temp.numeric={message:fieldText+ '只能是数字'};
    temp.callback=new Object();
    temp.callback.message='请输入【'+min+'】到【'+max+'】之间的整数';
    temp.callback.callback=function (value, validator) {
        if (parseInt(value) < min || parseInt(value) > max)
            return false;
        else
            return true;
    }
    return temp;
}

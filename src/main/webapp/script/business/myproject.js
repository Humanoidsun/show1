/****************************************
 * 当前项目专属的公共脚本资源
 * Created by wph-pc on 2018/6/23.
 **************************************/


/*获取网站的项目根地址*/
function getRootPath(){
    return "http://localhost:8081/jxlwit";
}

function getCookie(c_name)
{
    if (document.cookie.length>0)
    {
        c_start=document.cookie.indexOf(c_name + "=")
        if (c_start!=-1)
        {
            c_start=c_start + c_name.length+1
            c_end=document.cookie.indexOf(";",c_start)
            if (c_end==-1) c_end=document.cookie.length
            return unescape(document.cookie.substring(c_start,c_end))
        }
    }
    return ""
}
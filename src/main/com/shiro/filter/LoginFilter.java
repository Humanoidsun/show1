package shiro.filter;

import kesun.entity.system.User;
import util.SpringContextUtil;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.web.filter.AccessControlFilter;
import shiro.TokenManage;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;


/**
 * 登录验证过滤器
 * Created by wph-pc on 2017/9/18.
 */
public class LoginFilter extends AccessControlFilter {
    protected boolean isAccessAllowed(ServletRequest request, ServletResponse response, Object o) throws Exception {
        Object obj= TokenManage.getSession().getAttribute("user");
        if (obj!=null || isLoginRequest(request, response)){
            /*此处填写需要写入session中的用户对象信息*/
            User users=(User)obj;
            if (users!=null)
            return true;
        }
        return false ;
    }

    protected boolean onAccessDenied(ServletRequest request, ServletResponse response) throws Exception {
        saveRequestAndRedirectToLogin(request, response);
        return false ;
    }
}

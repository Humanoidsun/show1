package shiro.filter;

import kesun.entity.system.Actor;
import kesun.entity.system.User;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.util.StringUtils;
import org.apache.shiro.web.filter.AccessControlFilter;
import org.apache.shiro.web.util.WebUtils;
import shiro.FixURL;
import shiro.TokenManage;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

/**
 * 角色过滤器
 * Created by wph-pc on 2017/9/17.
 */
public class RoleFilter extends AccessControlFilter {
    protected boolean isAccessAllowed(ServletRequest servletRequest, ServletResponse servletResponse, Object o) throws Exception {
        User user=TokenManage.getToken();

        if (user==null) return false;

        List<Actor> actors=user.getActors();
        Subject subject=getSubject(servletRequest,servletResponse);//获取当前用户资料；
        if (actors==null || actors.size()==0) return false;
        for (Actor actor:actors
             ) {
            if (subject.hasRole(actor.getId()))
                return true;
        }

        return false;
    }

    protected boolean onAccessDenied(ServletRequest servletRequest, ServletResponse servletResponse) throws Exception {
        Subject subject = getSubject(servletRequest, servletResponse);
        if (subject.getPrincipal() == null) {//表示没有登录，重定向到登录页面
            saveRequest(servletRequest);
            WebUtils.issueRedirect(servletRequest, servletResponse, FixURL.LOGIN_URL);
        } else {
            if (StringUtils.hasText(FixURL.UNAUTHORIZED_URL)) {//如果有未授权页面跳转过去
                WebUtils.issueRedirect(servletRequest, servletResponse, FixURL.UNAUTHORIZED_URL);
            } else {//否则返回401未授权状态码
                WebUtils.toHttp(servletResponse).sendError(HttpServletResponse.SC_UNAUTHORIZED);
            }
        }
        return false;
    }
}

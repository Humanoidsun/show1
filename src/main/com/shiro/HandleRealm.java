package shiro;

import kesun.entity.system.User;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.SimplePrincipalCollection;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Created by wph-pc on 2017/9/18.
 */
public class HandleRealm extends AuthorizingRealm {
    public HandleRealm()
    {
        super();
    }
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        //根据自己系统规则的需要编写获取授权信息，这里为了快速入门只获取了用户对应角色的资源url信息
        String username = (String) principalCollection.fromRealm(getName()).iterator().next();
        if (username != null) {
            Set<String> roles=null;
            if (SecurityUtils.getSubject().getSession().getAttribute("role")!=null)
                roles=(Set<String>)SecurityUtils.getSubject().getSession().getAttribute("role");
            Set<String> powers =null;
            if (SecurityUtils.getSubject().getSession().getAttribute("power")!=null)
                powers=(Set<String>)SecurityUtils.getSubject().getSession().getAttribute("power");
           if (powers != null && !powers.isEmpty()) {
                SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
                info.addStringPermissions(powers);//加入权限
                /*设置角色，从数据库中读取，案例是静态数据*/
                info.setRoles(roles);
                return info;
            }
        }
        return null;
    }

    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        ShiroToken token = (ShiroToken) authenticationToken;

        SimpleAuthenticationInfo info=null;

        // 通过表单接收的用户名
        String username = token.getUsername();
        Object obj=TokenManage.getSession().getAttribute("user");
        User user=(obj==null || !(obj instanceof User))?null:(User)obj;
        if(null == user){
            info=new SimpleAuthenticationInfo(null,null, getName());
            //throw new AccountException("帐号或密码不正确！");
        }else if(user.getStatus().trim().equals("注销")){
            info=new SimpleAuthenticationInfo(null,null, getName());
            //throw new DisabledAccountException("帐号已经禁止登录！");
        }else{
            SecurityUtils.getSubject().getSession().setAttribute("user",user);//保存登录用户信息

            SecurityUtils.getSubject().getSession().setAttribute("role",TokenManage.getSession().getAttribute("role"));
            SecurityUtils.getSubject().getSession().setAttribute("power",TokenManage.getSession().getAttribute("power"));

        }
        info=new SimpleAuthenticationInfo(token.getUsername(),token.getPwd(), getName());
        return info;
    }

    /**
     * 清空当前用户权限信息
     */
    public  void clearCachedAuthorizationInfo() {
        PrincipalCollection principalCollection = SecurityUtils.getSubject().getPrincipals();
        SimplePrincipalCollection principals = new SimplePrincipalCollection(
                principalCollection, getName());
        super.clearCachedAuthorizationInfo(principals);
    }
    /**
     * 指定principalCollection 清除
     */
    public void clearCachedAuthorizationInfo(PrincipalCollection principalCollection) {
        SimplePrincipalCollection principals = new SimplePrincipalCollection(
                principalCollection, getName());
        super.clearCachedAuthorizationInfo(principals);
    }
}

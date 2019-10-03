package shiro;

import kesun.entity.system.User;
import org.apache.shiro.session.mgt.SessionKey;
import org.apache.shiro.session.mgt.SessionManager;
import util.SpringContextUtil;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.SimplePrincipalCollection;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;
import java.util.Set;

/**
 * 用户登录统一管理
 * Created by wph-pc on 2017/9/27.
 */
public class TokenManage {
    //用户登录管理
    public static final HandleRealm realm = (HandleRealm) SpringContextUtil.getBean("shiroRealm");
    /**
     * 获取当前登录的用户User对象
     * @return
     */
    public static User getToken() {
        if (SecurityUtils.getSubject().getPrincipal() != null && SecurityUtils.getSubject().getPrincipal().toString()!="")
        {
            if (getSession()!=null && getSession().getAttribute("user")!=null)
                return (User)getSession().getAttribute("user");
            else
            {
                User model=new User();
                model.setId(SecurityUtils.getSubject().getPrincipal().toString().trim());
                model.setNumber(model.getId());
                getSession().setAttribute("user",model);//设置登录用户信息
                return model;
            }
        }
        else
          return null ;
    }
    /**
     * 获取当前用户的Session
     * @return
     */
    public static  Session getSession(){
        return SecurityUtils.getSubject().getSession();
    }

    /**
     * 获取当前用户NAME
     * @return
     */
    public static String getNickname(){
        return getToken().getNumber();
    }
    /**
     * 获取当前用户ID
     * @return
     */
    public static String getUserId(){
        return getToken()==null?null:getToken().getNumber();
    }
    /**
     * 把值放入到当前登录用户的Session里
     * @param key
     * @param value
     */
    public static void setVal2Session(Object key ,Object value){
        getSession().setAttribute(key, value);
    }
    /**
     * 从当前登录用户的Session里取值
     * @param key
     * @return
     */
    public static Object getVal2Session(Object key){
        return getSession().getAttribute(key);
    }

    /**
     * 登录
     * @param user
     * @param rememberMe
     * @return
     */
    public static User login(User user, Boolean rememberMe){
        ShiroToken token = new ShiroToken(user.getNumber(), user.getPassword());
        token.setRememberMe(rememberMe);
        SecurityUtils.getSubject().login(token);

        return getToken();
    }

    /**
     * 判断是否登录
     * @return
     */
    public static boolean isLogin() {
        return null != SecurityUtils.getSubject().getPrincipal();
    }
    /**
     * 退出登录
     */
    public static void logout() {

        SecurityUtils.getSubject().logout();
    }
    /*判断是否拥有指定的权限，返回*/
    public static boolean[] IsHasPowers(String ...powers)
    {
        return SecurityUtils.getSubject().isPermitted(powers);
    }

    /**
     * 清空当前用户权限信息。
     * 目的：为了在判断权限的时候，再次会再次 <code>doGetAuthorizationInfo(...)  </code>方法。
     * ps：	当然你可以手动调用  <code> doGetAuthorizationInfo(...)  </code>方法。
     * 		这里只是说明下这个逻辑，当你清空了权限，<code> doGetAuthorizationInfo(...)  </code>就会被再次调用。
     */
    public static void clearNowUserAuth(){
        /**
         * 这里需要获取到shrio.xml 配置文件中，对Realm的实例化对象。才能调用到 Realm 父类的方法。
         */
        /**
         * 获取当前系统的Realm的实例化对象，方法一（通过 @link org.apache.shiro.web.mgt.DefaultWebSecurityManager 或者它的实现子类的{Collection<Realm> getRealms()}方法获取）。
         * 获取到的时候是一个集合。Collection<Realm>
         RealmSecurityManager securityManager =
         (RealmSecurityManager) SecurityUtils.getSecurityManager();
         SampleRealm realm = (SampleRealm)securityManager.getRealms().iterator().next();
         */
        /**
         * 方法二、通过ApplicationContext 从Spring容器里获取实列化对象。
         */
        realm.clearCachedAuthorizationInfo();
        /**
         * 当然还有很多直接或者间接的方法，此处不纠结。
         */
    }




}

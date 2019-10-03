package controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import kesun.entity.KesunReturn;
import kesun.entity.system.Actor;
import kesun.entity.system.Clerk;
import kesun.entity.system.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import shiro.TokenManage;
import util.HttpClientUtil;
import util.PropertyUtil;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

/**
 * Created by wph-pc on 2018/5/26.
 */
@CrossOrigin
@Controller
public class UserServiceController{
    @Autowired
    private HttpServletRequest request;
    /*将当前用户信息写入Session*/
    private void setUserInfoToSession(User user, String credit)
    {
        /*根据参数，验证用户是否存在，获取用户的相关资料*/
        Map<String,Object> params=new HashMap<String,Object>();
        PropertyUtil pu=new PropertyUtil("server.properties");
        if (user!=null) {
            HttpServletResponse response = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getResponse();
            //将登录用户信息写入cookie
            response.addCookie(new Cookie("user", user.getId()));
            TokenManage.getSession().setAttribute("user", user);
            TokenManage.getSession().setAttribute("credit",credit);
           /*角色处理*/
            Set<String> roles = new HashSet<String>();
            if (user.getActors() != null && user.getActors().size() > 0) {
                for (Actor a : user.getActors()
                        ) {
                    roles.add(a.getId());
                }
                TokenManage.getSession().setAttribute("role", roles);
            }

           /*获取当前用户权限*/
            params.clear();
            params.put(pu.getProperty("usersystem.powerParam"), credit);
            String obj = HttpClientUtil.GetServiceData(pu.getProperty("usersystem.powerhttp"), params);
            JSONArray powers = JSONObject.parseArray(obj);
            if (powers != null && powers.size() > 0) {
                Set<String> source = new HashSet<String>();
                for (Object temp : powers) {
                    source.add(temp.toString());
                }
                System.out.println("当前用户权限：" + obj + ";权限数量：" + powers.size());
                TokenManage.getSession().setAttribute("power", source);
            } else
                TokenManage.getSession().setAttribute("power", null);

            TokenManage.login(user, false);//登录验证
        }

    }
    /*身份验证后直接进入新闻管理页面*/
    @RequestMapping(value="remoteurl")
    public String remoteURL(@RequestParam("credit") String credit,@RequestParam("url") String url)
    {
        PropertyUtil pu=new PropertyUtil("server.properties");
        User u=checkUser(credit);
        if (u==null)
        {
            return "../login";
        }else
            return url;
    }
    /*远程用户JSON数据格式提取转成Clerk对象*/
    private Clerk doUserJsonToClerk(String json)
    {
        JSONObject tempJson=JSONObject.parseObject(json);
        if (tempJson==null) return null;
        //处理照片
        if (tempJson.get("people")!=null){
            JSONObject people=(JSONObject)tempJson.get("people");
            Clerk clerk=new Clerk();
            clerk.setPhoto(people.getString("photo"));
            return clerk;
        }
        return null;
    }
    /*根据凭证号进行登录*/
    private User
    checkUser(String credit)
    {
        /*根据参数，验证用户是否存在，获取用户的相关资料*/
        Map<String,Object> params=new HashMap<String,Object>();
        PropertyUtil pu=new PropertyUtil("server.properties");
        params.put(pu.getProperty("usersystem.checkUserParam"),credit);
        String obj=HttpClientUtil.GetServiceData(pu.getProperty("usersystem.checkUserhttp"),params);

        if (obj!=null && !obj.trim().equals(""))
        {
            kesun.entity.system.User u=JSONObject.parseObject(obj,kesun.entity.system.User.class);

            //处理照片
            if (u.getPeople()==null){
                u.setPeople(doUserJsonToClerk(obj));
            }

            setUserInfoToSession(u,credit);
            return u;
        }else
            return null;
    }
    @RequestMapping(value="remoteLogin")
    public String login(@RequestParam("credit") String credit)
    {
        PropertyUtil pu=new PropertyUtil("server.properties");
        User u=checkUser(credit);
        if (u!=null)
        {
            return "../index";
        }else
            return pu.getProperty("usersystem.login");
    }
    @RequestMapping(value="logout")
    @ResponseBody
    public Object logout()
    {
        TokenManage.logout();
        KesunReturn back=new KesunReturn();
        back.setMessage("系统退出");
        back.setObj(null);
        back.setCode("1");
        return back;
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    @ResponseBody
    public Object localLogin(@RequestBody Map<String,Object> params)
    {
        KesunReturn back=new KesunReturn();
          /*根据参数，验证用户是否存在，获取用户的相关资料*/
        Map<String,Object> tempParam=new HashMap<String,Object>();
        PropertyUtil pu=new PropertyUtil("server.properties");
        tempParam.put(pu.getProperty("usersystem.loginnumber"),params.get("number"));
        tempParam.put(pu.getProperty("usersystem.loginpassword"),params.get("password"));
        JSONObject obj=HttpClientUtil.SendPost(pu.getProperty("usersystem.login"),tempParam);
        if (obj!=null)
        {
            if (obj.get("obj")!=null)
            {
                User u=JSONObject.parseObject(obj.get("obj").toString(),User.class);
                //处理照片
                if (u.getPeople()==null){
                    u.setPeople(doUserJsonToClerk(obj.get("obj").toString()));
                }

                setUserInfoToSession(u,obj.get("code").toString());
                back.setCode("1");
                back.setMessage("身份验证通过！");
                back.setObj(u);
            }
            else
            {
                back.setCode("0");
                back.setMessage("账号或密码有误！");
                back.setObj(null);
            }
        }
        else
        {
            back.setCode("0");
            back.setMessage("账号或密码有误！");
            back.setObj(null);
        }
        return back;
    }
    @RequestMapping(value = "/getMyCredit", method = RequestMethod.POST)
    @ResponseBody
    public Object getMyCredit()
    {
        KesunReturn back=new KesunReturn();
        if (TokenManage.getSession().getAttribute("credit")!=null)
        {
            back.setObj(TokenManage.getSession().getAttribute("credit"));
            back.setCode("1");
            back.setMessage("系统获取到了您登陆的信息！");
        }
        else
        {
            back.setObj(null);
            back.setCode("0");
            back.setMessage("系统获取到了您登陆的信息，请重新登录！");
        }
        return back;
    }
    @RequestMapping(value = "/getMyInfo", method = RequestMethod.POST)
    @ResponseBody
    public Object getMyInfo()
    {
        KesunReturn back=new KesunReturn();
        if (TokenManage.getSession().getAttribute("user")!=null && TokenManage.getSession().getAttribute("user") instanceof User)
        {
            back.setObj(TokenManage.getSession().getAttribute("user"));
            back.setCode("1");
            back.setMessage("系统获取到了您登陆的信息！");
        }
        else
        {
            back.setObj(null);
            back.setCode("0");
            back.setMessage("系统获取到了您登陆的信息，请重新登录！");
        }
        return back;
    }
    /*根据登录凭证，获取登录用户信息*/
    public static User GetUser(String credit)
    {
        /*根据参数，验证用户是否存在，获取用户的相关资料*/
        Map<String,Object> params=new HashMap<String,Object>();
        PropertyUtil pu=new PropertyUtil("server.properties");
        params.put(pu.getProperty("usersystem.checkUserParam"),credit);
        String obj=HttpClientUtil.GetServiceData(pu.getProperty("usersystem.checkUserhttp"),params);

        if (obj!=null && !obj.trim().equals(""))
        {
            kesun.entity.system.User u=JSONObject.parseObject(obj,kesun.entity.system.User.class);

            return u;
        }else
            return null;
    }
}

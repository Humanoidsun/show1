package controller.attendance.impl;

import bll.KesunSuperService;
import bll.attendance.impl.UserServiceImpl;
import com.alibaba.fastjson.JSON;
import controller.KesunBusinessController;
import controller.attendance.IUserController;
import entity.User;
import kesun.entity.AbsSuperObject;
import kesun.entity.KesunReturn;
import org.apache.poi.hpsf.Section;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import util.Tool;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
@RequestMapping("User")
public class UserController extends KesunBusinessController implements IUserController {
    @Resource(name="bUser")
    private UserServiceImpl bll;
    @Override
    public KesunSuperService getService() {
        return bll;
    }
    @RequestMapping("index")
    public String index(){
        return "attendance/register";
    }
    @RequestMapping("insert")
    @ResponseBody
    public Object insert(@RequestBody Map<String,Object> map){
        KesunReturn back = new KesunReturn();//返回操作
        AbsSuperObject model = JSON.parseObject(JSON.toJSONString(map),getService().getModel().getClass());
        if(model == null){
            back.setCode("0001");
            back.setMessage("抱歉，系统没有获取到需要数据！");
            back.setObj(null);
        }
        else
        {
            if (model.getId().trim().equals(""))
                model.setId(Tool.CreateID());
            getService().setModel(model);
        }
        back = getService().add();
        System.out.println(back.getMessage());
        return back;
    }
    @RequestMapping("login")
    @ResponseBody
    public Object login(@RequestBody Map<String,Object> map, HttpServletResponse response, HttpServletRequest request){
        System.out.println("login:"+" "+map.get("loginid")+" "+map.get("password"));
        KesunReturn back = new KesunReturn();
        AbsSuperObject model = JSON.parseObject(JSON.toJSONString(map),getService().getModel().getClass());
        if(model == null){
            back.setCode("0001");
            back.setMessage("抱歉，系统没有获取到需要数据！");
            back.setObj(null);
            return back;
        }
        else
        {
            getService().setModel(model);
            User result = (User) bll.login();
            if(result!=null){
                HttpSession session = request.getSession();
                session.setAttribute("id",result.getId());
                session.setAttribute("username",result.getName());
                back.setCode("0002");
                back.setMessage("登录成功即将跳转");
                return back;
            }
            else
            {
                back.setMessage("您没有注册，请先注册！");
                back.setCode("0003");
                return back;
            }
        }
    }
    @RequestMapping("update")
    @ResponseBody
    public Object update(@RequestBody Map<String,Object> map, HttpServletResponse response, HttpServletRequest request){
        System.out.println("update"+" "+map.get("id")+" "+map.get("name"));
        KesunReturn back = new KesunReturn();
        AbsSuperObject model = JSON.parseObject(JSON.toJSONString(map),getService().getModel().getClass());
        if(model == null){
            back.setCode("0001");
            back.setMessage("抱歉，系统没有获取到需要数据！");
            back.setObj(null);
            return back;
        }
        else
        {
            if (model.getId().trim().equals(""))
                model.setId(Tool.CreateID());
            getService().setModel(model);
            return getService().edit();
        }
    }
    @RequestMapping("findById")
    @ResponseBody
    public KesunReturn find(@RequestBody Map<String,Object> map, HttpServletResponse response, HttpServletRequest request){
        HttpSession session = request.getSession();
        AbsSuperObject model = JSON.parseObject(JSON.toJSONString(map),getService().getModel().getClass());
        model.setId((String) session.getAttribute("id"));
        KesunReturn back = new KesunReturn();
        if(model.getId()!=null){
            getService().setModel(model);
            User obj = (User) getService().getMe();
            if(obj!=null){
                System.out.println(obj);
                back.setCode("0002");
                back.setMessage("数据请求成功！");
                back.setObj(obj);
                return back;
            }
            else{
                back.setCode("0003");
                back.setMessage("抱歉，数据请求失败！");
                return back;
            }
        }
        else{
            back.setCode("0001");
            back.setMessage("抱歉，系统没有获取到需要数据！");
            back.setObj(null);
            return back;
        }
    }
    @RequestMapping("logout")
    @ResponseBody
    public KesunReturn logout(@RequestBody Map<String,Object> map, HttpServletResponse response, HttpServletRequest request){
        HttpSession session = request.getSession();
        KesunReturn back = new KesunReturn();
        session.invalidate();
        back.setMessage("成功注销");
        return back;
    }
}

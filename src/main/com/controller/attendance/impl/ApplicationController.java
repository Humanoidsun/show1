package controller.attendance.impl;

import bll.KesunSuperService;
import bll.attendance.impl.ApplicationServiceImpl;
import com.alibaba.fastjson.JSON;
import com.sun.tools.internal.ws.processor.model.Model;
import controller.KesunBusinessController;
import controller.attendance.IApplication;
import entity.Application;
import kesun.entity.AbsSuperObject;
import kesun.entity.KesunReturn;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import util.Tool;

import javax.annotation.Resource;
import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @Author: 刘轩宇
 * @Date: 2019/6/20 14:55
 * @Version 3.2
 */
@Controller
@RequestMapping("Application")
public class ApplicationController extends KesunBusinessController implements IApplication {
    @Resource(name = "bApplication")
    private ApplicationServiceImpl bll;
    @RequestMapping("index")
    public String index(){
        return "attendance/application";
    }

    @RequestMapping("insert")
    @ResponseBody
    public Object insert(@RequestBody Map<String,Object> map){
        KesunReturn result = new KesunReturn();//返回操作
        AbsSuperObject model = JSON.parseObject(JSON.toJSONString(map),getService().getModel().getClass());
        getService().setModel(model);
        result=bll.add();
        return result;
    }

    @RequestMapping("editapp")
    @ResponseBody
    public KesunReturn editapp(@RequestBody Map<String,Object> map){
        KesunReturn back = new KesunReturn();
        map.put("approvaltime",new Date());
        AbsSuperObject model = JSON.parseObject(JSON.toJSONString(map),getService().getModel().getClass());
        if(bll.editapp(map)>0){
            back.setMessage("成功");
        }
        else{
            back.setMessage("失败");
        }
        return back;
    }

    @RequestMapping("delete")
    @ResponseBody
    public Object delete(@RequestBody Map<String,Object> map){
        KesunReturn result = new KesunReturn();//返回操作
        AbsSuperObject model = JSON.parseObject(JSON.toJSONString(map),getService().getModel().getClass());
        getService().setModel(model);
        result=bll.del();
        return result;
    }

    @RequestMapping("findapp")
    @ResponseBody
    public KesunReturn findapp(@RequestBody Map<String,Object> map, HttpServletResponse response, HttpServletRequest request){
        map.put("approvalid",request.getSession().getAttribute("id"));
        return  bll.findapp(map);
    }

    @RequestMapping("findByid")
    @ResponseBody
    public KesunReturn findbyid(@RequestBody Map<String,Object> map) {
        AbsSuperObject model = JSON.parseObject(JSON.toJSONString(map),getService().getModel().getClass());
        return bll.findbyid(model.getId());
    }
    @RequestMapping("submitApplication")
    @ResponseBody
    public KesunReturn submitApplication(@RequestBody Map<String,Object> map, HttpServletResponse response, HttpServletRequest request){
        HttpSession  session = request.getSession();
        map.put("submitid",session.getAttribute("id"));
        map.put("submittime",new Date());
        map.put("id",Tool.CreateID());
        map.put("status","已提交");
        for(String s:map.keySet()){
            System.out.println("submitApplication "+s+" ="+map.get(s));
        }
        KesunReturn back = new KesunReturn();
        if(bll.submitApplication(map)>0){
            back.setCode("0002");
            back.setMessage("申请提交成功");
        }
        else{
            back.setCode("0001");
            back.setMessage("申请提交失败");
            back.setObj(null);
        }
        return back;
    }
    @RequestMapping("/applicationSubmitFind")
    @ResponseBody
    public KesunReturn applicationSubmitFind(@RequestBody Map<String,Object> map, HttpServletResponse response, HttpServletRequest request){
        HttpSession session = request.getSession();
        map.put("submitid",session.getAttribute("id"));
        Object object = bll.applicationSubmitFind(map);
        KesunReturn back = new KesunReturn();
        if(object!=null){
            back.setCode("0002");
            back.setCode("成功");
            back.setObj(object);
        }
        else{
            back.setCode("0001");
            back.setMessage("数据查询失败");
        }
        return back;
    }
    @Override
    public KesunSuperService getService() {
        return bll;
    }
}

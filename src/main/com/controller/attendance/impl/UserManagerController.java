package controller.attendance.impl;

import bll.KesunSuperService;
import bll.attendance.IUserManagerService;
import bll.attendance.impl.UserManagerServiceImpl;
import com.alibaba.fastjson.JSON;
import controller.KesunBusinessController;
import controller.attendance.IUserManagerController;
import dao.attendance.IUserManagerDao;
import entity.User;
import kesun.entity.AbsSuperObject;
import kesun.entity.KesunReturn;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import util.Tool;

import javax.annotation.Resource;
import java.util.Map;

@Controller
@RequestMapping("UserManager")

public class UserManagerController extends KesunBusinessController implements IUserManagerController {
    @Resource(name="1")
    private UserManagerServiceImpl bll;

    @Autowired
    private IUserManagerDao dao;

    @Autowired
    private IUserManagerService iUserService;
    @RequestMapping("/now")
    public String show(){
        return "/attendance/index";
    }

    @RequestMapping("/insert")
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
    @RequestMapping("/deletebyid")
    @ResponseBody
    public String deletebyid(String id){
        iUserService.d(id);
        return "OK";
    }
    @RequestMapping("/updatebyid")
    @ResponseBody
    public KesunReturn updatebyid(@RequestBody Map<String,Object> map) {
        AbsSuperObject model = JSON.parseObject(JSON.toJSONString(map),getService().getModel().getClass());
        KesunReturn back = new KesunReturn();
        if(iUserService.u(model)>0){
            back.setMessage("员工信息更新成功！");
        }
        else{
            back.setMessage("员工信息更新失败！");
        }
        return back;
    }
    @RequestMapping("/sssid")
    @ResponseBody
    public KesunReturn sssid(@RequestBody Map<String,Object> map){
        System.out.println("id= "+map.get("id"));
        User user = iUserService.si(map.get("id")+"");
        KesunReturn back = new KesunReturn();
        if(user!=null){
            back.setCode("0002");
            back.setMessage("成功");
            back.setObj(user);
        }
        else {
            back.setCode("0001");
            back.setMessage("错误");
            back.setObj(null);
        }
        return back;
    }
    @Override
    public KesunSuperService getService() {
        return bll;
    }
}


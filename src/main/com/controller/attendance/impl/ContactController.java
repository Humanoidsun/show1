package controller.attendance.impl;

import bll.KesunSuperService;
import bll.attendance.impl.ContactServiceImpl;
import com.alibaba.fastjson.JSON;
import controller.KesunBusinessController;
import controller.attendance.IContact;
import kesun.entity.AbsSuperObject;
import kesun.entity.KesunReturn;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import util.Tool;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;

/**
 * @Author: 刘轩宇
 * @Date: 2019/6/20 14:56
 * @Version 3.2
 */
@Controller
@RequestMapping("Contact")
public class ContactController extends KesunBusinessController implements IContact {
    @Resource(name = "bContact")
    private ContactServiceImpl bll;

    @RequestMapping("index")
    public String index(){
        return "attendance/contact";
    }

    @RequestMapping("insert")
    @ResponseBody
    public KesunReturn insert(@RequestBody Map<String,Object> map,HttpServletRequest request, HttpServletResponse response){
        map.put("userid",request.getSession().getAttribute("id"));
        AbsSuperObject model = JSON.parseObject(JSON.toJSONString(map),getService().getModel().getClass());
        KesunReturn back = new KesunReturn();
        if(model == null){
            back.setCode("0001");
            back.setMessage("抱歉，系统没有获取到需要数据！");
            back.setObj(null);
        }
        else
        {
            model.setId(Tool.CreateID());
            getService().setModel(model);
        }
        back = getService().add();
        return back;
    }

    @RequestMapping("editcon")
    @ResponseBody
    public KesunReturn editcon(@RequestBody Map<String,Object> map){
        KesunReturn back = new KesunReturn();
        AbsSuperObject model = JSON.parseObject(JSON.toJSONString(map),getService().getModel().getClass());
        if(bll.editcon(map)>0){
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
        AbsSuperObject model = JSON.parseObject(JSON.toJSONString(map),getService().getModel().getClass());
        getService().setModel(model);
        return bll.del();
    }

    @RequestMapping("findcon")
    @ResponseBody
    public KesunReturn findcon(@RequestBody Map<String,Object> map, HttpServletRequest request, HttpServletResponse response){
        map.put("userid",request.getSession().getAttribute("id"));
        return bll.findcon(map);
    }

    @RequestMapping("findbyId")
    @ResponseBody
    public KesunReturn findbyId(@RequestBody Map<String,Object> map) {
        AbsSuperObject model = JSON.parseObject(JSON.toJSONString(map),getService().getModel().getClass());
        return bll.findbyId(model.getId());
    }

    @Override
    public KesunSuperService getService() {
        return bll;
    }
}
package controller.attendance.impl;

import bll.KesunSuperService;
import bll.attendance.impl.WorkscheduleServiceImpl;
import com.alibaba.fastjson.JSON;
import controller.KesunBusinessController;
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

@Controller
@RequestMapping("/Workschedule")
public class WorkscheduleController extends KesunBusinessController {

    @Resource(name = "bWorkschedule")
    private WorkscheduleServiceImpl bll;
    @Override
    public KesunSuperService getService() {
        return bll;
    }
    @RequestMapping("/findByCondition")
    @ResponseBody
    public KesunReturn findByCondition(@RequestBody Map<String,Object> map, HttpServletResponse response, HttpServletRequest request){
        KesunReturn back =new KesunReturn();
        Object obj = bll.findByCondition(map);
        if(obj!=null){
            back.setCode("0002");
            back.setMessage("成功");
            back.setObj(obj);
        }
        else{
            back.setCode("0001");
            back.setMessage("失败");
            back.setObj(null);
        }
        return back;
    }

    @RequestMapping("/findById")
    @ResponseBody
    public KesunReturn findById(@RequestBody Map<String,Object> map, HttpServletResponse response, HttpServletRequest request){
        AbsSuperObject model = JSON.parseObject(JSON.toJSONString(map),getService().getModel().getClass());
        KesunReturn back =new KesunReturn();
        if (model==null){
            back.setMessage("数据获取失败");
            back.setCode("0003");
            return back;
        }
        getService().setModel(model);
        Object obj = getService().getMe();
        if(obj!=null){
            back.setCode("0002");
            back.setMessage("成功");
            back.setObj(obj);
        }
        else{
            back.setCode("0001");
            back.setMessage("失败");
            back.setObj(null);
        }
        return back;
    }
    @RequestMapping("/delete")
    @ResponseBody
    public KesunReturn delete(@RequestBody Map<String,Object> map, HttpServletResponse response, HttpServletRequest request){
        AbsSuperObject model = JSON.parseObject(JSON.toJSONString(map),getService().getModel().getClass());
        KesunReturn back =new KesunReturn();

        if(model!=null){
            getService().setModel(model);
            return getService().del();
        }
        else {
            back.setCode("0003");
            back.setMessage("数据获取失败");
            return back;
        }

    }
    @RequestMapping("/insert")
    @ResponseBody
    public KesunReturn insert(@RequestBody Map<String,Object> map, HttpServletResponse response, HttpServletRequest request){
        AbsSuperObject model = JSON.parseObject(JSON.toJSONString(map),getService().getModel().getClass());
        KesunReturn back =new KesunReturn();
        if(model!=null){
            model.setId(Tool.CreateID());
            getService().setModel(model);
            return getService().add();
        }
        else {
            back.setCode("0003");
            back.setMessage("数据获取失败");
            return back;
        }
    }
    @RequestMapping("/update")
    @ResponseBody
    public KesunReturn update(@RequestBody Map<String,Object> map, HttpServletResponse response, HttpServletRequest request){
        AbsSuperObject model = JSON.parseObject(JSON.toJSONString(map),getService().getModel().getClass());
        KesunReturn back =new KesunReturn();
        if(model!=null){
            getService().setModel(model);
            return getService().edit();
        }
        else {
            back.setCode("0003");
            back.setMessage("数据获取失败");
            return back;
        }
    }
}

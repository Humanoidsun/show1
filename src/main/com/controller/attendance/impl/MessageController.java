package controller.attendance.impl;

import bll.KesunSuperService;
import bll.attendance.IMessageService;
import bll.attendance.impl.MessageServiceImpl;
import com.alibaba.fastjson.JSON;
import controller.KesunBusinessController;
import controller.attendance.IMessageController;
import entity.Message;
import kesun.entity.AbsSuperObject;
import kesun.entity.KesunReturn;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import util.Tool;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.Map;

@Controller
@RequestMapping("Message")
public class MessageController extends KesunBusinessController implements IMessageController {

    @Resource(name = "aMessage")
    private MessageServiceImpl bll;

    @Autowired
    private IMessageService iMessageService;

    @RequestMapping("index")
    public String show(){
        return "/attendance/uc-chat";
    }

    @RequestMapping("/insert")
    @ResponseBody
    public Object insert(@RequestBody Map<String,Object> map,HttpServletRequest request,HttpServletResponse response){
        map.put("sendid",request.getSession().getAttribute("id"));
        map.put("type","对话");
        map.put("datetime",new Date());
        KesunReturn back = new KesunReturn();//返回操作
        AbsSuperObject model = JSON.parseObject(JSON.toJSONString(map),getService().getModel().getClass());
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
        System.out.println(back.getMessage());
        return back;
    }

    @RequestMapping("/getByid")
    @ResponseBody
    public KesunReturn sid(@RequestBody Map<String,Object> map){
        System.out.println("id= "+map.get("id"));
        Message message = iMessageService.selectbyid(map.get("id")+"");
        KesunReturn back = new KesunReturn();
        if(message!=null){
            back.setCode("0002");
            back.setMessage("成功");
            back.setObj(message);
        }
        else {
            back.setCode("0001");
            back.setMessage("错误");
            back.setObj(null);
        }
        return back;
    }

    @RequestMapping("/deletebyid")
    @ResponseBody
    public String deleteuser(String id){
        iMessageService.Delete(id);
        return "OK";
    }

    @RequestMapping("/updatebyid")
    @ResponseBody
    public KesunReturn updateuser(@RequestBody Map<String,Object> map, HttpServletResponse response, HttpServletRequest request) {
        Message message = JSON.parseObject(JSON.toJSONString(map),new Message().getClass());
        KesunReturn back = new KesunReturn();
        if(iMessageService.Update(message)>0){
            back.setMessage("修改成功");
            back.setCode("0002");
        }
        else{
            back.setCode("0001");
            back.setMessage("修改失败");
        }
        return back;
    }
    @RequestMapping("/findByCondition")
    @ResponseBody
    public KesunReturn findByCondition(@RequestBody Map<String,Object> map, HttpServletRequest request, HttpServletResponse response){
        map.put("id",request.getSession().getAttribute("id"));
        KesunReturn back = new KesunReturn();
        Object obj = bll.findByCondition(map);
        if(obj!=null){
            back.setCode("0002");
            back.setMessage("成功");
            back.setObj(obj);
        }
        else{
            back.setCode("0001");
            back.setMessage("失败");
        }
        return back;
    }
    @Override
    public KesunSuperService getService() {
        return bll;
    }
}

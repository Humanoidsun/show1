package controller.attendance.impl;

import bll.KesunSuperService;
import bll.attendance.impl.SettingServiceImpl;
import com.alibaba.fastjson.JSON;
import controller.KesunBusinessController;
import entity.Setting;
import kesun.entity.AbsSuperObject;
import kesun.entity.KesunReturn;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
@RequestMapping("/Setting")
public class SettingController extends KesunBusinessController {
    @Resource(name = "bSetting")
    private SettingServiceImpl bll;
    @Override
    public KesunSuperService getService() {
        return bll;
    }
    @RequestMapping("/update")
    @ResponseBody
    public KesunReturn update(@RequestBody Map<String,Object> map, HttpServletResponse response, HttpServletRequest request){
        KesunReturn back =new KesunReturn();
        HttpSession session = request.getSession();
        String id = (String)session.getAttribute("id");
        map.put("userid",id);
        AbsSuperObject model = JSON.parseObject(JSON.toJSONString(map),getService().getModel().getClass());
        getService().setModel(model);
        return  getService().edit();
    }
    @RequestMapping("/selectByUserId")
    @ResponseBody
    public KesunReturn selectByUserId(@RequestBody Map<String,Object> map,HttpServletResponse response, HttpServletRequest request){
        KesunReturn back =new KesunReturn();
        HttpSession session = request.getSession();
        String userid = (String)session.getAttribute("id");
        Object object =bll.selectByUserId(userid);
        if(object!=null){
            back.setCode("0002");
            back.setMessage("数据请求成功");
            back.setObj(object);
        }
        else{
            back.setObj("0001");
            back.setMessage("数据请求失败");
        }
        return back;
    }
}

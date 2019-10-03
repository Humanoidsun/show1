package controller.attendance.impl;

import bll.KesunSuperService;
import bll.attendance.impl.CheckinruleServiceImpl;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import controller.KesunBusinessController;
import controller.attendance.ICheckinruleController;
import dao.IDoData;
import entity.Checkinrule;
import kesun.entity.AbsSuperObject;
import kesun.entity.KesunReturn;
import kesun.entity.system.User;
import org.apache.poi.ss.usermodel.Row;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("Checkinrule")
public class CheckinruleController extends KesunBusinessController implements ICheckinruleController {

    @Resource(name="UCheckinrule")
    private CheckinruleServiceImpl bll;

    @Override
    public KesunSuperService getService() {
        return bll;
    }

    @RequestMapping("findCheckinrule")
    @ResponseBody
    public KesunReturn findCheckinrule(){
        KesunReturn result = new KesunReturn();
        result= bll.findCheckinrule();
        return result;
    }

    @RequestMapping("updateCheckinrule")
    @ResponseBody
    public KesunReturn updateCheckinrule(@RequestBody Map<String,Object> map){
//        AbsSuperObject model = JSON.parseObject(JSON.toJSONString(back),getService().getModel().getClass());
//        getService().setModel(model);
        map.put("id","001");
        for(String str:map.keySet()){
            System.out.println(str+" "+map.get(str));
        }
        KesunReturn result = bll.updateCheckinrule(map);
        return result;
    }
}

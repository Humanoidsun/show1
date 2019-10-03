package controller.attendance.impl;

import bll.KesunSuperService;
import bll.attendance.impl.RecordServiceImpl;
import com.alibaba.fastjson.JSON;
import controller.KesunBusinessController;
import entity.Record;
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
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/Record")
public class RecordController extends KesunBusinessController {

    @Resource(name = "bRecord")
    private RecordServiceImpl bll;
    @Override
    public KesunSuperService getService() {
        return bll;
    }
    @RequestMapping("/save")
    @ResponseBody
    public KesunReturn save(@RequestBody Map<String,Object> map, HttpServletResponse response, HttpServletRequest request){
        KesunReturn back =new KesunReturn();
        HttpSession session = request.getSession();
        String id = (String)session.getAttribute("id");
        if(id==null){
            back.setCode("0001");
            back.setMessage("打卡失败，请重试！");
            back.setObj(null);
            return back;
        }
        else {
            return bll.add(id);
        }
    }
    @RequestMapping("findByTime")
    @ResponseBody
    public KesunReturn find(@RequestBody Map<String,Object> map, HttpServletResponse response, HttpServletRequest request){
        for(String str:map.keySet()){
            System.out.println(str+" "+map.get(str));
        }
        KesunReturn back =new KesunReturn();
        HttpSession session = request.getSession();
        String id = (String)session.getAttribute("id");
        map.put("userid",id);
        if(map!=null){
            List<Record> list = bll.findByTime(map);
            if(list==null){
                back.setCode("0001");
                back.setMessage("数据查询失败");
                back.setObj(null);
            }
            else{
                back.setCode("0002");
                back.setMessage("数据请求成功");
                back.setObj(list);
            }
        }
        else{
            back.setCode("0003");
            back.setMessage("请求数据获取失败");
            back.setObj(null);
        }
        return back;
    }
}

package controller.attendance.impl;

import bll.KesunSuperService;
import bll.attendance.impl.InfoServiceImpl;
import com.alibaba.fastjson.JSON;
import controller.KesunBusinessController;
import controller.attendance.IInfoController;
import entity.Record;
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
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("Info")
public class InfoController extends KesunBusinessController implements IInfoController {

    @Resource(name="UInfo")
    private InfoServiceImpl bll;

    @Override
    public KesunSuperService getService() {
        return bll;
    }

    @RequestMapping("findInfo")
    @ResponseBody
    public KesunReturn findInfo(){
        KesunReturn result = new KesunReturn();
        result=bll.findInfo();
        return result;
    }

    @RequestMapping("findUserById")
    @ResponseBody
    public KesunReturn findUserById(@RequestBody Map<String,Object> map){
        System.out.println();
        KesunReturn result = new KesunReturn();
        System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
        result=bll.findUserById(map);
        return result;
    }

    @RequestMapping("findUserForForm")
    @ResponseBody
    public KesunReturn findUserForForm(@RequestBody Map<String,Object> map){
        return bll.findUserForForm(map);
    }

    @RequestMapping("insertInfo")
    @ResponseBody
    public KesunReturn insertAuthority(@RequestBody Map<String,Object> map){
        map.put("id", Tool.CreateID());
        KesunReturn result = bll.insertInfo(map);
        return result;
    }

    @RequestMapping("updateInfo")
    @ResponseBody
    public KesunReturn updateAuthority(@RequestBody Map<String,Object> map){
        KesunReturn result =bll.updateInfo(map);
        return result;
    }

    @RequestMapping("deleteInfo")
    @ResponseBody
    public KesunReturn deleteAuthority(@RequestBody Map<String,Object> map){
        AbsSuperObject model = JSON.parseObject(JSON.toJSONString(map),getService().getModel().getClass());
        KesunReturn result = new KesunReturn();
        getService().setModel(model);
        result=bll.del();
        return result;
    }

    @RequestMapping("findDepartmentForForm")
    @ResponseBody
    public KesunReturn findDepartmentForForm(@RequestBody Map<String,Object> map){
        return bll.findDepartmentForForm(map);
    }

    @RequestMapping("getUserData")
    @ResponseBody
    public KesunReturn getUserData(@RequestBody Map<String,Object> map){
        return bll.getUserData(map);
    }

    @RequestMapping("getDepartmentData")
    @ResponseBody
    public KesunReturn getInfoData(@RequestBody Map<String,Object> map){
        return bll.getDepartmentData(map);
    }

}

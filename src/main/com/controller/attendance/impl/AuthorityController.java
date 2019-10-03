package controller.attendance.impl;

import bll.KesunSuperService;
import bll.attendance.impl.AuthorityServiceImpl;
import com.alibaba.fastjson.JSON;
import controller.KesunBusinessController;
import controller.KesunBusinessTreeNodeController;
import controller.attendance.IAuthorityController;
import kesun.entity.AbsSuperObject;
import kesun.entity.KesunReturn;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import util.Tool;

import javax.annotation.Resource;
import java.util.Map;


@Controller
@RequestMapping("Authority")
public class AuthorityController extends KesunBusinessController implements IAuthorityController {

    @Resource(name="UAuthority")
    private AuthorityServiceImpl bll;

    @Override
    public KesunSuperService getService() {
        return bll;
    }

    @RequestMapping("findAuthority")
    @ResponseBody
    public KesunReturn findAuthority(@RequestBody Map<String,Object> map){
        System.out.println("findAuthority"+map.get("username"));
        return bll.findAuthority(map);
    }

    @RequestMapping("findAuthorityById")
    @ResponseBody
    public KesunReturn findAuthorityById(@RequestBody Map<String,Object> map){
        AbsSuperObject model = JSON.parseObject(JSON.toJSONString(map),getService().getModel().getClass());
        getService().setModel(model);
        return bll.findAuthorityById(model);

    }

    @RequestMapping("insertAuthority")
    @ResponseBody
    public KesunReturn insertAuthority(@RequestBody Map<String,Object> map){
        map.put("id", Tool.CreateID());
        AbsSuperObject model = JSON.parseObject(JSON.toJSONString(map),getService().getModel().getClass());

        getService().setModel(model);
        return bll.add();
    }

    @RequestMapping("updateAuthority")
    @ResponseBody
    public KesunReturn updateAuthority(@RequestBody Map<String,Object> map){
        AbsSuperObject model = JSON.parseObject(JSON.toJSONString(map),getService().getModel().getClass());
        KesunReturn result = new KesunReturn();
        getService().setModel(model);
        result=bll.edit();
        return result;
    }

    @RequestMapping("deleteAuthority")
    @ResponseBody
    public KesunReturn deleteAuthority(@RequestBody Map<String,Object> map){
        AbsSuperObject model = JSON.parseObject(JSON.toJSONString(map),getService().getModel().getClass());
        KesunReturn result = new KesunReturn();
        getService().setModel(model);
        result=bll.del();
        return result;
    }

}

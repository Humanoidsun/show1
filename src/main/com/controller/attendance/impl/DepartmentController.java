package controller.attendance.impl;

import bll.KesunSuperService;
import bll.attendance.IDepartmentService;
import bll.attendance.impl.DepartmentServiceImpl;
import com.alibaba.fastjson.JSON;
import controller.KesunBusinessController;
import controller.attendance.IDepartmentController;
import entity.Department;
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
@RequestMapping("DepartmentManage")
public class DepartmentController extends KesunBusinessController implements IDepartmentController {
    @Resource(name = "adepertment")
    private DepartmentServiceImpl bll;

    @Autowired
    private IDepartmentService iDepartmentService;

    @RequestMapping("index")
    public String show(){
        return "attendance/calendar";
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
    @RequestMapping("/getByid")
    @ResponseBody
    public KesunReturn sid(@RequestBody Map<String,Object> map){
        System.out.println("id= "+map.get("id"));
        Department department = iDepartmentService.selectbyid(map.get("id")+"");
        KesunReturn back = new KesunReturn();
        if(department!=null){
            back.setCode("0002");
            back.setMessage("成功");
            back.setObj(department);
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
        iDepartmentService.Delete(id);
        return "OK";
    }

    @RequestMapping("/updatebyid")
    @ResponseBody
    public String updateuser(Department department) {
        iDepartmentService.Update(department);
        return "OK";
    }
    @Override
    public KesunSuperService getService() {
        return bll;
    }
}

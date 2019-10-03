package controller.attendance.impl;

import bll.KesunSuperService;
import bll.attendance.impl.CompanyServiceImpl;
import com.alibaba.fastjson.JSON;
import controller.KesunBusinessController;
import controller.attendance.ICompanyController;
import entity.Company;
import kesun.entity.AbsSuperObject;
import kesun.entity.KesunReturn;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.Map;

@Controller
@RequestMapping("Company")
public class CompanyController extends KesunBusinessController implements ICompanyController {

    @Resource(name="UCompany")
    private CompanyServiceImpl bll;

    @Override
    public KesunSuperService getService() {
        return bll;
    }

    @RequestMapping("findCompany")
    @ResponseBody
    public KesunReturn findCompany(){
        KesunReturn result = new KesunReturn();
        result=bll.findCompany();
        return result;
    }

    @RequestMapping("updateCompany")
    @ResponseBody
    public KesunReturn updateCompany(@RequestBody Map<String,Object> map){
        System.out.println("23333333333333");
        AbsSuperObject model = JSON.parseObject(JSON.toJSONString(map),getService().getModel().getClass());
        model.setId("001");
        KesunReturn result = new KesunReturn();
        getService().setModel(model);
        result=bll.edit();
        return result;
    }

}

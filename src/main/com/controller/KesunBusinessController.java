package controller;

import com.alibaba.fastjson.JSON;
import kesun.entity.AbsBusinessObject;
import kesun.entity.AbsSuperObject;
import kesun.entity.system.User;
import util.JSONAndObject;
import util.Tool;

import java.util.HashMap;
import java.util.Map;

/**
 * 业务数据超级控制层类
 * Created by wph-pc on 2017/9/8.
 */
public abstract class KesunBusinessController extends KesunTopController {
    /*获取客户端参数初始化*/
    public AbsSuperObject initParameter(Map<String,Object> p)
     {
//         for(String key:p.keySet()){
//             System.out.println(key+" "+p.get(key));
//         }
         AbsBusinessObject model= JSONAndObject.MapToJavaBean(p,((AbsBusinessObject)getService().getModel()).getClass()); //获取页面对象

         if (model.getId().trim().equals(""))
             model.setId(Tool.CreateID());
         /*此处写入用户操作信息，组织结构信息、角色信息*/
         User temp= this.GetCurrentUser();
         if(temp==null) return null;
         model.setActor(temp.getActors()==null?null:temp.getActors().get(0));//设置用户角色
         model.setOrg(temp.getOrg()==null?null:temp.getOrg());
         model.setUser(temp);

         getService().setModel(model);//设置操作实体对象
         return model;
     }

    /*数据过滤方法*/
    public Map<String, Object> setFindFilter(Map<String, Object> param) {
        Map<String, Object> values = new HashMap<String, Object>();
         /*此处写入用户操作信息，组织结构信息、角色信息*/
        User temp= GetCurrentUser();
        if (temp==null) return null;
        if (temp.getOrg() != null)
            values.put("org", temp.getOrg().getId());
        else
            param.put("org", "");
        return values;
    }

}

package controller;

import kesun.entity.AbsBusinessObject;
import kesun.entity.AbsBusinessTreeNode;
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
public abstract class KesunBusinessTreeNodeController extends KesunTopController {

    /*获取客户端参数初始化*/
    public AbsSuperObject initParameter(Map<String,Object> p)
     {
         AbsBusinessTreeNode model= JSONAndObject.MapToJavaBean(p,((AbsBusinessTreeNode)getService().getModel()).getClass()); //获取页面对象

         if (model.getId().trim().equals(""))
             model.setId(Tool.CreateID());
         /*此处写入用户操作信息，组织结构信息、角色信息*/
         User temp= GetCurrentUser();
         if (temp==null) return null;
         model.setActor(temp.getActors()==null?null:temp.getActors().get(0));//设置用户角色
         model.setOrg(temp.getOrg()==null?null:temp.getOrg());
         model.setUser(temp);

         getService().setModel(model);//设置操作实体对象
         return model;
     }
    @Override
    public Map<String, Object> getConditionParam(Map<String, Object> param) {
        if (param == null) return null;//判断条件是否为空param是页面传递的值
        Map<String, Object> values = new HashMap<String, Object>();
        if (param.get("name") != null)
            values.put("name", param.get("name"));
        if (param.get("org") != null)
            values.put("org", param.get("org"));
        return values;
    }
}

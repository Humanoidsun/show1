package controller;

import kesun.entity.AbsSuperObject;
import util.JSONAndObject;
import util.Tool;

import java.util.Map;

/**
 * 超级控制层类
 * Created by wph-pc on 2017/9/8.
 */
public abstract class KesunSuperController extends KesunTopController {

    /*获取客户端参数初始化*/
    public AbsSuperObject initParameter(Map<String,Object> p)
     {
         AbsSuperObject model= JSONAndObject.MapToJavaBean(p,getService().getModel().getClass()); //获取页面对象

         if (model.getId().trim().equals(""))
             model.setId(Tool.CreateID());
         getService().setModel(model);//设置操作实体对象
         return model;
     }
}

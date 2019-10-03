package controller;

import bll.KesunSuperService;
import kesun.entity.AbsSuperObject;
import kesun.entity.KesunReturn;
import kesun.entity.Page;
import kesun.entity.SearchViewParam;
import kesun.entity.system.User;
import org.springframework.beans.factory.annotation.Autowired;
import util.Tool;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.web.bind.annotation.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * 超级控制层类
 * Created by wph-pc on 2017/9/8.
 */
public abstract class KesunTopController {

    @Autowired
    private  HttpServletRequest request;

    public abstract KesunSuperService getService();//获取服务层对象

    public Map<String, Object> getConditionParam(Map<String, Object> param){
        return param;
    }

    //设置查询过滤条件，一般用户数据授权操作，可以为空
    public Map<String, Object> setFindFilter(Map<String, Object> param){
       return param;
    }

    /*设置权限过滤条件,使用时，建议重写*/
    public boolean[] setPowerFilter() {
        return null;
    }

    /*获取客户端参数初始化*/
    public abstract AbsSuperObject initParameter(Map<String, Object> param);


    /*更新参数model实体信息,可以由子类重写*/
    public AbsSuperObject updateModel(AbsSuperObject model) {
        return model;
    }

    private KesunReturn checkServiceObject(KesunSuperService bll)
    {
        KesunReturn back=new KesunReturn();//定义返回对象
        if (bll == null)
        {
            back.setCode("0");
            back.setMessage("无法查询，请联系开发方，业务层实例化失败！");
            back.setObj(null);
            return back;
        }
//        if (GetCurrentUser()==null)
//        {
//            back.setCode("00");
//            back.setMessage("用户身份过期，请重新登录！");
//            back.setObj(null);
//            return back;
//        }
        return null;
    }
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    public Object add(@RequestBody(required = true) Map<String, Object> p) {
        KesunReturn back = new KesunReturn();//返回操作
        AbsSuperObject temp = initParameter(p);
        if (temp == null) {
            back.setCode("0");
            back.setMessage("抱歉，系统没有获取到需要数据！");
            back.setObj(null);
            return back;
        }
        AbsSuperObject model = updateModel(temp);//获取客户端参数信息
        if (model == null) {
            back.setCode("0");
            back.setMessage("抱歉，您提供的数据存在问题，系统在转换成目标数据时失败！");
            back.setObj(null);
            return back;
        }

        back=checkServiceObject(getService());
        if (back!=null) return back;
        back=new KesunReturn();

        getService().setModel(model);
        if (getService().isAdd() == false) {
            back.setCode("0");
            back.setMessage("抱歉，系统设置不能新增【" + model.getName() + "】的操作,数据是否重复，请核实！");
            back.setObj(null);
            return back;
        }
        return getService().add();
    }

    @RequestMapping(value = "/batchSave", method = RequestMethod.POST)
    @ResponseBody
    public Object batchSave(@RequestBody(required = true) List<Map<String,Object>> items) {
        if (items!=null && items.size()>0)
        {
            List lTemp=new ArrayList();
            for(Map<String,Object> obj:items)
            {
               AbsSuperObject temp=initParameter(obj);
               if (temp.getId()==null || temp.getId().equals(""))
                   temp.setId(Tool.CreateID());
               lTemp.add(temp);
            }
            return getService().batchAdd(lTemp);
        }
        KesunReturn back=new KesunReturn();
        back.setCode("0");
        back.setMessage("抱歉，您提供的数据为空，无法进行数据批量操作！");
        back.setObj(0);
        return back;
    }
    /*根据上传后的Excel数据进行批量新增*/
    @RequestMapping(value = "/loadData", produces = "application/json;charset=UTF-8", method = RequestMethod.POST)
    @ResponseBody
    public Object loadData(HttpServletRequest request, @RequestBody String fileName) {
        String path = request.getSession().getServletContext().getRealPath("/uploadfiles") + "/" + fileName.replace("\"", "");
        KesunReturn back = new KesunReturn();//返回操作
        User worker = GetCurrentUser();//获取当前操作用户信息
        if (worker == null) {
            back.setCode("0");
            back.setMessage("抱歉，当前用户身份过期，无法继续操作，需要重新登录！");
            back.setObj(null);
            return back;
        }

        back=checkServiceObject(getService());
        if (back!=null) return back;

        return getService().loadinData(path, GetCurrentUser());

    }

    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    @ResponseBody
    public Object edit(@RequestBody(required = true) Map<String, Object> p) {
        KesunReturn back = new KesunReturn();//返回操作
        AbsSuperObject temp = initParameter(p);
        if (temp == null) {
            back.setCode("0");
            back.setMessage("抱歉，系统没有获取到的修改数据！");
            back.setObj(null);
            return back;
        }
        AbsSuperObject model = updateModel(temp);//获取客户端参数信息
        if (model == null) {
            back.setCode("0");
            back.setMessage("抱歉，您提供的数据存在问题，系统在转换成目标数据时失败，无法继续完成修改操作！");
            back.setObj(null);
            return back;
        }

        back=checkServiceObject(getService());
        if (back!=null) return back;
        back=new KesunReturn();

        getService().setModel(model);
        if (getService().isEdit() == false) {
            back.setCode("0");
            back.setMessage("抱歉，系统设置要求取消了【" + model.getName() + "】修改操作,数据是否重复，请核实！");
            back.setObj(null);
            return back;
        }
       return getService().edit();
    }
    @RequestMapping(value = "/changeStatus", method = RequestMethod.POST)
    @ResponseBody
    public Object changeStatus(@RequestBody(required = true) Map<String, Object> p) {
        KesunReturn back = new KesunReturn();//返回操作
        AbsSuperObject temp = initParameter(p);
        if (temp == null) {
            back.setCode("0");
            back.setMessage("抱歉，系统没有获取到修改状态的数据！");
            back.setObj(null);
            return back;
        }
        AbsSuperObject model = updateModel(temp);//获取客户端参数信息
        if (model == null) {
            back.setCode("0");
            back.setMessage("抱歉，您提供数据存在问题，系统在转换成目标数据时失败！");
            back.setObj(null);
            return back;
        }

        back=checkServiceObject(getService());
        if (back!=null) return back;
        getService().setModel(model);
        return getService().changeStatus();

    }
    @RequestMapping(value = "/del", method = RequestMethod.POST)
    @ResponseBody
    public Object del(@RequestBody(required = true) Map<String, Object> p) {
        KesunReturn back = new KesunReturn();//返回操作
        AbsSuperObject temp = initParameter(p);
        if (temp == null) {
            back.setCode("0");
            back.setMessage("抱歉，系统没有获取到的删除数据！");
            back.setObj(null);
            return back;
        }
        AbsSuperObject model = updateModel(temp);//获取客户端参数信息
        if (model == null) {
            back.setCode("0");
            back.setMessage("抱歉，您提供的数据存在问题，系统在转换成目标数据时失败，无法继续完成删除操作！");
            back.setObj(null);
            return back;
        }

        back=checkServiceObject(getService());
        if (back!=null) return back;
        back=new KesunReturn();

        getService().setModel(model);

        if (getService().isDelete() == false)
        {
            back.setCode("0");
            back.setMessage("抱歉，系统设置要求取消了【" + model.getName() + "】删除操作！");
            back.setObj(null);
            return back;
        }
        if (getService().isInUse())
        {
            back.setCode("0");
            back.setMessage("抱歉，您指定删除【" + model.getName() + "】数据在应用中，不能删除！");
            back.setObj(null);
            return back;
        }
        return getService().del();
    }

    @RequestMapping(value = "/deleteAll", method = RequestMethod.POST)
    @ResponseBody
    public Object deleteAll(@RequestBody(required = true) Map<String, Object> p) {
        String ids = p.get("ids").toString();//解析参数
        List<String> cons = new ArrayList<String>();
        String[] arrays = ids.split(",");
        for (String id : arrays) {
            if (!id.trim().equals(""))
                cons.add(id);
        }
        KesunReturn back = new KesunReturn();//返回操作
        if (cons.size() == 0) {
            back.setCode("0");
            back.setMessage("抱歉，系统没有获得有效的删除数据参数，请核实！");
            back.setObj(null);
            return back;
        }

        back=checkServiceObject(getService());
        if (back!=null) return back;
        return getService().deleteAll(cons);

    }

    private KesunReturn checkFindCondition(KesunSuperService bll,Map<String, Object> values)
    {
        KesunReturn back=checkServiceObject(bll);
        if (back!=null) return back;
        if (values == null || values.size() == 0)
        {
            back=new KesunReturn();//定义返回对象
            back.setCode("0");
            back.setMessage("您没有设置查询条件！");
            back.setObj(null);
            return back;
        }
        return null;
    }
    @RequestMapping(value = "/find", method = RequestMethod.POST)
    @ResponseBody
    public Object find(@RequestBody(required = true) Map<String, Object> p) {
        Map<String, Object> values = getConditionParam(p);//获取查询参数
        /*合并数据过滤条件*/
        if (setFindFilter(p) != null)
            values.putAll(setFindFilter(p));

        KesunSuperService bll = getService();//获取业务对象

        KesunReturn back=checkFindCondition(bll,values);//定义返回对象
        if (back!=null) return back;//存在不符合条件
        return getService().find(values);//查询
    }

    @RequestMapping(value = "/findForRow", method = RequestMethod.POST)
    @ResponseBody
    public Object findForRow(@RequestBody(required = true) Map<String, Object> p) {

        Map<String, Object> values = getConditionParam(p);;//获取查询参数
        /*合并数据过滤条件*/
        if (setFindFilter(p) != null)
            values.putAll(setFindFilter(p));

        KesunSuperService bll = getService();//获取业务对象
        KesunReturn back=checkFindCondition(bll,values);//定义返回对象
        if (back!=null) return back;//存在不符合条件
        return getService().findForMap(values); //查询
    }

    @RequestMapping(value = "/fastFind", method = RequestMethod.POST)
    @ResponseBody
    public Object fastFind(@RequestBody(required = true) Map<String, Object> p) {

        Map<String, Object> values = getConditionParam(p);;//获取查询参数
        /*合并数据过滤条件*/
        if (setFindFilter(p) != null)
            values.putAll(setFindFilter(p));

        KesunSuperService bll = getService();//获取业务对象
        KesunReturn back=checkFindCondition(bll,values);//定义返回对象
        if (back!=null) return back;//存在不符合条件
        return getService().fastFind(values); //查询
    }
    /*分页查找*/
    @RequestMapping(value = "/findByPage", method = RequestMethod.POST)
    @ResponseBody
    public Object findByPage(@RequestBody(required = true) Map<String, Object> p) {
        Map<String, Object> values =getConditionParam(p);//获取查询参数
         /*合并数据过滤条件*/
        if (setFindFilter(p) != null)
            values.putAll(setFindFilter(p));

        KesunSuperService bll = getService();//获取业务对象

        SearchViewParam pp = ControlTool.GetViewParam(p);//获取查询参数

        ReturnBeanInPower rbi = new ReturnBeanInPower();
        rbi.setHasPower(setPowerFilter());

        KesunReturn back=checkFindCondition(bll,values);
        if (back!=null) return back;
        return getService().findByPage(values, pp.pageNumber, pp.rowsCount);
    }

    /*导出操作*/
    @RequestMapping(value = "/loadout", method = RequestMethod.POST)
    public void loadoutData(HttpServletRequest request, HttpServletResponse response, @RequestParam Map<String, Object> p) {

        try {
            request.setCharacterEncoding("utf-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

        Map<String, Object> values = getConditionParam(p);//获取查询参数
        KesunSuperService bll = getService();//获取业务对象

        response.setContentType("application/vnd.ms-excel;charset=UTF-8");
        String fileName = getService().getLoadoutExcelFileName();//获取导出文件名称
        try {
            String agent = (String) request.getHeader("USER-AGENT");//获取浏览器名称
            if (agent != null && agent.toLowerCase().indexOf("firefox") > 0) {
                response.setHeader("ContentServiceImpl-Disposition", "attachment; filename=" + new String(fileName.getBytes("GB2312"), "ISO-8859-1") + ".xls");
            } else {
                response.setHeader("ContentServiceImpl-Disposition", "attachment; filename=" + java.net.URLEncoder.encode(fileName, "UTF-8") + ".xls");
            }

        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            fileName = "temp";
        }
        OutputStream fOut = null;


        Workbook workbook = bll.loadoutExcel(values);//导出创建好的Excel表格
        try {
            fOut = response.getOutputStream();
            if (workbook != null)
                workbook.write(fOut);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public Object print(HttpServletRequest request, HttpServletResponse response) {
        return null;
    }

    public void printDataTable(HttpServletRequest request, HttpServletResponse response) {

    }

    public void display(HttpServletRequest request, HttpServletResponse response) {

    }

    @RequestMapping(value = "/getMe", method = RequestMethod.POST)
    @ResponseBody
    public Object getMe(@RequestBody(required = true) Map<String, Object> p) {
        KesunReturn back = new KesunReturn();//返回操作
        AbsSuperObject temp = initParameter(p);
        if (temp == null) {
            back.setCode("0");
            back.setMessage("抱歉，系统没有获取有效参数！");
            back.setObj(null);
            return back;
        }
        AbsSuperObject model = updateModel(temp);//获取客户端参数信息
        if (model == null) {
            back.setCode("0");
            back.setMessage("抱歉，您提供参数数据存在问题，系统在转换成目标数据时失败，无法继续完成数据提取！");
            back.setObj(null);
            return back;
        }

        back=checkServiceObject(getService());
        if (back!=null)
            return back;
        else
            back=new KesunReturn();

        getService().setModel(model);
        Object tmp = getService().getMe();

        if (tmp != null && tmp instanceof AbsSuperObject) {
            model=(AbsSuperObject)tmp;
            model.setOldId(model.getId());
            back.setCode("1");
            back.setMessage("系统已经获取到您提取的数据！");
            back.setObj(model);
        }
        else
        {
            back.setCode("0");
            back.setMessage("系统没有提取到符合您要求的数据！");
            back.setObj(null);
        }
        return back;
    }

    public User GetCurrentUser() {
        /*此处写入用户操作信息，组织结构信息、角色信息*/
        Object worker =request.getSession().getAttribute("user");
        if (worker != null && worker instanceof User) {
            User user = (User) worker;
            return user;
        } else
            return null;
    }
}

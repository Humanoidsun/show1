package bll.attendance.impl;

import bll.KesunSuperService;
import bll.attendance.IApplication;
import dao.IDoData;
import entity.Application;
import kesun.entity.KesunReturn;
import kesun.entity.system.User;
import org.apache.poi.ss.usermodel.Row;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * @Author: 刘轩宇
 * @Date: 2019/6/20 14:51
 * @Version 3.2
 */
@Service("bApplication")
public class ApplicationServiceImpl extends KesunSuperService implements IApplication {
    @Resource
    private dao.attendance.IApplicationDao dao;

    public ApplicationServiceImpl(){
        setModel(new Application());
    }
    @Override
    public String getLoadoutExcelFileName() {
        return null;
    }

    @Override
    public IDoData getDAO() {
        return dao;
    }

    @Override
    public List getSaveAll(List<Row> source, User worker) {
        return null;
    }

    @Override
    public String getLoadoutExcelTemplateName() {
        return null;
    }

    @Override
    public KesunReturn findapp(Map<String, Object> map) {
        KesunReturn back=new KesunReturn();
        try{
            Object obj =dao.findapp(map);
            if (obj==null){
                back.setCode("0001");
                back.setMessage("系统没有查询到符合条件的数据！");
            }
            else
            {
                back.setCode("0002");
                back.setObj(obj);
                back.setMessage("系统已经查询到符合条件的数据！");
            }
        }catch (Exception e){
            e.printStackTrace();
            back.setCode("-1");
            back.setMessage("查询异常，异常信息：" +e.getMessage());
            back.setObj(-1);
        }
        return back;
    }

    @Override
    public KesunReturn findbyid(String id) {
        KesunReturn back=new KesunReturn();
        try{
            Object obj =dao.findbyid(id);
            System.out.println("findByid "+obj.toString());
            if (obj==null){
                back.setCode("0001");
                back.setMessage("系统没有查询到符合条件的数据！");
            }
            else
            {
                back.setCode("0002");
                back.setObj(obj);
                back.setMessage("系统已经查询到符合条件的数据！");
            }
        }catch (Exception e){
            e.printStackTrace();
            back.setCode("-1");
            back.setMessage("查询异常，异常信息：" +e.getMessage());
            back.setObj(-1);
        }
        return back;
    }

    @Override
    public int editapp(Map<String, Object> map) {
        return this.dao.editapp(map);
    }

    @Override
    public int submitApplication(Map<String, Object> map) {
        return dao.submitApplication(map);
    }

    @Override
    public List<Object> applicationSubmitFind(Map<String, Object> map) {
        return dao.applicationSubmitFind(map);
    }


}

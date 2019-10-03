package bll.attendance.impl;

import bll.KesunSuperService;
import bll.attendance.IRecordService;
import controller.KesunBusinessController;
import dao.IDoData;
import entity.Data;
import entity.Record;
import kesun.entity.KesunReturn;
import kesun.entity.system.User;
import org.apache.poi.ss.usermodel.Row;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service("UInfo")
public class InfoServiceImpl extends KesunSuperService implements IRecordService {

    @Autowired
    private dao.attendance.IRecordDao dao;

    public InfoServiceImpl() {
        setModel(new Record());
    }

    public KesunReturn findInfo(){
        KesunReturn back=new KesunReturn();
        try {
            List<Record> list = dao.findInfo();
            if (list.size()==0)
            {
                back.setCode("0");
                back.setMessage("抱歉，系统没有查询到符合条件的数据！");
            }
            else
            {
                back.setCode("1");
                back.setObj(list);
                back.setMessage("系统已经查询到符合条件的数据！");
            }
        } catch (Exception e) {
            e.printStackTrace();
            back.setCode("-1");
            back.setMessage("系统查询的过程中出现异常信息："+e.getMessage());
            back.setObj(null);
        }
        return back;
    }

    public KesunReturn findUserById(Map<String,Object> map){
        KesunReturn back=new KesunReturn();
        try {
            List<Record> list = dao.findUserById(map);
            if (list.size()==0)
            {
                back.setCode("0");
                back.setMessage("抱歉，系统没有查询到符合条件的数据！");
            }
            else
            {
                back.setCode("1");
                back.setObj(list);
                back.setMessage("系统已经查询到符合条件的数据！");
            }
        } catch (Exception e) {
            e.printStackTrace();
            back.setCode("-1");
            back.setMessage("系统查询的过程中出现异常信息："+e.getMessage());
            back.setObj(null);
        }
        return back;
    }

    public KesunReturn updateInfo(Map<String,Object> map) {
        KesunReturn back = new KesunReturn();
        try {
            int res = dao.updateInfo(map);
            if (res <= 0) {
                back.setCode("0");
                back.setMessage("抱歉，系统更新失败！");
            } else {
                back.setCode("1");
                back.setMessage("系统更新成功！");
            }
        } catch (Exception e) {
            e.printStackTrace();
            back.setCode("-1");
            back.setMessage("系统更新过程中出现异常信息：" + e.getMessage());
            back.setObj(null);
        }
        return back;
    }

    public KesunReturn insertInfo(Map<String,Object> map) {
        KesunReturn back=new KesunReturn();
        try {
            int result=(Integer) dao.insertInfo(map);
            if (result<=0)
            {
                back.setCode("0");
                back.setMessage("抱歉，您的数据保存失败！");
            }
            else
            {
                back.setCode("1");
                back.setMessage("您的数据已经成功提交！");
            }
            back.setObj(result);
        } catch (Exception e) {
            e.printStackTrace();
            back.setCode("-1");
            back.setMessage("数据保存出现异常，异常信息："+e.getMessage());
            back.setObj(-1);
        }
        return back;
    }

    public KesunReturn findUserForForm(Map<String,Object> map){
        KesunReturn back = new KesunReturn();
        try{
            List<Record> res = dao.findUserForForm(map);
            if (res.size()==0)
            {
                back.setCode("0");
                back.setMessage("抱歉，系统没有查询到符合条件的数据！");
            }
            else
            {
                back.setCode("1");
                back.setObj(res);
                back.setMessage("系统已经查询到符合条件的数据！");
            }
        } catch (Exception e) {
            e.printStackTrace();
            back.setCode("-1");
            back.setMessage("系统查询的过程中出现异常信息："+e.getMessage());
            back.setObj(null);
        }
        return back;
    }

    public KesunReturn findDepartmentForForm(Map<String,Object> map){
        KesunReturn back = new KesunReturn();
        try{
            List<Record> res = dao.findDepartmentForForm(map);
            if (res.size()==0)
            {
                back.setCode("0");
                back.setMessage("抱歉，系统没有查询到符合条件的数据！");
            }
            else
            {
                back.setCode("1");
                back.setObj(res);
                back.setMessage("系统已经查询到符合条件的数据！");
            }
        } catch (Exception e) {
            e.printStackTrace();
            back.setCode("-1");
            back.setMessage("系统查询的过程中出现异常信息："+e.getMessage());
            back.setObj(null);
        }
        return back;
    }

    public KesunReturn getUserData(Map<String,Object> map){
        KesunReturn back = new KesunReturn();
        try{
            List<Data> res = dao.getUserData(map);
            if (res.size()==0)
            {
                back.setCode("0");
                back.setMessage("抱歉，系统没有查询到符合条件的数据！");
            }
            else
            {
                back.setCode("1");
                back.setObj(res);
                back.setMessage("系统已经查询到符合条件的数据！");
            }
        } catch (Exception e) {
            e.printStackTrace();
            back.setCode("-1");
            back.setMessage("系统查询的过程中出现异常信息："+e.getMessage());
            back.setObj(null);
        }
        return back;
    }

    public KesunReturn getDepartmentData(Map<String,Object> map){
        KesunReturn back=new KesunReturn();
        try{
            List<Data> res = dao.getDepartmentData(map);
            if (res.size()==0)
            {
                back.setCode("0");
                back.setMessage("抱歉，系统没有查询到符合条件的数据！");
            }
            else
            {
                back.setCode("1");
                back.setObj(res);
                back.setMessage("系统已经查询到符合条件的数据！");
            }
        } catch (Exception e) {
            e.printStackTrace();
            back.setCode("-1");
            back.setMessage("系统查询的过程中出现异常信息："+e.getMessage());
            back.setObj(null);
        }
        return back;
    }

    @Override
    public List<Record> findByTime(Object object) {
        return this.dao.findByTime(object);
    }

    @Override
    public IDoData getDAO() {
        return dao;
    }

    @Override
    public String getLoadoutExcelFileName() {
        return null;
    }

    @Override
    public List getSaveAll(List<Row> source, User worker) {
        return null;
    }

    @Override
    public String getLoadoutExcelTemplateName() {
        return null;
    }

}

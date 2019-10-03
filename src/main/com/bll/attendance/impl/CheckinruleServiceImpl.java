package bll.attendance.impl;

import bll.KesunSuperService;
import bll.attendance.ICheckinruleService;
import controller.KesunBusinessController;
import dao.IDoData;
import dao.attendance.ICheckinruleDao;
import entity.Checkinrule;
import kesun.entity.KesunReturn;
import kesun.entity.system.User;
import org.apache.poi.ss.usermodel.Row;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service("UCheckinrule")
public class CheckinruleServiceImpl extends KesunSuperService implements ICheckinruleService {

    @Autowired
    private dao.attendance.ICheckinruleDao dao;

    @Override
    public IDoData getDAO() {
        return dao;
    }

    public CheckinruleServiceImpl() {
        setModel(new Checkinrule());
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

    @Override
    public KesunReturn findCheckinrule() {
        KesunReturn back=new KesunReturn();
        try {
            Object obj = dao.findCheckinrule();
            if (obj==null)
            {
                back.setCode("0");
                back.setMessage("抱歉，系统没有查询到符合条件的数据！");
            }
            else
            {
                back.setCode("1");
                back.setObj(obj);
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

    public KesunReturn updateCheckinrule(Map<String,Object> map){
        KesunReturn back=new KesunReturn();
        try{
            int res=dao.updateCheckinrule(map);
            if(res<=0){
                back.setCode("0");
                back.setMessage("抱歉，系统更新失败！");
            }
            else
            {
                back.setCode("1");
                back.setMessage("系统更新成功！");
            }
        } catch (Exception e) {
            e.printStackTrace();
            back.setCode("-1");
            back.setMessage("系统更新过程中出现异常信息："+e.getMessage());
            back.setObj(null);
        }
        return back;
    }
}

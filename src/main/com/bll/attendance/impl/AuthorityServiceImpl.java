package bll.attendance.impl;

import bll.KesunSuperService;
import bll.attendance.IAuthorityService;
import dao.IDoData;
import entity.Authority;
import kesun.entity.KesunReturn;
import kesun.entity.system.User;
import org.apache.poi.ss.usermodel.Row;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service("UAuthority")
public class AuthorityServiceImpl extends KesunSuperService implements IAuthorityService {

    @Autowired
    private dao.attendance.IAuthorityDao dao;

    @Override
    public IDoData getDAO() {
        return dao;
    }

    public AuthorityServiceImpl() {
        setModel(new Authority());
    }

    public KesunReturn findAuthority(Map<String,Object> map){
        KesunReturn back=new KesunReturn();
        try {
            List<Authority> list = dao.findAuthority(map);
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

    public KesunReturn findAuthorityById(Object obj){
        KesunReturn back=new KesunReturn();
        try {
            Object list = dao.findAuthorityById(obj);
            if (list==null)
            {
                back.setCode("0001");
                back.setMessage("抱歉，系统没有查询到符合条件的数据！");
            }
            else
            {
                back.setCode("0002");
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

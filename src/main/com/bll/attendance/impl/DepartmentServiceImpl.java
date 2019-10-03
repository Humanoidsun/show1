package bll.attendance.impl;

import bll.KesunSuperService;
import bll.attendance.IDepartmentService;
import dao.IDoData;
import dao.attendance.IDepartmentDao;
import entity.Department;
import kesun.entity.system.User;
import org.apache.poi.ss.usermodel.Row;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("adepertment")
public class DepartmentServiceImpl extends KesunSuperService implements IDepartmentService {

    @Autowired
    private IDepartmentDao dao;

    public DepartmentServiceImpl(){ setModel(new entity.Department()); }
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
    public Department selectbyid(Object obj) {
        return dao.selectByPrimaryKey(obj);
    }

    @Override
    public int Delete(Object id) {
        return dao.deleteByPrimaryKey(id);
    }

    @Override
    public int Update(Object obj) {
        return dao.updateByPrimaryKey(obj);
    }
}

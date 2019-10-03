package bll.attendance.impl;

import bll.KesunSuperService;
import bll.attendance.IUserManagerService;
import dao.IDoData;
import dao.attendance.IUserManagerDao;
import kesun.entity.system.User;
import org.apache.poi.ss.usermodel.Row;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("1")
public class UserManagerServiceImpl extends KesunSuperService implements IUserManagerService {
    @Autowired
    private IUserManagerDao dao;

    public UserManagerServiceImpl() {
        setModel(new entity.User());
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
    public entity.User si(Object id) {
        return dao.selectbyid(id);
    }

    @Override
    public int d(Object id) {
        return dao.dddd(id);
    }

    @Override
    public int u(Object user) {
        return dao.updateByPrimaryKey(user);
    }
}
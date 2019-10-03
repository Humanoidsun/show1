package bll.attendance.impl;

import bll.ITreeNode;
import bll.KesunSuperService;
import bll.attendance.IUserService;
import dao.IDoData;
import dao.attendance.IUserDao;
import entity.User;
import kesun.entity.KesunReturn;
import org.apache.poi.ss.usermodel.Row;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("bUser")
public class UserServiceImpl extends KesunSuperService implements IUserService {
    @Autowired
    private dao.attendance.IUserDao dao;

    public UserServiceImpl() {
        setModel(new User());
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
    public List getSaveAll(List<Row> source, kesun.entity.system.User worker) {
        return null;
    }

    @Override
    public String getLoadoutExcelTemplateName() {
        return null;
    }

    @Override
    public Object login() {
        return this.dao.login(getModel());
    }
}

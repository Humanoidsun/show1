package bll.attendance.impl;

import bll.KesunSuperService;
import bll.attendance.ISettingService;
import dao.IDoData;
import dao.attendance.ISettingDao;
import entity.Setting;
import kesun.entity.system.User;
import org.apache.poi.ss.usermodel.Row;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service("bSetting")
public class SettingServiceImpl extends KesunSuperService implements ISettingService {
    @Autowired
    public ISettingDao dao;

    public SettingServiceImpl(){
        setModel(new Setting());
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
    public Object selectByUserId(String userid) {
        return dao.selectByUserId(userid);
    }

}

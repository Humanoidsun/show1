package bll.attendance.impl;

import bll.KesunSuperService;
import bll.attendance.IWorkscheduleService;
import dao.IDoData;
import dao.attendance.IWorkscheduleDao;
import entity.Workschedule;
import kesun.entity.system.User;
import org.apache.poi.ss.usermodel.Row;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service("bWorkschedule")
public class WorkscheduleServiceImpl extends KesunSuperService implements IWorkscheduleService {

    @Autowired
    private IWorkscheduleDao dao;
    public  WorkscheduleServiceImpl(){
        setModel(new Workschedule());
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
    public List<Workschedule> findByCondition(Map<String, Object> map) {
        return dao.findByCondition(map);
    }
}

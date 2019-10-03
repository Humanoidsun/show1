package bll.attendance.impl;

import bll.KesunSuperService;
import bll.attendance.IMessageService;
import controller.KesunBusinessController;
import dao.IDoData;
import dao.attendance.IMessageDao;
import entity.Message;
import kesun.entity.system.User;
import org.apache.poi.ss.usermodel.Row;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service("aMessage")
public class MessageServiceImpl extends KesunSuperService implements IMessageService {

    @Autowired
    private IMessageDao dao;

    public MessageServiceImpl(){setModel( new entity.Message());}

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
    public Message selectbyid(String id) {
        return dao.selectByPrimaryKey(id);
    }

    @Override
    public int Delete(String id) {
        return dao.deleteByPrimaryKey(id);
    }

    @Override
    public int Update(Message message) {
        return dao.updateByPrimaryKey(message);
    }

    @Override
    public List<Object> findByCondition(Map<String, Object> map) {
        return dao.findByCondition(map);
    }
}

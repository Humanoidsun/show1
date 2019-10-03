package bll.attendance.impl;

import bll.KesunSuperService;
import bll.attendance.IRecordService;
import dao.IDoData;
import dao.attendance.IRecordDao;
import entity.Record;
import kesun.entity.KesunReturn;
import kesun.entity.system.User;
import org.apache.poi.ss.usermodel.Row;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import util.Tool;

import java.util.Date;
import java.util.List;

@Service("bRecord")
public class RecordServiceImpl extends KesunSuperService implements IRecordService {

    @Autowired
    private IRecordDao dao;

    public RecordServiceImpl() {
        setModel(new Record());
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

    public KesunReturn add(String id) {
        KesunReturn back=new KesunReturn();
        Record record = new Record();
        record.setUserid(id);
        record.setId(Tool.CreateID());
        record.setDatetime(new Date());
        record.setType("人脸识别");
        record.setStatus("迟到");
        try {
            int result=(Integer) getDAO().save(record);
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
    @Override
    public List<Record> findByTime(Object object) {
        return this.dao.findByTime(object);
    }
}

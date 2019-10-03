package bll.attendance;

import entity.Record;

import java.util.List;

public interface IRecordService {
    public List<Record> findByTime(Object object);
}

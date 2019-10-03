package dao.attendance;

import dao.IDoData;
import entity.Authority;
import entity.Data;
import entity.Record;

import java.util.List;
import java.util.Map;

public interface IRecordDao extends IDoData {
    public List<Record> findByTime(Object object);
    public List<Record> findInfo();
    public List<Record> findUserById(Object obj);
    public List<Record> findUserForForm(Map<String,Object> map);
    public List<Record> findDepartmentForForm(Map<String,Object> map);
    public int updateInfo(Map<String,Object> values);
    public int insertInfo(Map<String,Object> map);
    public List<Data> getUserData(Map<String,Object> map);
    public List<Data> getDepartmentData(Map<String,Object> map);
}

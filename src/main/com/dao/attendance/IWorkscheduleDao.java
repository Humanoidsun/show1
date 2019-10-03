package dao.attendance;

import dao.IDoData;
import entity.Workschedule;

import java.util.List;
import java.util.Map;

public interface IWorkscheduleDao extends IDoData {
    public List<Workschedule> findByCondition(Map<String,Object> map);
}

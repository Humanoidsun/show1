package bll.attendance;

import entity.Workschedule;

import java.util.List;
import java.util.Map;

public interface IWorkscheduleService {
    public List<Workschedule> findByCondition(Map<String,Object> map);

}
